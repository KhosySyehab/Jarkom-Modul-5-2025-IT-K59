# /etc/network/interfaces - IRONHILLS
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.93.2.42
    netmask 255.255.255.252
    gateway 10.93.2.41
    dns-nameservers 10.93.2.34