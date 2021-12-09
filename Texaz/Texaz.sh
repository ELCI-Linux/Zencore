#! /bin/bash/
# Texaz v1
touch Texas.txt
#Program
zenity --list --checklist --titles="Texaz" --text="Select your desired text editor(s)" --column="Selected" --column="Text Editors" "" "Atom" "" "emacs" "" "Micro" "" "Nano" "" "Vim" "" "VS Code" >> Texas.txt


if [ $ATOM -gt '0' ]; then
sudo add-apt-repository ppa:webupd8team/atom &&
	sudo apt-get update &&
	sudo apt-get install atom
fi
#emacs install methods to be added later
EMACS=$(grep -c "emacs" Texas.txt)
if [ $EMACS -gt '0' ]; then
sudo apt-get install emacs -yy
fi
MICRO=$(grep -c "Micro" Texas.txt)
if [ $MICRO -gt '0' ]; then
curl -o eget.sh https://zyedidia.github.io/eget.sh
shasum -a 256 eget.sh
bash eget.sh &&
curl https://getmic.ro
fi
NANO=$(grep -c "Nano" Texas.txt)
if [ $NANO -gt '0' ]; then
	sudo apt-get install nano
fi
VIM=$(grep -c "Vim" Texas.txt)
if [ $VIM -gt '0' ]; then
       sudo apt-get install vim
fi

VSC=$(grep -c "VS Code" Texas.txt)
if [ $VSC -gt '0' ]; then
       wget -s https://az764295.vo.msecnd.net/stable/c13f1abb110fc756f9b3a6f16670df9cd9d4cf63/code_1.61.1-1634175470_amd64.deb && 
	chmod u+x code_1.61.1-1634175470_amd64.deb &&
	sudo dpkg -i code_1.61.1-1634175470_amd64.deb
fi
rm Texas.txt
