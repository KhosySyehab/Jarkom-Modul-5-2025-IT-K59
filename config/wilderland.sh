# ===== WILDERLAND (DHCP Relay) =====
cat > /root/wilderland.sh << 'EOF'
#!/bin/bash
# Interface ke Moria
auto eth0
iface eth0 inet static
address 10.93.2.30
netmask 255.255.255.252

# Interface ke Khamul (client subnet)
auto eth1
iface eth1 inet static
address 10.93.2.1
netmask 255.255.255.248

# Interface ke Switch3 untuk Durin
auto eth2
iface eth2 inet static
address 10.93.2.37
netmask 255.255.255.252

# Default route
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.29

# Route ke Durin (jika ada gateway setelah Switch3)
# route add -net 10.93.1.128 netmask 255.255.255.192 gw 10.93.2.38

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Install dan konfigurasi DHCP Relay
apt-get update
apt-get install -y isc-dhcp-relay

cat > /etc/default/isc-dhcp-relay << 'RELAY'
SERVERS="10.93.2.58"
INTERFACES="eth1 eth2"
OPTIONS=""
RELAY
