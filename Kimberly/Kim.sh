#! /bin/bash


zenity --list --checklist --title="Kimberly" --text="Select your instagram clients" --column="Selected" --column="Client" "" "instagramport" "" "instagraph" >> Kim.txt
	IGP=$(cat Kim.txt | grep -c "instagramport")
	ING=$(cat Kim.txt | grep -c "instagraph")
PW=$(zenity --text-entry --title="Kimberly needs sudo access" --text="Enter the sudo user password" --entry-text="password")
		sudo apt-get update
		xdotool type $PW

		if [ $IGP -gt '0' ]; then
		sudo snap install instagramport
		fi

		if [ $ING -gt '0' ]; then
		sudo snap install instagraph
		fi
