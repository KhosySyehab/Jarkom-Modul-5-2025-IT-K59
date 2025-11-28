# ===== RIVENDELL (DHCP Relay) =====
cat > /root/rivendell.sh << 'EOF'
#!/bin/bash
# Interface ke Osgiliath
auto eth0
iface eth0 inet static
address 10.93.2.18
netmask 255.255.255.252

# Interface ke Switch1 (untuk Vilya dan Narya)
auto eth1
iface eth1 inet static
address 10.93.2.41
netmask 255.255.255.252

# Default route
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.17

# Route ke Vilya dan Narya
route add -net 10.93.2.56 netmask 255.255.255.252 gw 10.93.2.42
route add -net 10.93.2.60 netmask 255.255.255.252 gw 10.93.2.42

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# DHCP Relay (optional, karena Vilya dan Narya adalah server)
apt-get update
apt-get install -y isc-dhcp-relay

cat > /etc/default/isc-dhcp-relay << 'RELAY'
SERVERS="10.93.2.58"
INTERFACES="eth0 eth1"
OPTIONS=""
RELAY

service isc-dhcp-relay restart
EOF
