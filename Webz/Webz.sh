#! /bin/bash
rm Webz.txt
zenity --list --height=500 --checklist --title="Webz" --text="Select the browser(s) you want to install" --column="Selected" --column="Web Browsers" "" "Brave (Stable)" "" "Brave BETA" "" "Chrome" "" "Epiphany" "" "Falkon" "" "Firefox" "" "Konqueror" "" "Links" "" "Midori" "" "Min" "" "Opera" "" "Pale Moon" "" "SlimJet" "" "Water Fox" "" "Vivaldi" >> Webz.txt

	BRAVE=$(grep -c "Brave (Stable)" Webz.txt)
		if [ $BRAVE -gt '0' ]; then
		sudo apt install apt-transport-https curl -yy
		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &&
		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list -yy &&
		sudo apt update -yy &&
		sudo apt install brave-browser -yy
		fi

	BETAB=$(grep -c "Brave BETA" Webz.txt)
		if [ $BETAB -gt '0' ]; then
		sudo apt install apt-transport-https curl -yy &&
		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg &&
		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list -yy &&
		sudo apt update -yy &&
		sudo apt install brave-browser-beta -yy
		fi

	CHROME=$(grep -c "Chrome" Webz.txt);
		if [ $CHROME -gt '0' ]; then
		curl https://www.google.com/intl/en_uk/chrome/thank-you.html?installdataindex=empty&statcb=0&defaultbrowser=0#

		tar google-chrome-stable_current_amd64.deb
		fi

	EPIPHANY=$(grep -c "Epiphany" Webz.txt)
		if [ $EPIPHANY -gt '0' ]; then
		sudo dnf install snapd
        	sudo ln -s /var/lib/snapd/snap /snap
        	sudo snap install epiphan
		fi

	FALKON=$(grep -c "Falkon" Webz.txt)
		if [ $FALKON -gt '0' ]; then
		sudo dnf install snapd
        	sudo ln -s /var/lib/snapd/snap /snap
        	sudo snap install falkon
		fi

	FIREFOX=$(grep -c "FireFox" Webz.txt)
		if [ $FIREFOX -gt '0' ]; then
		sudo add-apt-repository ppa:mozillateam/firefox-next -yy
        	sudo apt-get update -yy && sudo apt-get upgrade -yy
        	sudo apt-get install firefox -yy
		fi

	KONQUEROR=$(grep -c "Konqueror" Webz.txt)
		if [ $KONQUEROR -gt '0' ]; then
		sudo apt install konqueror
		fi

	LINKS=$(grep -c "Links" Webz.txt)
		if [ $LINKS -gt '0' ]; then
		sudo mkdir ./LinksInstallFiles
        	cd ./LinksInstallFiles  &&
       		wget http://links.twibright.com/download/links-2.23.tar.gz | tar -xf
        	tar -xf links-2.23.tar.gz &&
        	cd ./links-2.23 &&
		sudo apt install build-essentials
		sudo ./configure ; make ./Makefile &&
        	sudo make install &&
        	cd .. ; cd .. && rm -r ./LinksInstallFiles 
		fi

	MIN=$(grep -c "Min" Webz.txt)
		if [ $MIN -gt '0' ]; then
		wget -o Min.deb https://github.com/minbrowser/min/releases/download/v1.21.0/min_1.21.0_amd64.deb
        	sudo dpkg -i min_1.21.0_amd64.deb
		fi

	MIDORI=$(grep -c "Midori" Webz.txt)
		if [ $MIDORI -gt '0' ]; then
		flatpak install flathub org.midori_browser.Midori
		fi

	OPERA=$(grep -c "Opera" Webz.txt)
		if [ $OPERA -gt '0' ]; then
		sudo add-apt-repository 'deb https://deb.opera.com/opera-stable stable non-free'
        	wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -
        	sudo apt-get update -yy
       		sudo apt-get install opera-stable -yy
		fi

	PALEMOON=$(grep -c "Pale Moon" Webz.txt)
		if [ $PALEMOON -gt '0' ]; then
		echo 'deb http://download.opensuse.org/repositories/home:/stevenpusser/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:stevenpusser.list
        	curl -fsSL https://download.opensuse.org/repositories/home:stevenpusser/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_stevenpusser.gpg > /dev/null
        	sudo apt update 
       		sudo apt install palemoon
		fi

	SLIMJET=$(grep -c "SlimJet" Webz.txt)
		if [ $SLIMJET -gt '0' ]; then
		wget -o ./Slimjet.deb && https://www.slimjet.com/download.php?version=lnx64&type=deb&beta=&server=
        	sudo dpkg -i Slimjet.deb
		fi

	WATERFOX=$(grep -c "Water Fox" Webz.txt)
		if [ $WATERFOX -gt '0' ]; then
		sudo mkdir ./WaterFoxInstall
		cd ./WaterFoxInstall
        	wget -o ./Waterfox.tar.bz2 https://cdn.waterfox.net/releases/linux64/installer/waterfox-G3.2.5.en-US.linux-x86_64.tar.bz2
        	tar -xjf waterfox-G3.2.5.en-US.linux-x86_64.tar.bz2 && sudo mkdir ~/ELCI-Installs ; sudo cp -r ./waterfox ~/ELCI-Installs &&
		cd .. && rm -r ./WaterFoxInstall
		fi

	VIVALDI=$(grep -c "Vivaldi" Webz.txt)
		if [ $VIVALDI -gt '0' ]; then
		sudo apt-get install vivaldi
		fi

