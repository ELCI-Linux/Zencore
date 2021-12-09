#! /bin/bash/


zenity --list --checklist --title="VidConfz" --text="Select your video conferancing software" --column="Selected" --column="Software" "" "Skype" "" "Teams" "" "Zoom" >> VC.txt

SKYPE=$(grep -c "Skype" VC.txt)
ZOOM=$(grep -c "Zoom" VC.txt)
TEAMS=$(grep -c "Teams" VC.txt)

if [ $ZOOM -gt '0' ]; then
flatpak install flathub us.zoom.Zoom -yy
fi

if [ $TEAMS -gt '0' ]; then
flatpak install flathub com.microsoft.Teams -yy
fi

if [ $SKYPE -gt '0' ]; then
flatpak install flathub com.skype.Client -yy 
fi

TOTAL=$(($ZOOM + $TEAMS + $SKYPE))
if [ $TOTAL -gt '0' ]; then
zenity --info --title="VidConfz Finished" --text="All installation requests have been handled"
elif [ $TOTAL -eq '0' ]; then
zenity --info --title="VidConfz" --title="No installations requested, VidConfz will close"
fi
