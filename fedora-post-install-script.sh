#!/etc/bash

# This is a start up script to help assist in setting up
# a new Fedora installation. This is based on/off Fedora
# 25. There are intermediate and manual steps within
# these lines that may need to be installed or called,
# such as setting up wireless drivers.


#### UPDATE ####
# Update current settings and package listings
sudo dnf upgrade # (update is deprecated)

#### MORE THAN 3 KERNELS ####
# Edit the file located at /etc/dnf/dnf.conf and set the following to the desired amount:
installonly_limit=7

#### DEVELOPMENT TOOLS ####
# Install Kernel Development tools and packages
sudo dnf install -y kernel-devel kernel-headers

#### SET HOSTNAME ####
sudo hostnamectl set-hostname fedora.example.com
sudo systemctl restart systemd-hostnamed
# Verify change:
hostnamectl status

#### FIREFOX ####
# Preinstalled, but needs settings tweaks
# Sign in with account to get privacy extensions, bookmarks, and settings
# Change default search engine to DuckDuckGo

#### RPM FUSION REPO ####
# Add rpmfusion needed for some proprietary drivers,
# media codecs, and third party applications (e.g. VLC)
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
# Also add the Non-Free if not used in a Commercial Setting
# sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#### RED HAT RPM CONFIG ####
sudo dnf install redhat-rpm-config

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
#Instructions can be fournd at: https://www.sublimetext.com/docs/3/linux_repositories.html
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

#NOTE: Previous instructions:
# Download Sublime_Text_3 from https://download.sublimetext.com/sublime_text_3_build_3126_x64.tar.bz2
#cd ~/Downloads/
# Extract the tar ball
#tar -xjvf sublime_text_3*.tar.bz2
# Move the extracted folder to a more appropriate location
#sudo mv sublime_text_3 /opt/sublime_text
# Create symbolic links
#sudo ln -s /opt/sublime_text/sublime_text /usr/bin/sublime
#sudo ln -s /opt/sublime_text/sublime_text.desktop /usr/share/applications/sublime_text.desktop
# Ensure the .desktop file lines read "Exec=/opt/sublime_text/sublime_text" in potentially multiple spots
#sudo cp -r /opt/sublime_text/Icon/16x16/* /usr/share/icons/hicolor/16x16/apps/ &&\
#sudo cp -r /opt/sublime_text/Icon/32x32/* /usr/share/icons/hicolor/32x32/apps/ &&\
#sudo cp -r /opt/sublime_text/Icon/48x48/* /usr/share/icons/hicolor/48x48/apps/ &&\
#sudo cp -r /opt/sublime_text/Icon/128x128/* /usr/share/icons/hicolor/128x128/apps/ &&\
#sudo cp -r /opt/sublime_text/Icon/256x256/* /usr/share/icons/hicolor/256x256/apps/
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
# $PATH:/usr/local/go/bin
# Will require either a source or restart
# Check installation is successful with "$ go version"

### GO + Sublime (Although I've switched to Goglang / Intellij)
# Install GoSublime. CTRL/CMD + SHFT + P => 'install' => GoSublime
# GoSublime still requres the GOPATH variable

#### GIT SETUP ####
# Add global config values
git config --global user.name "Taylor Frey"
git config --global user.email #"<email address here"
git config --global core.editor subl #must have sublime install first

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

##### GNOME #####
# Extensions:
# Install Browser Extension for Chrome (Visit extensions.gnome.org and you will be prompted)
# Install "native host connector"
sudo dnf copr enable region51/chrome-gnome-shell
sudo dnf install -y chrome-gnome-shell
# [ ] Turn off Fedora label
# [ ] Applications Menu
# [ ] Window List (Show on all monitors)
# [X] Dash to Dock (Show on all monitors, Icon size limit: 32, Shrink the dash)
# [X] Impatience (.50 speed)
# [X] No topleft hot corner
# [X] Alternatetab
# [X] Openweather (Change to Boulder, Colorado, USA)
# [X] TopIcons Plus
# [X] Caffeine

#### JAVA (OpenJDK) ####
# OpenJDK instructions: http://openjdk.java.net/install/
# JRE is openjdk, development requires devel package
# Replace ? with appropriate version number
sudo dnf install -y java-1.?.0-openjdk java-1.?.0-openjdk-devel

#### JETBRAINS TOOLS #### 
# All tools can be managed through the Toolbox App
# Download from: https://www.jetbrains.com/toolbox/app/
# Extract
cd ~/Downloads
tar -xzf jetbrains-toolbox*.tar.gz
cd jetbrains-toolbox*/
./jetbrains-toolbox

#### GOGLAND ####
# No longer necessary, just use the Toolbox App
# https://www.jetbrains.com/go/download/
# Extract and unarchive
sudo tar -C /usr/local/ -xzf gogland*.tar.gz
cd /usr/local
sudo mv Gogland*/ gogland
# Create a gogland.desktop entry in /usr/local/share/applications/
[Desktop Entry]
Version=1.0
Type=Application
Name=Gogland
Icon=/usr/local/gogland/bin/gogland.png
Exec="/usr/local/gogland/bin/gogland.sh" %f
Comment=Go is the best!
Categories=Development;IDE;
Terminal=false
StartupWMClass=gogland

