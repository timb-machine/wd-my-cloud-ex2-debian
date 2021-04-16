#!/bin/sh

CHOCKERREPONAME="${1}"
CHOCKERROOTDIRECTORYNAME="${2}"
CHOCKERTEMPLATEREPONAME="${3}"

if [ ! -d "${CHOCKERREPONAME}" ]
then
	git clone "https://github.com/timb-machine/${CHOCKERREPONAME}" "${CHOCKERREPONAME}"
else
	cwd="${PWD}"
	cd "${CHOCKERREPONAME}"
	git pull
	cd "${cwd}"
fi
if [ -d "${CHOCKERROOTDIRECTORYNAME}" ]
then
	umount "${CHOCKERROOTDIRECTORYNAME}/host"
	for partitionname in dev proc sys tmp
	do
		umount "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
	done
	rm -ir "${CHOCKERROOTDIRECTORYNAME}"
fi
cp -rp "${CHOCKERREPONAME}/chocker" "${CHOCKERROOTDIRECTORYNAME}"
if [ ! -d "${CHOCKERROOTDIRECTORYNAME}/host" ]
then
	mkdir "${CHOCKERROOTDIRECTORYNAME}/host"
fi
mount -o bind / "${CHOCKERROOTDIRECTORYNAME}/host"
for partitionname in dev proc sys tmp
do
	if [ ! -d "${CHOCKERROOTDIRECTORYNAME}/${partitionname}" ]
	then
		mkdir "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
	fi
	mount -o bind "/${partition}" "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
done
if [ ! -d "${CHOCKERTEMPLATEREPONAME}" ]
then
	git clone "git@github.com:timb-machine/${CHOCKERTEMPLATEREPONAME}" "${CHOCKERTEMPLATEREPONAME}"
else
	cwd="${PWD}"
	cd "${CHOCKERTEMPLATEREPONAME}"
	git pull
	cd "${cwd}"
fi
if [ -x "${CHOCKERTEMPLATEREPONAME}/chocker-bootstrap.sh" ]
then
	"${CHOCKERTEMPLATEREPONAME}/chocker-bootstrap.sh" "${CHOCKERROOTDIRECTORYNAME}"
fi
umount "${CHOCKERROOTDIRECTORYNAME}/host"
for partitionname in dev proc sys tmp
do
	umount "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
done
