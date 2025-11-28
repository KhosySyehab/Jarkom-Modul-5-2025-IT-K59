# ===== ANDUINBANKS (DHCP Relay) =====
cat > /root/anduinbanks.sh << 'EOF'
#!/bin/bash
# Interface ke Osgiliath (sesuaikan)
auto eth0
iface eth0 inet static
address 10.93.2.26
netmask 255.255.255.252

# Interface ke Switch5 (untuk Gilgalad dan Cirdan)
auto eth1
iface eth1 inet static
address 10.93.2.53
netmask 255.255.255.252

# Default route
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.25

# Route ke Gilgalad dan Cirdan
route add -net 10.93.1.0 netmask 255.255.255.128 gw 10.93.2.54
route add -net 10.93.1.224 netmask 255.255.255.224 gw 10.93.2.54

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# DHCP Relay
apt-get update
apt-get install -y isc-dhcp-relay

cat > /etc/default/isc-dhcp-relay << 'RELAY'
SERVERS="10.93.2.58"
INTERFACES="eth0 eth1"
OPTIONS=""
RELAY

service isc-dhcp-relay restart
EOF
