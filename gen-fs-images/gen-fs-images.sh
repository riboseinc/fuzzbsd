#!/bin/bash
#
# gen-fs-images.sh
#
# a script for CentOS 7 to create all the file system images used in FuzzBSD

readonly __progname="$(basename $0)"

errx() {
	echo -e "${__progname}: $@" >&2
	exit 1
}

readonly release="/etc/redhat-release"
[ ! -f "${release}" ] && \
	errx "not a RHEL-like system"

grep -q CentOS "${release}" || \
	errx "only CentOS is supported"

readonly ntfs_img="ntfs.img"
readonly msdos_img="msdosfs.img"
readonly iso_img="iso.img"
readonly ext2_img="ext2fs.img"
readonly dvd_img="dvd.img"

readonly losetup="/usr/sbin/losetup"
[ ! -x "${losetup}" ] && \
	errx "cannot execute '${losetup}' (hint: yum install util-linux)"

readonly mkfs_ntfs="/usr/sbin/mkfs.ntfs"
[ ! -x "${mkfs_ntfs}" ] && \
	errx "cannot execute '${mkfs_ntfs}' (hint: yum install ntfsprogs)"

readonly mkfs_msdos="/usr/sbin/mkfs.msdos"
[ ! -x "${mkfs_msdos}" ] && \
	errx "cannot execute '${mkfs_msdos}' (hint: yum install dosfstools)"

readonly mkisofs="/usr/bin/mkisofs"
[ ! -x "${mkisofs}" ] && \
	errx "cannot execute '${mkisofs}' (hint: yum install genisoimage)"

readonly mkfs_ext2="/usr/sbin/mkfs.ext2"
[ ! -x "${mkfs_ext2}" ] && \
	errx "cannot execute '${mkfs_ext2}' (hint: yum install e2fsprogs)"

gen_ntfs() {
	# minimal size of 1049600 bytes
	local bs="$[1024 * 1025]"

	dd if=/dev/zero of="${ntfs_img}" bs="${bs}" count=1 2>/dev/null || \
		errx "dd '${ntfs_img}' failed"
	local loop="$(${losetup} -f --show ${ntfs_img})"
	[ -z "${loop}" ] && \
		errx "${losetup} -f '${ntfs_img}' failed"
	"${mkfs_ntfs}" "${loop}" 2>/dev/null >&2 || \
		errx "${mkfs_ntfs} '${loop}' failed"
	"${losetup}" -d "${loop}" 2>/dev/null >&2 || \
		errx "${losetup} -d '${loop}' failed"

	echo "[*] NTFS fs image created:"
	file "${ntfs_img}"
	ls -la "${ntfs_img}"
}

gen_msdos() {
	# 1,440 kilobytes
	local bs="$[1440 * 1024]"

	dd if=/dev/zero of="${msdos_img}" bs="${bs}" count=1 2>/dev/null || \
		errx "dd '${msdos_img}' failed"
	local loop="$(${losetup} -f --show ${msdos_img})"
	[ -z "${loop}" ] && \
		errx "${losetup} -f '${msdos_img}' failed"
	"${mkfs_msdos}" "${loop}" 2>/dev/null >&2 || \
		errx "${mkfs_msdos} '${loop}' failed"
	"${losetup}" -d "${loop}" 2>/dev/null >&2 || \
		errx "${losetup} -d '${loop}' failed"

	echo "[*] msdos fs image created:"
	file "${msdos_img}"
	ls -la "${msdos_img}"
}

gen_iso() {
	local isotmpdir="iso"
	local label="foobarbaz"

	if [ ! -d "${isotmpdir}" ]; then
		mkdir "${isotmpdir}" || \
			errx "mkdir '${isotmpdir}' failed"
	fi

	# create a dummy directory structure
	for ((i=0; i < 16; i++)); do
		if [ ! -d "${isotmpdir}/${i}" ]; then
			mkdir "${isotmpdir}/${i}" || \
				errx "mkdir '${isotmpdir}/${i}' failed"
		fi

		echo "${i}" > "${isotmpdir}/${i}/${i}"
	done

	"${mkisofs}" -V "${label}" -o "${iso_img}" "${isotmpdir}" 2>/dev/null >&2
	if [ $? -ne 0 ]; then
		rm -rf "${isotmpdir}"
		errx "${mkisofs} '${iso_img}' failed"
	fi

	rm -rf "${isotmpdir}"

	echo "[*] iso image created:"
	file "${iso_img}"
	ls -la "${iso_img}"
}

gen_dvd() {
	local dvdtmpdir="dvd"
	local label="foobarbaz"

	if [ ! -d "${dvdtmpdir}" ]; then
		mkdir "${dvdtmpdir}" || \
			errx "mkdir '${dvdtmpdir}' failed"
	fi

	# create a dummy directory structure
	for ((i=0; i < 16; i++)); do
		if [ ! -d "${dvdtmpdir}/${i}" ]; then
			mkdir "${dvdtmpdir}/${i}" || \
				errx "mkdir '${dvdtmpdir}/${i}' failed"
		fi

		echo "${i}" > "${dvdtmpdir}/${i}/${i}"
	done

	"${mkisofs}" -udf -V "${label}" -o "${dvd_img}" "${dvdtmpdir}" 2>/dev/null >&2
	if [ $? -ne 0 ]; then
		rm -rf "${dvdtmpdir}"
		errx "${mkisofs} '${dvd_img}' failed"
	fi

	rm -rf "${dvdtmpdir}"

	echo "[*] dvd image created:"
	file "${dvd_img}"
	ls -la "${dvd_img}"
}

gen_ext2() {
	local bs="$[1024 * 1024]"

	dd if=/dev/zero of="${ext2_img}" bs="${bs}" count=1 2>/dev/null || \
		errx "dd '${ext2_img}' failed"
	local loop="$(${losetup} -f --show ${ext2_img})"
	[ -z "${loop}" ] && \
		errx "${losetup} -f '${ext2_img}' failed"
	"${mkfs_ext2}" "${loop}" 2>/dev/null >&2 || \
		errx "${mkfs_ext2} '${loop}' failed"
	"${losetup}" -d "${loop}" 2>/dev/null >&2 || \
		errx "${losetup} -d '${loop}' failed"

	echo "[*] ext2 fs image created:"
	file "${ext2_img}"
	ls -la "${ext2_img}"
}

main() {
	[ "${UID}" -ne 0 ] && \
		errx "need root for 'losetup'"


	gen_ntfs
	gen_msdos
	gen_iso
	gen_dvd
	gen_ext2
}

main "$@"

exit 0
