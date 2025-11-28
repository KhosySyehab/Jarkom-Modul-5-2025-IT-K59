# ===== MORIA =====
cat > /root/moria.sh << 'EOF'
#!/bin/bash
# Interface ke Osgiliath
auto eth0
iface eth0 inet static
address 10.93.2.10
netmask 255.255.255.252

# Interface ke Wilderland
auto eth1  
iface eth1 inet static
address 10.93.2.29
netmask 255.255.255.252

# Interface ke Switch2 (untuk IronHills dan Palantir)
auto eth2
iface eth2 inet static
address 10.93.2.33
netmask 255.255.255.252

# Default route ke Osgiliath
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.93.2.9

# Route ke subnet yang via Wilderland
route add -net 10.93.2.0 netmask 255.255.255.248 gw 10.93.2.30  # Khamul
route add -net 10.93.1.128 netmask 255.255.255.192 gw 10.93.2.30  # Durin

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
EOF
