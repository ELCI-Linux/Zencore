#! /bin/bash/

zenity --list --checklist  --title="Lapi" --text="Select the applications you would like to install?" --column="Selected" --column="Application" --column="Functionality" "" "Touche" "Multi-TouchS Support" "" "Auto-CPU" "Power Management"

flatpak install $FPUA flathub com.github.joseexposito.touche | grep -A 2 Installing


zenity --list --checklist  --title="Lapi" --text="How would you like to install auto-cpufreq?" --column="Selected" --column="Method" "" "Git" "" "Snap" >> CPUSEL.txt

SNAP=$(cat CPUSEL.txt | grep -c "Snap")
GIT=$(cat CPUSEL.txt | grep -c "Git")


	if [ $SNAP -gt '0' ]; then
	sudo snap install auto-cpufreq
	fi

	if [ $GIT -gt '0' ]; then
	git clone https://github.com/AdnanHodzic/auto-cpufreq.git
	cd auto-cpufreq && sudo ./auto-cpufreq-installer
	fi
rm CPUSEL.txt
