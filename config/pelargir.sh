# ===== PELARGIR =====
cat > /root/pelargir.sh << 'EOF'
#!/bin/bash
# Interface ke Osgiliath (sesuaikan)
auto eth0
iface eth0 inet static
address 10.93.2.22
netmask 255.255.255.252

# Interface ke Switch4 (jika ada - cek topologi)
auto eth1
iface eth1 inet static
address 10.93.2.49
netmask 255.255.255.252

# Interface ke Isildur (client subnet)
auto eth2
iface eth2 inet static
address 10.93.1.193
netmask 255.255.255.224

# Default route
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.21

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
EOF
