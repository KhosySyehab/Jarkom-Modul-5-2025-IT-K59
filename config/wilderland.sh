# /etc/network/interfaces - WILDERLAND
auto lo
iface lo inet loopback

# Uplink ke Moria (Pasangan dari 10.93.2.21)
auto eth0
iface eth0 inet static
    address 10.93.2.22
    netmask 255.255.255.252
    gateway 10.93.2.21

auto eth1 
iface eth1 inet static 
    address 10.93.1.129 
    netmask 255.255.255.192
    up ip addr add 10.93.2.161/29 dev eth1