#! /bin/bash/

zenity --list --checklist --title="Samz" --text="Select the Crypto Software you would like to install:" --column="Selected" --column="Software" "" "ARK Desktop Wallet" "" "BitCoin Core" "" "PeerCoin" "" "Wasabi" >> Sam.txt

	ARK=$(cat Sam.txt | grep -c "ARK"); BCC=$(cat Sam.txt | grep -c "BCC")
	PEERCOIN=$(cat Sam.txt | grep -c "PeerCoin"); WASABI=$(cat Wasabi.txt | grep -c "Wasabi")
	if [ $ARK -gt '0' ]; then
ARKI=$(zenity --list --radiolist --title="Samz: ARK Desktop Wallet" --text="Select your installation method:" --column="Method" ".deb (64-bit)" ".tar.gz (32-bit)" "Flatpak")
		if [ "$ARKI" = ".deb (64-bit)" ]; then
		wget https://github.com/ArkEcosystem/desktop-wallet/releases/download/2.9.5/ark-desktop-wallet-linux-amd64-2.9.5.deb
		chmod +x ark-desktop-wallet-linux-amd64-2.9.5.deb
		#dependencies
		sudo apt-get install gconf2 gconf-service libappindicator1 libudev-deb
		#installation
		sudo dpkg -i ark-desktop-wallet-linux-amd64-2.9.5.deb
		elif [ "$ARKI" = '.tar.gz (32-bit)' ]; then
		wget https://github.com/ArkEcosystem/desktop-wallet/releases/download/2.9.5/ark-desktop-wallet-linux-x64-2.9.5.tar.gz
		sudo chmod u+x ark-desktop-wallet-linux-x64-2.9.5.tar.gz
		tar xvzf ark-desktop-wallet-linux-x64-2.9.5.tar.gz
		cd ./ark-desktop-wallet-linux-x64-2.9.5
		./configure
		make
		sudo make install
		elif [ "$ARKI" = 'Flatpak' ]; then
		flatpak install flathub io.ark.Desktop
		fi
	fi
	BITCOINCORE=$(grep -c "BitCoin Core" $)
BCC=$(zenity --list --radiolist --height=200 --title="Samz: BitCoin Core" --text="How would you like to install BitCoin Core?")
		if [ $BCC == 'apt' ]; then
		sudo apt-add-repository ppa:bitcoin/bitcoin &&
		sudo apt-get update
		sudo apt-get install bitcoin-qt
		elif [ $BCC == 'Flatpak' ]; then
        	flatpak install flathub org.bitcoincore.bitcoin-qt
		fi


	if [ $PEERCOIN -gt '0' ]; then
	PCI=(zenity --list --radiolist --title="PeerCoin" --text="How would you like to install PeerCoin?" --column="Selection" "" "apt" "" ".tar.gz (32-bit)" "" "Flatpak")
		if [ "$PCI" == "apt" ]; then
		sudo apt-get update
    		sudo apt-get install apt-transport-https
    		sudo sh -c "echo 'deb https://peercoin.github.io/deb-repo/ buster main' >> /etc/apt/sources.list.d/peercoin.list"
    		wget -O - https://peercoin.github.io/deb-repo/peercoin.apt.key | sudo apt-key add -
    		sudo apt-get update
    		sudo apt-get install peercoin-qt
		elif [ "$PCI" == ".tar.gz (32-bit)" ]; then
		wget https://github.com/peercoin/peercoin/releases/download/v0.11.0ppc/peercoin-0.11.0-x86_64-linux-gnu.tar.gz
        sudo chmod u+x peercoin-0.11.0-x86_64-linux-gnu.tar.gz
                tar xvzf peercoin-0.11.0-x86_64-linux-gnu.tar.gz
                cd ./peercoin-0.11.0
                cd ./bin
                chmod +x ./peercoin-qt
                sudo ./peercoin-qt
		elif [ "$PCI" == "Flatpak" ]; then
		flatpak install flathub net.peercoin.peercoin-qt
		fi


if [ $WASABI -gt '0' ]; then
	WSI=(zenity --list --radiolist --title="Wasabi" --text="How would you like to install PeerCoin?" --column="Selection" "" "apt")
	#".tar.gz (32-bit)" "Flatpak")
		if [ "$PCI" == "apt" ]; then
		flatpak install flathub io.wasabiwallet.WasabiWallet
#		elif [ $WSI == ".tar.gz (32-bit)" ]; then
#		elif [ $WSI == "Flatpak" ]; then
		fi
