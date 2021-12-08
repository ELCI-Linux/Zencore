#! /bin/bash
touch VM.txt
zenity --list --checklist --title="VMz" --height=225 --text="Select the virtualisation software you require:" --column="Selected" --column="Software" "" "Anbox" "" "Boxes" "" "Phoenicis" "" "Virtualbox"
ANBOX=$(grep -c "Anbox" VM.txt)
BOX=$(grep -c "Boxes" VM.txt)
PHO=$(grep -c "Phoenicis" VM.txt)
VB=$(grep -c "Virtualbox" VM.txt)

if [ $ANBOX -gt '0' ]; then
sudo apt install snapd -yy
snap install --classic anbox-installer && anbox-installer -yy

snap install --devmode --edge anbox
snap refresh --edge --devmode anbox
fi

if [ $BOX -gt '0' ]; then
flatpak --user install flathub org.gnome.Boxes
fi

if [ $PHO -gt '0' ]; then
	flatpak install --user flathub org.phoenicisplayonlinux -yy
	fi

if [ $VB -gt '0' ]; then
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - &&
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -&&
	sudo apt-get update -yy &&
	sudo apt-get install virtualbox-6.1 -yy && zenity --info --title="VMz: Virtualbox installed"
fi
rm VM.txt
