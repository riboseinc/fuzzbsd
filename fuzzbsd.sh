#!/bin/sh
#
# fuzzbsd.sh v1.1
#
# FuzzBSD, a filesystem image fuzzing script to test BSD kernels.
#
# A valid filesystem image gets corrupted by changing a the hex value of a
# single offset 255 times (0x00 - 0xff). FuzzBSD will then loop through each of
# the 255 images, configures a vnode/memory disk and then attempts a mount.
# If the image fails to mount then the disk will be unconfigured and the next
# image will be tried. If the kernel panics you can check the logfile which
# offset and which hex value caused the panic.
#
# 'stringinject' from the retrace project (https://github.com/riboseinc/retrace)
# is used to corrupt the filesystem images.
#
# The following BSDs are supported:
# - NetBSD 7.1
# - OpenBSD 6.1
# - FreeBSD 11
# - DragonFlyBSD 4.8
# - Darwin 16.7.0 / macOS Sierra (COMING)
# - FreeNAS (COMING)
# - MirOS (COMING)
#
# The following filesystem image types are currently supported:
# - msdosfs
# - NTFS
# - ISO 9660
# - ext2fs
# - UDF
# - ZFS (COMING)
#
# The filesystem images used have been pre-made on CentOS 7 with the
# 'gen-fs-images/gen-fs-images.sh' script. This script allows you to recreate
# the filesystem images yourself if you don't trust the ones I have made. Not
# every BSD supports each filesystem out of the box, so it really depends on
# which flavor of BSD you are running FuzzBSD on.
#
# 255 iterations of a filesystem image are made per run.

readonly __progname="$(basename $0)"
readonly log="log.txt"
readonly header="2048"
readonly mount="fuzzbsd"

usage() {
	echo "usage: ${__progname} <type [msdos|ntfs|ext2fs|cd9660|udf]> <fs image> [offset]" >&2
}

confdisk_fbsd() {
	local conf_dev="$1"
	local conf_fs_image="$2"

	 mdconfig -a -t vnode -u "${conf_dev}" -f "${conf_fs_image}" >/dev/null 2>&1 && \
		echo "/dev/${conf_dev}"
}

confdisk_onbsd() {
	local conf_dev="$1"
	local conf_fs_image="$2"

	vnconfig -v "${conf_dev}" "${conf_fs_image}" >/dev/null 2>&1 && \
		echo "/dev/${conf_dev}"
}

confdisk_dfbsd() {
	local conf_dev="$1"
	local conf_fs_image="$2"

	vnconfig -v "${conf_dev}" "${conf_fs_image}" >/dev/null 2>&1 && \
		echo "/dev/${conf_dev}"
}

unmount_mountpoint() {
	local mnt="$1"
	local num_mount=$(mount | grep ${mnt} | wc -l | tr -d ' ')

	if [ "${num_mount}" ]; then
		i=0
		while [ "${i}" -lt "${num_mount}" ]; do
			umount -f "${mnt}" >/dev/null 2>&1
			i="$(expr ${i} + 1)"
		done
	fi
}

get_free_md_disk() {
	local md_dev="md"
	local md_max="256"

	local i=0

	# use md0 if there are no memory disks in use
	mdconfig -l -v | grep -q "${md_dev}"
	if [ $? -ne 0 ]; then
		echo "${md_dev}${i}"
		return
	fi

	while [ "${i}" -lt "${md_max}" ]; do
		mdconfig -l -v | grep -wq "^${md_dev}${i}"
		if [ $? -ne 0 ]; then
			echo "${md_dev}${i}"
			break
		fi

		i="$(expr ${i} + 1)"
	done

	echo "no memory disks available" >&2
}

get_free_vn_disk() {
	vnconfig -l | grep -q "not in use" || \
		echo "no vnode disks available" >&2

	vnconfig -l | awk '/not in use/ { print $1 }' | cut -d: -f1 | head -1
}

unconfigure_all_md_disks() {
	for unconf_md in $(mdconfig -l); do
		mdconfig -d -u "${unconf_md}" -o force >/dev/null 2>&1
	done
}

unconfigure_all_vn_disks() {
	for unconf_vn in $(vnconfig -l | grep -v 'not in use' | cut -d: -f 1); do
		vnconfig -u "${unconf_vn}" >/dev/null 2>&1
	done
}

# shared
vn=0
mntdir="/mnt"

if [ "$(id -u)" -ne 0 ]; then
	echo "need root to mount" >&2
	exit 1
fi