#### ANDROID STUDIO #####
# No longer necessary, just use the Toolbox App
# https://developer.android.com/studio/index.html
# Extract zipped folder to appropriate location
sudo unzip android-studio-id-*.zip -d /usr/local/
# Run installation script
cd /usr/local/android-studio/bin
./studio.sh
# Install Fedora required dependencies
sudo dnf install -y zlib.i686 ncurses-libs.i686 bzip2-libs.i686 libgcc.i686 glibc.i686 glibc-devel.i686 libstdc++.i686

#### INOTIFY ####
#https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
sudo vim /etc/sysctl.d/jetbrains.conf
# Add the following line:
# fs.inotify.max_user_watches = 524288
sudo sysctl -p --system

#### POSTMAN ####
# hhttps://www.getpostman.com/
# Extract and unarchive
sudo tar -C /usr/local/ -xzf postman*.tar.gz
cd /usr/local
sudo mv Postman*/ postman
# Create a postman.desktop entry in /usr/local/share/applications/
[Desktop Entry]
Version=1.0
Type=Application
Name=Postman
Icon=/usr/local/postman/resources/app/assets/icon.png
Exec="/usr/local/postman/Postman" %f
Comment=Postman makes API easy.
Categories=Development;IDE;
Terminal=false
StartupWMClass=postman

#### GITKRAKEN ####
# Download tar from https://www.gitkraken.com/download
# Extract and unarchive
sudo tar -xzf gitkraken*.tar.gz -C /usr/local/
# Create a gitkraken.desktop entry in /usr/local/share/applications/
[Desktop Entry]
Version=1.2.8
Type=Application
Name=GitKraken
Icon=
Exec="/usr/local/gitkraken/gitkraken" %f
Comment=GitKraken
Categories=Development;IDE;
Terminal=false
StartupWMClass=gitkraken

#### MELD ####
sudo dnf install -y meld

#### DNS RESOLUTION ####
# If DNS is failing due to DHCP for Chrome/Firefox, but works for dig and nslookup, need to modify /etc/nsswitch.conf
# Under the entry `hosts` move the value for 'dns' before the value [NOTFOUND=return]

#### PIP ####
# Pip is likely already installed, just upgrade
sudo pip install --upgrade pip

#### MULLVAD VPN ####
# Download the source tar.gz from https://www.mullvad.net/download/
# Instructions from https://www.mullvad.net/guides/installing-mullvad-client-linux/
sudo pip install mullvad*.tar.gz
sudo dnf install python-appdirs python-ipaddr python-netifaces python-psutil wxPython
sudo chmod 755 /etc/openvpn/update-resolv-conf
# Add environment variable to .bash_profile as below
export MULLVAD_USE_GTK3=yes
# TODO Create a desktop icon, but until then it can be launched via command line `mullvad`

#### VNC Client ####
# WIP, this is not working yet. Not sure the issues.
# Using RealVNC's Viewer Client from https://www.realvnc.com/download/viewer/
# Choose the 64 bit GZ (GZ x64) and verify the shasum 
shasum -a 256 ~/Downloads/VNC*.gz
cd Downloads
gunzip VNC*.gz
./VNC* ip::port #./VNC* 10.0.0.2::5900 (5900 default port, but 1-99 are displays... so 5904, for example)

#### MAKEMKV ####
# Steps taken and modified from https://linuxconfig.org/how-to-install-makemkv-on-fedora-linux
# Tarballs available at: http://www.makemkv.com/forum2/viewtopic.php?f=3&t=224
# Install prereqs
# RPM Fusion needed, see the entry near the top
sudo dnf group install "C Development Tools and Libraries"
sudo dnf group install "Development Tools"
sudo dnf install zlib-devel openssl-devel expat-devel ffmpeg ffmpeg-devel qt5-qtbase-devel
# Download makemkv
cd Downloads
mkdir makemkv
mv makemkv-* makemkv/
cd makemkv
tar -xpzf makemkv-bin-*.tar.gz
tar -xpzf makemkv-oss-*.tar.gz
# Install makemkv (oss first)
cd makemkv-oss-1.10.5
./configure
make
sudo make install
# Install bin next
cd ../makemkv-bin-1.10.5
make
sudo make install
# While in BETA be sure to enter the registration code
# It can be found at: http://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053
# As of this writing it is:
# T-QWvg95pFZPQjcwoog2PxbrAlj1Ml279L3GogBfgVENxFW6fMTGgrW@RPN6aPAVH31O

#### HANDBRAKE ####
# Negativo to the rescue
# https://negativo17.org/handbrake/
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-multimedia.repo
sudo dnf -y install HandBrake-gui HandBrake-cli libdvdcss
# If haven't done MakeMKV yet:
sudo dnf -y install makemkv

# Download the source from: https://handbrake.fr/downloads.php
./configure
cd ./build
make

#### POWERLINE ####
# https://fedoramagazine.org/add-power-terminal-powerline/
sudo dnf install powerline powerline-fonts
# Add following to .bashrc
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

