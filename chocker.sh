#!/bin/sh

CHOCKERREPONAME="${1}"
CHOCKERROOTDIRECTORYNAME="${2}"
CHOCKERTEMPLATEREPONAME="${3}"

if [ ! -d "${CHOCKERREPONAME}" ]
then
	git clone "https://github.com/timb-machine/${CHOCKERREPONAME}" "${CHOCKERREPONAME}"
else
	oldpwd="${PWD}"
	cd "${CHOCKERREPONAME}"
	git pull
	cd "${oldpwd}"
fi
cp -rp "${CHOCKERREPONAME}/chocker" "${CHOCKERROOTDIRECTORYNAME}"
if [ ! -d "${CHOCKERROOTDIRECTORYNAME}/host" ]
then
	mkdir "${CHOCKERROOTDIRECTORYNAME}/host"
fi
mount -o bind / "${CHOCKERROOTDIRECTORYNAME}/host"
for partition in dev proc sys tmp
do
	if [ ! -d "${CHOCKERROOTDIRECTORYNAME}/${partition}" ]
	then
		mkdir "${CHOCKERROOTDIRECTORYNAME}/${partition}"
	fi
	mount -o bind "/${partition}" "${CHOCKERROOTDIRECTORYNAME}/${partition}"
done
if [ ! -d "${CHOCKERTEMPLATEREPONAME}" ]
then
	git clone "git@github.com:timb-machine/${CHOCKERTEMPLATEREPONAME}" "${CHOCKERTEMPLATEREPONAME}"
else
	oldpwd="${PWD}"
	cd "${CHOCKERTEMPLATEREPONAME}"
	git pull
	cd "${oldpwd}"
fi
if [ -x "${CHOCKERTEMPLATEEPONAME}/chocker-bootstrap.sh" ]
then
	"${CHOCKERTEMPLATEEPONAME}/chocker-bootstrap.sh" "${CHOCKERROOTDIRECTORYNAME}"
fi
umount "${CHOCKERROOTDIRECTORYNAME}/host"
for partition in dev proc sys tmp
do
	umount "${CHOCKERROOTDIRECTORYNAME}/${partition}"
done
