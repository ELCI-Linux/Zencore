#! /bin/bash/

sudo cd /usr/bash
ANMIR=$(zenity --list --checklist --title="Screen and Sound Mirroring (Android >> Desktop)" --text="Please select the mirroring functionality you would like to install" --column="Selected" --column="Functionality" "" "Screen Mirroring" "Sound Mirroring")

SCM=$(echo $ANMIR | grep -c "Screen")
SOM=$(echo $ANMIR | grep -c "Sound")

if [ $SCM -gt '0' ]; then
zenity --info --title="Scrcpy install..." --text="Attempting 'sudo apt-get install scrcpy'.."
sudo apt-get install scrcpy
fi

if [ $SOM -gt '0' ]; then

zenity info --title="Sndcpy install..." --text="Cloning Snpcpy from github"

git clone https://github.com/rom1v/sndcpy/releases/download/v1.0/sndcpy-v1.0.zip

unzip -d sndcpy-v1.0.zip

cd /sndcpy-v1.0

zenity --question --title="Copy APK to android?" --text="This program can copy the required APK for sndcpy directly to your device, would you like to do this via your desktop?"
if [ $? -eq '1' ]; then 
mobloc=$(zenity --file-selection --title="Select your Android devices downloads directory" --directory)
mv sndcpy.apk $mobloc
fi

sudo mv sndcpy.sh /usr/bash
cd /usr/bash
chmod +x sndcpy.sh
bash sndcpy.sh
fi
exit
