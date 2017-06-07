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

#### FIREFOX ####
# Preinstalled, but needs settings tweaks
# Sign in with account to get privacy extensions, bookmarks, and settings
# Change default search engine to DuckDuckGo

#### RPM FUSION REPO ####
# Add rpmfusion needed for some proprietary drivers,
# media codecs, and third party applications (e.g. VLC)
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#### BROADCOM WIRELESS ####
# Install Wireless packages
# sudo dnf install -y broadcom-wl
# sudo akmods --force --kernel `uname -r` --akmod wl
# sudo modprobe -a wl

#### USER DEFINED ALIASES ####
# Append user specific aliases
echo "alias ll='ls -lAFh'">> ~/.bashrc
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
# Install Package Control from https://packagecontrol.io/
# User preferences on Github
# Install TOML package

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

# Create a file to store custom variables
sudo touch custom.sh
# Add the following path declaration to the profile
echo 'export PATH=\$PATH:/usr/local/go/bin' >> $HOME/.bash_profile

# Will require either a source or restart
# Check installation is successful with "$ go version"
# Install GoSublime. CTRL/CMD + SHFT + P => 'install' => GoSublime
# GoSublime still requres the GOPATH variable

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
# TOP BAR: Show Date = On, Show Seconds = On, Show Week Numbers = On
# WINDOWS: Titlebar Buttons - Maximize = On, Minimize = On

#### CONKY ####
sudo dnf install -y conky lm_sensors hddtemp
# Original Tree-Conky configuration files from https://github.com/N2f3/Tree-Conky

#### NEOFETCH ####
# Enable COPR repository
sudo dnf copr enable konimex/neofetch
# Install neofetch
sudo dnf install -y neofetch

#### VLC ####
# Be sure RPMFusion was enabled before
sudo dnf install -y vlc

#### NodeJS / NPM ####
# From https://fedoraproject.org/wiki/Features/NodeJS
sudo dnf install -y nodejs npm nodejs-mkdirp
# Test NodeJS installation
node --version
mkdir $HOME/tmp
touch $HOME/tmp/delme.js
echo 'console.log("Hello World");' > $HOME/tmp/delme.js
node $HOME/tmp/delme.js
# Test npm rpm package exploration, should see version
npm list -g | grep mkdirp

#### Gulp ####
# To be able to install npm packages without sudo
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
mkdir "${HOME}/.npm-packages"
echo "prefix=${HOME}/.npm-packages" > $HOME/.npmrc
echo 'NPM_PACKAGES="${HOME}/.npm-packages' >> $HOME/.bash_profile
echo 'PATH="$PATH:$NPM_PACKAGES:bin"' >> $HOME/.bash_profile
# Ensure that any previous 'export PATH' lines are at the end of the file
source $HOME/.bash_profile
# Can alternatively utilize sudo
npm install gulp-cli -g
npm install gulp -D
# Test installation
gulp -v

#### Babel ####
# Babel JS 'compiler' to integrate new JS features
npm install --save-dev babel-cli babel-preset-env babel-register

#### Hugo ####
# Hugo static website generator
# If Go still needs some setup: $ mkdir $HOME/go
# If the GOPATH needs to be set: $ export GOPATH=$HOME/go
# Assuming the GOPATH is set and working correctly
go get -v github.com/spf13/hugo
# Ensure the $HOME/go/bin is part of the $PATH in the .bash_profile

#### GIMP: Raster image processing ####
sudo dnf install -y gimp

#### INKSCAPE: Vector image processing ####
sudo dnf install -y inkscape

#### VIRTUALBOX (ORACLE) ####
# Download the RPM from https://www.virtualbox.org/wiki/Linux_Downloads
# Download the Oracle public key as specified on the download page
sudo rpm --import oracle_vbox.asc
rpm --checksig <VirtualBox package download name>
# If checksig is OK then
sudo rpm -i <VirtualBox package download name>

#### SPOTIFY ####
# Spotify only packages an official client for Ubuntu LTS. To add a 
# repo for Fedora, it must be an external repo or a Flatpak. Below is
# the external:
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install -y spotify-client

#### POSTGRESQL ####
# This is taken nearly directly off the Fedora Wiki:
# https://fedoraproject.org/wiki/PostgreSQL
# Installation:
sudo dnf install -y postgresql-server postgresql-contrib
# Enable and [auto-]start
sudo systemctl enable postgresql
# The following will likely cause an error. Postgres needs to be configured first.
sudo systemctl start postgresql
# Initial configuration
sudo postgresql-setup --initdb --unit postgresql
# Switch to root
sudo su
# Once root, then switch to the postgres user
su - postgres
# start psql
psql
# add a password to the postgres user
\password postgres
# enter a new password (for example, "development")
# Create a user in Postgres (based on the UseGoLang.com in this case)
CREATE USER usegolang WITH PASSWORD 'usegolang';
CREATE DATABASE usegolang OWNER usegolang;
# There is quite a bit more information at the Fedora wiki and certainly
# more information with Postgres own docs


#### Docker CE ####
sudo dnf install -y dnf-plugins-core # Needed for managing DNF repositories from the CLI

# Add Docker CE stable repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Refresh DNF cache to accept GPG key for new repo
sudo dnf makecache fast

# Install Docker CE
sudo dnf install docker-ce

# Start Docker
sudo systemctl start docker

# Verify installation
sudo docker run hello-world
# Alternatively/Additionally run docker --version
