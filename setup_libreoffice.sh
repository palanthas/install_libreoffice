#!/bin/bash
#
#	This will remove LibreOffice 4.x and install LibreOffice 5.x from tech_common
#
#	David Scholten	2016-05-10
#
#	1.1	Initial Build
#

$rsync_target="CHANGE_TO_RSYNC_LOCATION"

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root"
   exit 1

else

	#copy the install files from tech_common
	cd $HOME
	rsync -rpt $rsync_target ./

	#remove LibreOffice 4.x
	apt-get -y purge libreoffice*
	
	#install LibreOffice 5.x
	dpkg -i *.deb

fi

printf "\n\n\nLibreOffice has been installed!\n\n\n"

exit 0

## Testing Branching ##
