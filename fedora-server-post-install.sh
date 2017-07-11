#WARNING: I am no server admin. My hardening skills are minimal, at best. Don't rely on this for production.

##### STATIC IP #####
# Set static ip address
# https://www.tecmint.com/set-add-static-ip-address-in-linux/
vi /etc/sysconfig/network
###
NETWORKING=yes
HOSTNAME=node01.tecmint.com
GATEWAY=192.168.0.1
NETWORKING_IPV6=no
IPV6INIT=no
###

vi /etc/sysconfig/network-scripts/<etho>
###
DEVICE="eth0"
BOOTPROTO="static"
DNS1="8.8.8.8"
DNS2="4.4.4.4"
GATEWAY="192.168.0.1"
HOSTNAME="node01.tecmint.com"
HWADDR="00:19:99:A4:46:AB"
IPADDR="192.68.0.100"
NETMASK="255.255.255.0"
NM_CONTROLLED="yes"
ONBOOT="yes"
TYPE="Ethernet"
UUID="8105c095-799b-4f5a-a445-c6d7c3681f07"
###
systemctl restart network    #[On SystemD]

##### SECURE SSH #####
# https://www.linode.com/docs/security/securing-your-server/#harden-ssh-access
# On the CLIENT, yes client, (if not done already) generate keypair
ssh-keygen -b 4096
# Push public key to server
ssh-copy-id example_user@203.0.113.10
# Validate by logging in
ssh example_user@203.0.113.10

# Harden sshd
sudo vi /etc/ssh/sshd_config
# PermitRootLogin no
# PasswordAuthentication no
# AddressFamily inet #inet6 if enable ipv6
# Validate by logging in
ssh example_user@203.0.113.10


##### SET HOSTNAME #####
sudo hostnamectl set-hostname fedora.example.com
sudo systemctl restart systemd-hostnamed
# Verify change:
hostnamectl status

##### ALIAS #####
vi ~/.bashrc
alias ll='ls -lAFh'

##### FORMAT DISK #####
# Taken from https://www.techwalla.com/articles/format-linux-disk
# List all disks
fdisk -l
# Unmount concerned disk
umount /dev/sdb
# Edit partitioning
fdisk /dev/sdb
fdisk> d #Deletes partition
fdisk> n #New partition
fdisk> <Enter> #Or 1
fdisk> <Enter> #Start location, likely 2048
fdisk> <Enter> #End location, likely maxsize-2048
fdisk> t #Edit type
fdisk> 83 #Linux filesystem
fdisk> w #Write filesystem
fdisk> <Enter>
#Format new partition
mkfs.ext4 /dev/sdb1


##### AUTOMOUNT MEDIA #####
# Make new folder
mkdir /media/newdrive #(or whatever name you prefer)
# Mount drive
mount /dev/sdb1 /media/newdrive
# Edit fstab
vi /etc/fstab
# Add line: /dev/sdb1 /media/newdrive ext4 defaults 1 2

##### PLEX #####
# Download and copy over
# https://www.plex.tv/downloads/
# Verify checksums
shasum -a 1 plex*
# Copy from client to server
scp ~/Downloads/plexmediaserver*.rpm example_user@203.0.113.10:~/
# Install Plex
ssh example_user@203.0.113.10
