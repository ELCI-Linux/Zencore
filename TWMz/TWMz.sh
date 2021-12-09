#! /bin/bash/
#TWMz.sh version 1.0

zenity --list --height=450 --checklist --title="TWM" --text="Select the tiling window manager(s) you wish to install" --column="Selected" --column="Tiling Window Manager" "" "dwm" "" "herbssluftwm" "" "i3" "" "leftwm" "" "monsterwm" "" "musca" "" "notion" "" "Qtile" "" "RatPoison" "" "sdorhefs" "" "snapwm" "" "spectrwm" "" "StumpWM" "" "Sway" "" "tilix" "" "tmux" "" "wtftw" "" "xmonad" >> TWM.txt

DWM=$(grep -c "dwm" TWM.txt)

if [ $DWM -gt '0' ]; then
sudo apt-get install dwm suckless-tools xdm dmenu xorg  -yy && echo dwm > .xsession || zenity --info --title="TWM: DWM installation error" --text="It appears the apt install failed, the backup installation method will be attempted" &&
zenity --info --title="TWM: dwm install error" --text= "apt install failed - attempting manual build" &&
sudo apt-get install git xorg libx11-dev libxft-dev libxinerama-dev xdm suckless-tools dmenu -yy &&
git clone https://git.suckless.org/dwm && sudo make clean install && echo “exec -dwm” > .xsession || zen-ty --info --title="TWM: DWM installation errors" --text="dwm could not be installed"
fi
HERB=$(grep -c "herbssluftwm" TWM.txt)
if [ $HERB -gt '0' ]; then
 sudo apt-get install herbsluftwm
fi

I3=$(grep -c "i3" TWM.txt)
if [ $I3 -gt '0' ]; then
sudo apt install i3 -yy && zenity --info --title="TWM: i3 install" --text="apt install complete" || sudo dnf install i3 && zenity --info --title="TWM: i3 install" --text="dnf install complete" ||  zenity --info --title="TWM: i3 install" --text="i3 could not be installed with apt or dnf"
	fi


LEFT=$(grep -c "leftwm" TWM.txt)
if [ $LEFT -gt '0' ]; then
sudo apt-get install -y cargo
git clone https://github.com/leftwm/leftwm.git
cd leftwm
cargo build --release
sudo install -s -Dm755 ./target/release/leftwm ./target/release/leftwm-worker ./target/release/leftwm-state ./target/release/leftwm-check ./target/release/leftwm-command -t /usr/bin
sudo install -s -Dm755 ./target/release/leftwm ./target/release/leftwm-worker ./target/release/leftwm-state ./target/release/leftwm-check ./target/release/leftwm-command -t /usr/bin
fi

MONSTER=$(grep -c "monsterwm" TWM.txt)
if [ $MONSTER -gt '0' ]; then
 cp config.def.h config.h
$EDITOR config.h
make
# make clean install
fi

MUSCA=$(grep -c "musca" TWM.txt)
if [ $MUSCA -gt '0' ]; then
 sudo apt-get install libxcb-keysyms1-dev libx11-dev libxtst-dev libxkbfile-dev libgtk2.0-dev -yy 
#pip install musca 
fi	

NOTION=$(grep -c "Notion" TWM.txt)
if [ $NOTION -gt '0' ]; then
sudo snap install notion-snap
fi
QTILE=$(grep -c "Qtile" TWM.txt)
	if [ $QTILE -gt '0' ]; then
	pip install --no-cache-dir cairocffi
		git clone git://github.com/qtile/qtile.git
		cd qtile
		pip install
		cd ..
	fi
RATPOISON=$(grep -c "RatPoison" TWM.txt)
if [ $RATPOISON -gt '0' ]; then
	sudo apt-get install -y ratpoison
	fi

SPECTRWM=$(grep -c "spectrwm" TWM.txt) 
if [ $SPECTRWM -gt '0' ]; then
sudo apt-get install spectrwm
fi


TMUX=$(grep -c "tmux" TWM.txt)
if [ $TMUX -gt '0' ]; then
sudo apt-get install tmux
fi

WTFTW=$(grep -c "wtftw" TWM.txt)
if [ $WTFTW -gt '0' ]; then
#installer requires rustc
sudo apt-get install rustc -yy

#install Xquartz
sudo apt-get install libxinerama-dev
#to run it just build
cargo build
fi

XMONAD=$(grep -c "xmonad" TWM.txt)
if [ $XMONAD -gt '0' ]; then
sudo apt-get install xmonad libghc6-xmonad-contrib-dev -yy
fi

rm TWM.txt