readonly stringinject="stringinject"
which "${stringinject}" >/dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "cannot execute '${stringinject}', hint: compile 'stringinject.c'" >&2
	exit 1
fi

if [ ! "$2" ]; then
	usage
	exit 1
fi

fuzztype="$1"
case "${fuzztype}" in
	ntfs)
		;;
	msdos)
		;;
	ext2fs)
		;;
	cd9660)
		;;
	udf)
		;;
	*)
		usage
		exit 1
		;;
esac

# flavor specific exceptions
readonly uname="$(uname)"
case "${uname}" in
	OpenBSD)
		part="c"
		confdisk="confdisk_onbsd"
		;;
	NetBSD)
		part="a"
		confdisk="confdisk_onbsd"
		;;
	FreeBSD)
		echo "${fuzztype}" | grep -q ^ntfs
		if [ $? -eq 0 ]; then
			echo "${fuzztype} fuzzing is not supported on ${uname}"
			exit 1
		fi
		confdisk="confdisk_fbsd"
		vn=1
		;;
	DragonFly)
		part=""
		confdisk="confdisk_dfbsd"
		;;
	Darwin)
		mntdir="/Volumes"
		;;
	*)
		echo "unsupported operating system"
		exit 1
		;;
esac

image="$2"
if [ ! -f "${image}" ]; then
	echo "cannot find image '${image}'" >&2
	exit 1
fi

offset=0
if [ "$3" ]; then
	offset="$3"
	check_offset="$(echo ${offset} | tr -d '[0-9]')"
	if [ ! -z "${check_offset}" ]; then
		echo "invalid offset" >&2
		exit 1
	fi
fi

if [ "${offset}" -gt "${header}" ]; then
	echo "offset cannot exceed header size (${header})" >&2
	exit 1
fi

readonly mountpoint="${mntdir}/${mount}"
if [ ! -d "${mountpoint}" ]; then
	mkdir "${mountpoint}"
	if [ $? -ne 0 ]; then
		echo "mkdir ${mountpoint} failed" >&2
		exit 1
	fi
fi

echo "[*] BSD: '${uname}'"
echo "[*] image source: '${image}'"
echo "[*] mountpoint: '${mountpoint}'"
echo "[*] offset: '${offset}'"
echo "[*] logfile: '${log}'"

while [ "${offset}" -lt "${header}" ]; do
	echo "[*] cleaning up previously used images and logfile"
	rm -f image-fuzzbsd* "${log}"

	echo "[*] running '${stringinject}' on '${image}'" | tee -a "${log}"
	"${stringinject}" "${image}" "image-fuzzbsd-${fuzztype}-${offset}" -h "${offset}"
	if [ $? -ne 0 ]; then
		echo "'${stringinject}' failed" >&2
		exit 1
	fi

	for fs_image in $(ls image-fuzzbsd*); do
		# free up the mountpoint
		unmount_mountpoint "${mountpoint}"

		# free up all the memory disks and use the first available one
		if [ "${vn}" -eq 0 ]; then
			unconfigure_all_vn_disks
			dev="$(get_free_vn_disk)"
		else
			unconfigure_all_md_disks
			dev="$(get_free_md_disk)"
		fi

		if [ -z "${dev}" ]; then
			exit 1
		fi
	
		echo "[*] $(date) confdisk '${dev}' '${fs_image}'" | tee -a "${log}"
		dev_path="$(${confdisk} ${dev} ${fs_image})"
		if [ -z "${dev_path}" ]; then
			# something went wrong so we can skip this image
			echo "confdisk failed" >&2
			continue
		fi

		# sync before a (potential) crash/panic
		sync

		echo "[*] $(date) mount '${fs_image}' '${dev_path}'" | tee -a "${log}"
		# this might cause a panic
		if [ "${vn}" -eq 0 ]; then
			mount -t "${fuzztype}" "${dev_path}${part}" "${mountpoint}"
		else
			mount -t "${fuzztype}" "${dev_path}" "${mountpoint}"
		fi

		# this might cause a panic too
		echo "[*] $(date) umount '${mountpoint}'" | tee -a "${log}"

		# if the mount was succesful then proceed to umount
		unmount_mountpoint "${mountpoint}"

		if [ "${vn}" -eq 0 ]; then
			unconfigure_all_vn_disks
		else
			unconfigure_all_md_disks
		fi
	done

	offset="$(expr ${offset} + 1)"
done

echo "[*] cleaning up images and logfile because no crash occurred"
rm -f image-fuzzbsd* "${log}"

exit 0
