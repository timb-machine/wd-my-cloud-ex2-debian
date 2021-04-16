#!/bin/sh

CHOCKERCHROOT="${1}"

# prepare chroot
if [ ! -d "${CHOCKERCHROOT}/host" ]
then
	mkdir "${CHOCKERCHROOT}/host"
fi
mount -o bind / "${CHOCKERCHROOT}/host"
for partitionname in dev proc sys tmp opt/pkgsrc opt/pkg
do
	if [ ! -d "${CHOCKERCHROOT}/${partitionname}" ]
	then
		mkdir "${CHOCKERCHROOT}/${partitionname}"
	fi
	mount -o bind "/${partitionname}" "${CHOCKERCHROOT}/${partitionname}"
done
# start chroot'ed services
if [ -x "${CHOCKERCHROOT}/chocker-init.sh" ]
then
	chroot "${CHOCKERCHROOT}" /chocker-init.sh &
fi
