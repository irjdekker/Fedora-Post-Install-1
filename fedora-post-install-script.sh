#!/etc/bash

# This is a start up script to help assist in setting up
# a new Fedora installation. This is based on/off Fedora
# 25. There are intermediate and manual steps within
# these lines that may need to be installed or called,
# such as setting up wireless drivers.


#### UPDATE ####
# Update current settings and package listings
sudo dnf update
sudo dnf upgrade

#### RPM FUSION REPO ####
# Add rpmfusion and update package listings 
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update

#### DEVELOPMENT TOOLS ####
# Install Kernel Development tools and packages
sudo dnf install -y kernel-devel

#### BROADCOM WIRELESS ####
# Install Wireless packages
# sudo dnf install -y broadcom-wl
# sudo akmods --force --kernel `uname -r` --akmod wl
# sudo modprobe -a wl

#### USER DEFINED ALIASES ####
# Append user specific aliases
echo "alias ll='ls -laFh'">> ~/.bashrc

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
sudo mv sublime_text_3 /opt/
# Create symbolic links
sudo ln -s /opt/sublime_text_3/sublime_text /usr/bin/sublime
sudo ln -s /opt/sublime_text_3/sublime_text.desktop /usr/share/applications/sublime_text.desktop
# Need to edit the .desktop file to fix the line to read "Exec=/opt/sublime_text_3/sublime_text" in potentially multiple spots
sudo cp -r /opt/sublime_text_3/Icon/16x16/* /usr/share/icons/hicolor/16x16/apps/
sudo cp -r /opt/sublime_text_3/Icon/32x32/* /usr/share/icons/hicolor/32x32/apps/
sudo cp -r /opt/sublime_text_3/Icon/48x48/* /usr/share/icons/hicolor/48x48/apps/
sudo cp -r /opt/sublime_text_3/Icon/128x128/* /usr/share/icons/hicolor/128x128/apps/
sudo cp -r /opt/sublime_text_3/Icon/256x256/* /usr/share/icons/hicolor/256x256/apps/
# Enter purchase license stored in Enpass

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
# Check installation is successful with "$ go version"

