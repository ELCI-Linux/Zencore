#! /bin/bash
#This installer was created by ELCI MEDIA UK

chmod +x AndroidX.sh
chmod +x AndroidCopyX.sh
chmod +x scrcpy-install.sh

echo  "Sorry this customisation feature hasn't been implemented into AndroidX.sh yet." &&
sudo apt install libgnome2-bin  &&
cd /androidstudio/ &&
	gnome-open  Install-Linux-tar.txt
echo "Smart Choice, keep things simple!"

wget -q https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.2.2.0/android-studio-ide-202.7486908-linux.tar.gz

sudo tar -xvf android-studio-ide-202.7486908-linux.tar.gz -C /home/
cd android-studio-ide-202.7486908-linux/bin
./studio.sh &&

	
echo "Scrcpy provides low-latency wired and wireless screen mirroring from your Android Device to this PC"
echo "Would you like to install scrcpy?"
bash scrcpy-installX.sh





















bash scrcpy-install.sh

echo "Please enable developer settings on your Android device, connect via USB and grant permission for this PC to use debugging"
echo "No sweat, you can install scrcpy later by re-running this installer" &&



echo "Would you like to enable wireless scrpy?"

echo "OK identifying device ip" &&
ifconfig | grep inet | awk '{print $2}'| grep 192 |awk '{print $1}' &&
sudo apt-get install ifconfig &&
ifconfig | grep broadcast7
echo "Running nmap"

echo "Converting list"
echo "Running flathub searche"
echo "No sweat, you can install scrcpy later by re-running this installer" &&

echo "Would you like to copy your photos from your phone?"


sleep 1s

echo "In the past, creating a repo has been difficult because you had to have knowledge on the command line," &&
sleep 1s &&
echo "needed to edit text files to edit your packages’ store details" &&
sleep 1s &&
echo "and had to paste screenshots in a special system of directories to have them served well inside the F-Droid app." &&
sleep 1s &&
echo "This all got easier now: with Repomaker, you are able to create your own repo and do not need to have any special knowledge to do so." &&
sleep 1s &&
echo "Would you like to create custom repositories using Repomaker?"

echo "OK installing Repomaker"
flatpak install flathub org.fdroid.Repomaker
echo "Ok, we will move on" 
