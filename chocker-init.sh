#!/bin/sh

CHOCKERCHROOT="${1}"

if [ ! -d "${CHOCKERCHROOT}/host" ]
then
	mkdir "${CHOCKERCHROOT}/host"
fi
mount -o bind / "${CHOCKERCHROOT}/host"
for partitionname in dev proc sys tmp
do
	if [ ! -d "${CHOCKERCHROOT}/${partitionname}" ]
	then
		mkdir "${CHOCKERCHROOT}/${partitionname}"
	fi
	mount -o bind "/${partitionname}" "${CHOCKERCHROOT}/${partitionname}"
done
if [ -x "${CHOCKERCHROOT}/chocker-init.sh" ]
then
	chroot "${CHOCKERCHROOT}" /chocker-init.sh &
fi
