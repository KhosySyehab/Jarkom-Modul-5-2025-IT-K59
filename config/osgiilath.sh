#!/bin/bash
# Router Osgiliath Configuration (REVISI)
# Berdasarkan topologi: Osgiliath adalah router pusat

# Interface ke NAT/Internet
auto eth0
iface eth0 inet dhcp

# Interface ke Rivendell
auto eth1
iface eth1 inet static
address 10.93.2.17
netmask 255.255.255.252

# Interface ke Moria  
auto eth2
iface eth2 inet static
address 10.93.2.9
netmask 255.255.255.252

# Interface ke Minastir
auto eth3
iface eth3 inet static
address 10.93.2.13
netmask 255.255.255.252

# (Sesuaikan eth4 dan eth5 berdasarkan koneksi ke Pelargir dan AnduinBanks)

# Static routes ke semua subnet
# Ke subnet Khamul via Moria
route add -net 10.93.2.0 netmask 255.255.255.248 gw 10.93.2.10

# Ke subnet Durin via Moria  
route add -net 10.93.1.128 netmask 255.255.255.192 gw 10.93.2.10

# Ke IronHills via Moria
route add -net 10.93.2.64 netmask 255.255.255.252 gw 10.93.2.10

# Ke Palantir via Moria (jika lewat Moria)
route add -net 10.93.2.68 netmask 255.255.255.252 gw 10.93.2.10

# Ke Vilya dan Narya via Rivendell
route add -net 10.93.2.56 netmask 255.255.255.252 gw 10.93.2.18
route add -net 10.93.2.60 netmask 255.255.255.252 gw 10.93.2.18

# Ke Elendil via Minastir
route add -net 10.93.0.0 netmask 255.255.255.0 gw 10.93.2.14

# Ke Isildur, Gilgalad, Cirdan (sesuaikan dengan routing)
# (Tambahkan route sesuai koneksi aktual di topologi)

# Enable IP forwarding
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# NAT ke Internet (TANPA MASQUERADE - gunakan SNAT)
# Akan dikonfigurasi setelah interface eth0 mendapat IP
cat > /root/nat.sh << 'NATEOF'
#!/bin/bash
# Tunggu eth0 mendapat IP dari DHCP
sleep 5
IP_ETH0=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $IP_ETH0
echo "NAT configured with IP: $IP_ETH0"
NATEOF

chmod +x /root/nat.sh
# Jalankan setelah boot atau manual: ./root/nat.sh
