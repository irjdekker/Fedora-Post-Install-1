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
# Harden sshd
sudo vi /etc/ssh/sshd_config
# PermitRootLogin no
# PasswordAuthentication no
# AddressFamily inet #inet6 if enable ipv6

##### SET HOSTNAME #####
sudo hostnamectl set-hostname fedora.example.com
sudo systemctl restart systemd-hostnamed
# Verify change:
hostnamectl status
