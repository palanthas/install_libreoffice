#!/bin/bash
#
#	This will remove LibreOffice 4.x and install LibreOffice 5.x from tech_common
#
#	David Scholten	2016-05-10
#
#	1.0	Initial Build
#

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root"
   exit 1

else

	printf = "\n\nRetreiving files...\n"
	#copy the install files from tech_common
	rsync -rpt svr-fil1::tech_common/install_packages/Linux/LibreOffice/LibreOffice_5*/DEBS /home/dscholten/
	cd /home/dscholten

	printf = "\n\nRemoving old LibreOffice...\n"
	#remove LibreOffice 4.x
	apt-get -s -y purge libreoffice*
	
	printf = "\n\nInstalling new LibreOffice...\n"
	#install LibreOffice 5.x
	dpkg --simulate -i *.deb

fi

printf "\n\n\nLibreOffice has been installed!\n\n\n"

exit 0
