#! /bin/bash/

touch Sesamez.txt
zenity --list --checklist --height=210 --width=400 --title="Sesamez" --text="Select your desired password manager" \
	--column="Selected" --column="Password Manager"  --column="Installation Methods" \
	""	"bitwarden"	"snap"	\
	""	"KeePass"	"apt-get"	\
	""	"LastPass"	"built using shell" \
	""	"Pass"		"apt-get" >> Sesamez.txt


BW=$(grep -c "bitwarden" Sesamez.txt)
if [ $BW -gt '0' ]; then
snap install bitwarden
fi

PASS=$(grep -c "Pass" Sesamez.txt)
if [ $PASS -gt '0' ]; then
sudo apt-get install pass
fi
MANAGE=$(grep -c "Manage" Sesamez.txt)
#if [ $MANAGE -gt '0' ]; then

#fi

LASTPASS=$(grep -c "LastPass" Sesamez.txt)
if [ $LASTPASS -gt '0' ]; then
	wget https://download.cloud.lastpass.com/linux/lplinux.tar.bz2 && zenity --info --title="Sesamez: LastPass Download" --text="LastPass Download successful" || zenity --info --title="LastPass download failed"
 	tar xjvf lplinux.tar.bz2
 	./install_lastpass.sh
fi
KEEPASS=(grep -c "KeePass" Sesamez.txt)
if [ $LASTPASS -gt '0' ]; then
sudo apt-get install keepass2
fi
