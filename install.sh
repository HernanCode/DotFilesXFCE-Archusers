#!/bin/bash
clear
echo "Welcome to the EveryHost ArchUsers setup script :D"
printf "${cg}   ___ __ __    ___  ____   __ __  __ __   ___   _____ ______  \n"
printf "${cg}  /  _]  |  |  /  _]|    \ |  |  ||  |  | /   \ / ___/|      | \n"
printf "${cg} /  [_|  |  | /  [_ |  D  )|  |  ||  |  ||     (   \_ |      | \n"
printf "${cg}|    _]  |  ||    _]|    / |  ~  ||  _  ||  O  |\__  ||_|  |_| \n"
printf "${cg}|   [_|  :  ||   [_ |    \ |___, ||  |  ||     |/  \ |  |  |   \n"
printf "${cg}|     |\   / |     ||  .  \|     ||  |  ||     |\    |  |  |   \n"
printf "${cg}|_____| \_/  |_____||__|\_||____/ |__|__| \___/  \___|  |__|   \n"
printf "${cg}                      Made by Samuel Hernan                     \n" 
printf "${cg}                          EveryCode                             \n"
echo "\n"
#Ask the username
read -p 'Introduce your Linux username: ' uservar

#Creating .themes folder
mkdir /home/$uservar/.themes;

#Copy configurations to .themes folder
cp /home/$uservar/Desktop/xfce/GTK-XFWM-Everblush-Theme/Everblush /home/$uservar/Desktop/xfce/GTK-XFWM-Everblush-Theme/Everblush-xfwm/ /home/$uservar/.themes -r;

#Create icons folder on ~/.local/share/icons
mkdir /home/$uservar/.local/share/icons;

#Copy the xfce icon theme to system icons folder ~/.local/share/icons
cp /home/$uservar/Desktop/xfce/Nordzy-cyan-dark-MOD /home/$uservar/.local/share/icons -r;

#Clone another repository for change mouse
git clone https://github.com/alvatip/Radioactive-nord.git;

#Change Directory to Radioactive-nord and execute other script
cd Radioactive-nord;
sh install.sh;

#Copy the fonts to /.local/share
cp /home/$uservar/Desktop/xfce/fonts /home/$uservar/.local/share -r;

#Copy the kvantum theme to .config folder
cp /home/$uservar/Desktop/xfce/Kvantum /home/$uservar/.config -r;



#With xfconf-query apply all themes
xfconf-query -c xsettings -p /Net/ThemeName -s "Everblush";
xfconf-query -c xsettings -p /Net/IconThemeName -s "Nordzy-cyan-dark-MOD";
xfconf-query -c xfwm4 -p /general/theme -s Everblush-xfwm;
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Radioactive-nord";
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s /home/$uservar/Desktop/xfce/wallpapers/city.jpg;

#Finally copy the themes to /usr/share/
sudo cp -R /home/$uservar/.themes/Everblush /usr/share/themes/;
cp -R /home/$uservar/.local/share/icons/Nordzy-cyan-dark-MOD /home/$uservar/.icons/;
sudo cp -R /home/$uservar/.icons/Nordzy-cyan-dark-MOD /usr/share/icons;

#Optional (Don't work fine), the text dissapair on desktop. 
#xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto Regular";


#Execute neofetch at start bash terminal
echo 'neofetch' >> ~/.bashrc;
