# Zencore
Zencore is a Zenity powered alternative to the elci.sh CLI progam, designed for debian based systems.


#! /bin/bash/

#Zencore 2.0 Script Example


#this document provides the script lay-out for future zencore entries.

#variables 

#helper - name of helper
#versnum - helper version number
#LCDEP - INSTALLATION METHOD
# purpose - what the helper does (e.g. Installs media servers)
#CLM - Command Line mode
#GUI Graphic user Interface mode

#routes
#For CLI utilities use ELCI-Linux/elci.sh (due to become deprecated)
# For GUI utilities use ELCI-Linux/Zencore


#Start-up

zenity --info --title="$helpername $versnum" /
    --text="$helper $versnum was developed by The ELCI Group Ltd. This software uses: $LCDEP to $purpose"
    
    #mode (mandatory) 
    #the CLM and GUI variables are used to determine whether to run scripts entirely in the command line or entirely using zenity
    
        zenity --list --radiolist /
        --column="Selected" --column="Mode" /
                     ""   --"Command-Line" /
                     ""   --"Graphical User Interface" >> $helper-mode.txt
                     
                     
          # use (grep -c) to create a binary record of selected option
          # this is recommended as the wildcard $? will be needed later
         CLM=$(grep -c "Command-Line")
         GUI=$(grep -c "Graphical User Interface")
    
    # create each process with an if/elif statement 
        if [ $CLM -gt '0' ]; then
        PROCESS
        fi
        
        
        #print text
        echo "example"
        # print file
        cat "example.txt"
        # continue
        read -p "Are you sure? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ ! $REPLY =~ ^[Yy]$ ]]
        then
        exit 1; fi
        # yes or no question (numeric)
        select $yn in "Yes" "No";
        case yn in
        Yes) positive ;;
        No ) negative ;;
        esac
        # yes or no command (read)
        while true; do
        read -p "Do you wish to install this program?" yn
        case $yn in
            [Yy]* ) make install; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
        done
        
        
        # select single option from list
        # include 'break' on a new line or '&& break' or a line with the end of a command chain to prevent looping or exclude to allow
        PS3='Question for end user'
        select app in vlc clementine; do
        case $app in
        vlc) sudo apt-get install vlc;;
        clementine) sudo apt-get install clementine;;
        esac
        done
        
        elif [ $GUI -gt '0' ]; then
        PROCESS
        #print text
        zenity --info --title="$helper" /
        --text="example" 
        #(or make a variable and include it within the speechmarks)

    #progress (optional)
    #if you would like to include a progress meter you must enclose all relevant elememts of the script within brackets
            helper=$'Bobbi Installer'
            versnum=$'1.0'
            purpose=$'install vlc player'
            zenity --info --title="$helper $versnum" /
    --text="$helper $versnum was developed by The ELCI Group Ltd. This software uses: $LCDEP to $purpose. When you press 'ok', $helper will $purpose"
        (if [ $? -eq '0' ]; then
        echo "33"
        sudo apt-get update
        echo "66"
        sudo apt-get install vlc
        echo "100"
        fi ) | zenity --progress --title="VLC Installer" --text=
   
# multi function (replicate where needed)

  zenity --list --title="$helper $vernum" --text="Example: Please select an option" /
        --column="Selected" --column="Purpose"

#single function (replicate where needed)

 zenity --list --radiolist --title="$helper $vernum" --text="Example: Please select an option" /
    --column="Selected" --column="Purpose"/
                ""    "Function 1"    /
                ""    "Function 2"    /
                
# how to exploit zenity output
#Method 1 (recommended)


 zenity --list --radiolist --title="$helper $vernum" --text="Example: Please select an option" /
    --column="Selected" --column="Purpose"/
                ""    "Function 1"    /
                ""    "Function 2"    /
            $helper-function.txt
                
    # create a variable: the grep count command to read how many instances of each output are within your new text file
    
    
    FUN1=$(grep -c "Function1" $helper-function.txt)
    
    # use an if statement to determine whether a users input signified an action
    # mimic the spacing of the text exact as so
    # the 'then' command will then run every command from the line below
    
    if [ $FUN1 -gt '0' ]; then
    #try to explain each line or series of lines
    sudo apt-get install vlc
    fi
    
    # each if statement should end with ";fi" or "fi" on a new line unless...
    
   
#create a variable (e.g. $var) and set it equal to the zenity list command (e.g. var=$(zenity --list...) ).

  
    if [ $FUN1 -gt '0' ]; then
    sudo apt-get install vlc
    elif [ $FUN1 -eq '0' ]; then
    #explain why these actions are being carried out (e.g. user has selected recommended video player)
    sudo apt-get install clementine
    fi
    
    
#scales
#there may be circumstance in which you wish to have users enter numerical input in a graphical manner
# the best way to use these inputs is by embedding the zenity command within a variable 

allocation=$(zenity --scale  --title="Custom Disk Manager" --text="Select the size of the new partition" --value=64 --max-value="100" --step=64 --print-partial)


# follow with an appropriate if statement or command featuring "allocation" or chosen variable

# full demonstration - flatpak

#variables 

helper=$"flatpak"
versnum=$"1.0"
LCDEP="apt OR compiling"
purpose=$"Installs flatpak"

#CLM - Command Line mode
#GUI Graphic user Interface mode

#routes
#For CLI Apolications+utilities use ELCI-Linux/elci.sh (due to become deprecated)
# For GUI applications+utilities use ELCI-Linux/Zencore


#Start-up

zenity --info --title="$helpername $versnum" /
    --text="$helper $versnum was developed by The ELCI Group Ltd. This software uses: $LCDEP to $purpose"
zenity --list --radiolist /
        --column="Selected" --column="Mode" /
                     ""   --"Command-Line" /
                     ""   --"Graphical User Interface" >> $helper-mode.txt
                     
                     
          # use (grep -c) to create a binary record of selected option
          # this is recommended as the wildcard $? will be needed later
          
         
         CLM=$(grep -c "Command-Line")
         GUI=$(grep -c "Graphical User Interface")

if [ $CLM -gt '0' ]; then

zenity --info --title="$helper: "


elif [ $GUI -gt '0' ]; then
