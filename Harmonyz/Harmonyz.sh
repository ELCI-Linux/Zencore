#! /bin/bash/
	zenity --list --height=450 --width=400 --checklist --title="Harmonyz" --text="Select your Audio Players" --column="Selected" --column="Music Player" --column="DSP or Local" --height=300 --width=300 "" "Apple Music" "DSP" "" "Audacious" "Local" "" "Byte" "Local" "" "CMUS" "Local" "" "Deezer" "DSP" "" "Gnome Music Player"  "Local" "" "Hydrogen" "Local" "" "Lyrics" "Local" "" "Spotify" "DSP" "" "Strawberry" "Local (Install for Tidal" >> Harmony.txt


	HAM=$(cat Harmony.txt | grep -c "Apple Music")
	if [ $HAM -gt '0' ]; then
 	sudo apt-get install snap snapd -yy
	sudo snap install apple-music-for-linux
	fi

	HAU=$(cat Harmony.txt | grep -c "Audacious")
	if [ $HAU -gt '0' ]; then
	flatpak install flathub org.atheme.audacious -yy
	fi

	HBY=$(cat Harmony.txt | grep -c "Byte")
	if [ $HBY -gt '0' ]; then
	flatpak install flathub com.github.alainm23.byte -yy
	fi

	HDE=$(cat Harmony.txt | grep -c "Deezer")
	if [ $HDE -gt '0' ]; then
	sudo apt-get install flatpak -yy
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak remote-add --if-not-exists nuvola https://dl.tiliado.eu/flatpak/nuvola.flatpakrepo
	flatpak update yy
	flatpak install nuvola eu.tiliado.NuvolaAppDeezer -yy && flatpak run eu.tiliado.NuvolaAppDeezer -yy
	flatpak run eu.tiliado.NuvolaAppDeezer
	fi

	HCM=$(cat Harmony.txt | grep -c "CMUS")
	if [ $HCM -gt '0' ]; then
	sudo apt-get install libao-ocaml-dev cmus -yy
	fi

	HGN=$(cat Harmony.txt | grep -c "Gnome Music Player")
	if [ $HGN -gt '0' ]; then
	flatpak install flathub org.gnome.Music -yy
	fi

	HH=$(cat Harmony.txt | grep -c "Hydrogen")
	if [ $HH -gt '0' ]; then
	flatpak install org.hydrogenmusic.Hydrogen -yy
	fi

	HLY=$(cat Harmony.txt | grep -c "Lyrics")
	if [ $HLY -gt '0' ]; then
	flatpak install flathub com.github.naaando.lyrics -yy
	fi

	HSP=$(cat Harmony.txt | grep -c "Spotify")
	if [ $HSP -gt '0' ]; then
	flatpak install flathub com.spotify.Client -yy
	fi

	HST=$(cat Harmony.txt | grep -c "Strawberry")
	if [ $HST -gt '0' ]; then
	sudo add-apt-repository ppa:jonaski/strawberry
	sudo apt-get update
	sudo apt-get install strawberry -yy
		zenity --question --title="Tidal Support?" --text="Harmony has detected you have successfully installed Strawberry. Would you like to add TIDAL support?"
		if [ $? -gt '0' ]; then
		sudo mkdir ./TIDAL-API
		
			API=$(zenity --list --checklist --title="TIDAL API Source?" --text="Harmonyz needs access to your TIDAL APIs to complete this process. Please select a platform where you have an existing installation of TIDAL available." --column="Selected" --column="Platform" "" "Android" "" "Locate Manually (Windows)")
		
			APIA=$(echo $API | grep -c "Android")
			if [ $APIA -gt '0' ]; then
			adb pull /storage/emulated/0/Android/data/com.aspiro.tidal/cache
			fi
	
			APIW=$(echo $API | grep -c "Locate Manually (Windows)")
			if [ $APIW -gt '0' ]; then
			APILOC=$(zenity --file-selection --directory)
			cp $APILOC ./TIDAL-API
			fi
		fi
	fi

		#backup conf and replace with tidal compatible version
		mkdir ./confbackups
		sudo cp ~/.config/pulse/daemon.conf ./confbackups &&
		sudo cp -i ./confbackups/daemon.conf ~/.config/pulse/daemon.conf && zenity --info --title="Harmonyz:TIDAL" --text="Your existing 'daemon.conf' file was replaced with a TIDAL Hi-Fi compatible version, a back-up is stored at ./confbackups"
		rm Harmony.txt
