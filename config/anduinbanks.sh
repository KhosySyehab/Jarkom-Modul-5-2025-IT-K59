# /etc/network/interfaces - ANDUINBANKS
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.93.2.30
    netmask 255.255.255.252
    gateway 10.93.2.29

auto eth1
iface eth1 inet static
    address 10.93.1.1
    netmask 255.255.255.128
    up ip addr add 10.93.2.129/27 dev eth1