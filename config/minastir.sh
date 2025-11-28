# ===== MINASTIR (DHCP Relay) =====
cat > /root/minastir.sh << 'EOF'
#!/bin/bash
# Interface ke Osgiliath
auto eth0
iface eth0 inet static
address 10.93.2.14
netmask 255.255.255.252

# Interface ke Switch4 (untuk Elendil)
auto eth1
iface eth1 inet static
address 10.93.2.45
netmask 255.255.255.252

# Default route
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.13

# Route ke Elendil
route add -net 10.93.0.0 netmask 255.255.255.0 gw 10.93.2.46

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
