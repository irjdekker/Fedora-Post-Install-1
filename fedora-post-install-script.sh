#!/etc/bash

# This is a start up script to help assist in setting up
# a new Fedora installation. This is based on/off Fedora
# 25. There are intermediate and manual steps within
# these lines that may need to be installed or called,
# such as setting up wireless drivers.


#### UPDATE ####
# Update current settings and package listings
sudo dnf upgrade # (update is deprecated)

#### DEVELOPMENT TOOLS ####
# Install Kernel Development tools and packages
sudo dnf install -y kernel-devel

#### RPM FUSION REPO ####
# Add rpmfusion needed for some proprietary drivers
# sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#### BROADCOM WIRELESS ####
# Install Wireless packages
# sudo dnf install -y broadcom-wl
# sudo akmods --force --kernel `uname -r` --akmod wl
# sudo modprobe -a wl

#### USER DEFINED ALIASES ####
# Append user specific aliases
echo "alias ll='ls -laFh'">> ~/.bashrc
source ~/.bashrc

#### VIM ####
# Install Vim
sudo dnf install -y vim

#### ENPASS ####
# Download the installer from https://www.enpass.io/download-linux/
sudo dnf install -y libXScrnSaver lsof
cd ~/Downloads/
chmod +x Enpass_Installer.*
./Enpass_Installer*
cd ~
# Sign in to the cloud account to sync with passwords
# Add settings value to configuration file
# ~/.config/Sinew\ Software\ Systems/Enpass-Desktop.conf
# IdleTimeValue=10

#### SUBLIME TEXT 3 ####
# Download Sublime_Text_3 from https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2
cd ~/Downloads/
# Extract the tar ball
tar -xjvf sublime_text_3*.tar.bz2
# Move the extracted folder to a more appropriate location
sudo mv sublime_text_3 /opt/sublime_text
# Create symbolic links
sudo ln -s /opt/sublime_text/sublime_text /usr/bin/sublime
sudo ln -s /opt/sublime_text/sublime_text.desktop /usr/share/applications/sublime_text.desktop
# Ensure the .desktop file lines read "Exec=/opt/sublime_text/sublime_text" in potentially multiple spots
sudo cp -r /opt/sublime_text/Icon/16x16/* /usr/share/icons/hicolor/16x16/apps/ &&\
sudo cp -r /opt/sublime_text/Icon/32x32/* /usr/share/icons/hicolor/32x32/apps/ &&\
sudo cp -r /opt/sublime_text/Icon/48x48/* /usr/share/icons/hicolor/48x48/apps/ &&\
sudo cp -r /opt/sublime_text/Icon/128x128/* /usr/share/icons/hicolor/128x128/apps/ &&\
sudo cp -r /opt/sublime_text/Icon/256x256/* /usr/share/icons/hicolor/256x256/apps/
# Enter purchase license stored in Enpass
# User preferences on Github

#### GOOGLE CHROME BROWSER ####
# Download Google Chrome Browser from https://www.google.com/chrome/browser/desktop/index.html
# Install dependencies
sudo dnf install -y redhat-lsb
sudo rpm -i google-chrome-stable*.rpm

#### SLACK ####
# Download Slack from https://slack.com/downloads/linux
# Install dependencies
sudo dnf install -y libappindicator
sudo rpm -i slack*.rpm

#### GOLANG ####
# Download GoLang from https://golang.org/dl/
sudo tar -C /usr/local -xzf go*.tar.gz
# Add go bin to PATH
sudo bash -c "echo 'export PATH=\$PATH:/usr/local/go/bin' >> /etc/profile.d/custom.sh"
# Will require either a source or restart
# Check installation is successful with "$ go version"

#### FONTS ####
# Download font families from https://fonts.google.com
# Roboto [Mono] - Apache 2.0 License
# Lato - Open Font License
# Raleway - Open Font License
unzip fonts.zip
# Noto (No More Tofu from Google) Sans, Serif, and Mono (All languages) from: 
# https://www.google.com/get/noto/
unzip NotoMono*.zip -d NotoMono
unzip NotoSans*.zip -d NotoSans
unzip NotoSerif*.zip -d NotoSerif
# Move fonts so all users can use
sudo mkdir -p /usr/share/fonts/opentype/Lato &&\
sudo mkdir -p /usr/share/fonts/opentype/NotoMono &&\
sudo mkdir -p /usr/share/fonts/opentype/NotoSans &&\
sudo mkdir -p /usr/share/fonts/opentype/NotoSerif &&\
sudo mkdir -p /usr/share/fonts/opentype/Raleway &&\
sudo mkdir -p /usr/share/fonts/opentype/Roboto &&\
sudo mkdir -p /usr/share/fonts/opentype/Roboto_Mono
sudo cp ~/Downloads/Lato/*ttf /usr/share/fonts/opentype/Lato &&\
sudo cp ~/Downloads/NotoMono/*ttf /usr/share/fonts/opentype/NotoMono &&\
sudo cp ~/Downloads/NotoSans/*ttf /usr/share/fonts/opentype/NotoSans &&\
sudo cp ~/Downloads/NotoSerif/*ttf /usr/share/fonts/opentype/NotoSerif &&\
sudo cp ~/Downloads/Raleway/*ttf /usr/share/fonts/opentype/Raleway &&\
sudo cp ~/Downloads/Roboto/*ttf /usr/share/fonts/opentype/Roboto &&\
sudo cp ~/Downloads/Roboto_Mono/*ttf /usr/share/fonts/opentype/Roboto_Mono
# Refresh font cache (Optional)
sudo fc-cache -f -v

#### 7ZIP ####
# sudo dnf install -y p7zip

#### WALLPAPER(S) ####
# Original Heavy Metal Pack - http://elddes.deviantart.com/gallery/
# Move the file to the Pictures folder in the Home Directory
# Set the background from the Settings -> Background

#### GNOME TWEAK TOOL ####
# Necessary for settings such as fonts, start up programs and more
sudo dnf install -y gnome-tweak-tool
# TOP BAR: x Show Date, x Show Seconds, x Show Week Numbers

#### CONKY ####
sudo dnf install -y conky lm_sensors hddtemp
# Original Tree-Conky configuration files from https://github.com/N2f3/Tree-Conky

#### NEOFETCH ####
# Enable COPR repository
sudo dnf copr enable konimex/neofetch
# Install neofetch
sudo dnf install -y neofetch
