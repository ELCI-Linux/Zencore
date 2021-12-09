#! /bin/bash


zenity --list --checklist --height=350 --title="Thomaz" --text="Select the Valve Steam Software you would like to install?" --column="Selected" --column="Options" "" "Steam" "" "Steam Client" "" "Boxtron" "" "Proton (Stable)" "" "Proton-GE" "" "Proton (Experimental)" "" "Proton (Tricks)" "" "Vulkyn"


SBASE=$(echo $? | grep -c "Steam Client")

SLINK=$(echo $? | grep -c "Steam Link")

BOXTRON=$(echo $? | grep -c "Boxtron")


PROTONGE=$(echo $? | grep -c "Proton-GE")

PROTONS=$(echo $? | grep -c "Proton (Stable)")

PROTONX=$(echo $? | grep -c "Proton (Experimental)")

PROTONT=$(echo $? | grep -c "Proton (Tricks)")

VULKYN=$(echo $? | grep -c "Vulkyn")

FPUA=(zenity --list --radiolist --title="Thomaz: Flatpak User Access" --text="Select the users who will have access to this software: $?" --column="Options" "" "Just $user" "" "All users")



if [ $SBASE -gt '0' ]; then
flatpak --$FPUA install flathub com.valvesoftware.Steam
fi

if [ $SLINK -gt '0' ]; then
flatpak --system install flathub com.valvesoftware.SteamLink
fi

		if [ $BOXTRON -gt '0' ]; then
		sudo flatpak install -y --system runtime/com.valvesoftware.Steam.CompatibilityTool.Boxtron/x86_64/stable
                fi
		
		if [ $PROTONS -gt '0' ]; then
		sudo flatpak install -y --system runtime/com.valvesoftware.Steam.CompatibilityTool.Proton/x86_64/stable
		fi

	# Proton-GE
			if [ $PROTONGE -gt '0' ]; then
			sudo flatpak install -y --system runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable
			fi

			if [ $PROTONX -gt '0' ]; then
			sudo flatpak install -y --system runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-Exp/x86_64/stable
			fi
	# Proton Tricks
			if [ $PROTONT -gt '0' ]; then
			sudo flatpak install -y --system runtime/com.valvesoftware.Steam.Utility.protontricks/x86_64/stable
	                fi

			if [ $VULKYN -gt '0' ]; then
			sudo flatpak install -y --system runtime/com.valvesoftware.Steam.VulkanLayer.MangoHud/x86_64/stable
			fi
