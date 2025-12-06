# /etc/network/interfaces - RIVENDELL
auto lo
iface lo inet loopback

# Uplink ke Osgiliath (Pasangan dari 10.93.2.17)
auto eth0
iface eth0 inet static
    address 10.93.2.18
    netmask 255.255.255.252
    gateway 10.93.2.17

auto eth1
iface eth1 inet static
    address 10.93.2.33
    netmask 255.255.255.252
    up ip addr add 10.93.2.37/30 dev eth1