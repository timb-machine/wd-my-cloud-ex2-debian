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
	for partitionname in dev proc sys tmp host
	do
		umount "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
	done
	find "${CHOCKERROOTDIRECTORYNAME}" -type l -exec rm {} \;
	rm -rf "${CHOCKERROOTDIRECTORYNAME}"
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
	mount -o bind "/${partitionname}" "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
done
if [ ! -d "${CHOCKERTEMPLATEREPONAME}" ]
then
	git clone "git@github.com:timb-machine/${CHOCKERTEMPLATEREPONAME}" "${CHOCKERTEMPLATEREPONAME}"
else
	cwd="${PWD}"
	cd "${CHOCKERTEMPLATEREPONAME}"
	git pull
	if [ -x chocker-bootstrap.sh ]
	then
		if [ -n "$(printf "${CHOCKERROOTDIRECTORYNAME}" | grep "^/")" ]
		then
			./chocker-bootstrap.sh" "${CHOCKERROOTDIRECTORYNAME}"
		else
			./chocker-bootstrap.sh" "${cwd}/${CHOCKERROOTDIRECTORYNAME}"
		fi
	fi
	cd "${cwd}"
fi
umount "${CHOCKERROOTDIRECTORYNAME}/host"
for partitionname in dev proc sys tmp host
do
	umount "${CHOCKERROOTDIRECTORYNAME}/${partitionname}"
done
