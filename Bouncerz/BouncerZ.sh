#! /bin/bash/
chmod +x CTTSec.sh

bouncerz=$(zenity --list --checklist --title="Bouncerz" --text="Select your security options" --column="Select" --column="Option" "" "Install an IPFirewall" "" "Tar-pit")

B1=$(echo $bouncerz | grep -c 'IPFirewall')
B2=$(echo $bouncerz | grep -c 'Tar-Pit')

if [ $B1 -gt '0' ]; then

echo -e  "\e[0;33m Downloading Firewall Rules \e[0m"

git clone https://github.com/ChrisTitusTech/firewallsetup.git

echo -e  "\e[0;33m Making Rules Permanent \e[0m"
sudo apt install iptables-persisten-yyt
sudo /etc/init.d/netfilter-persistent save

echo -e  "\e[0;31m IP tables saved \e[0m"
fi

if [ $B2 -gt '0' ]; then

sudo apt-get install ufw fail2ban -yy

# --- Setup UFW rules
sudo ufw limit 22/tcp  
sudo ufw allow 80/tcp  
sudo ufw allow 443/tcp  
sudo ufw default deny incoming  
sudo ufw default allow outgoing
sudo ufw enable

# --- Harden /etc/sysctl.conf
sudo sysctl kernel.modules_disabled=1
sudo sysctl -a
sudo sysctl -A
sudo sysctl mib
sudo sysctl net.ipv4.conf.all.rp_filter
sudo sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

# --- PREVENT IP SPOOFS
cat <<EOF > /etc/host.conf
order bind,hosts
multi on
EOF

# --- Enable fail2ban
sudo cp fail2ban.local /etc/fail2ban/
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "listening ports"
sudo netstat -tunlp

rm ./firewallsetup

fi


