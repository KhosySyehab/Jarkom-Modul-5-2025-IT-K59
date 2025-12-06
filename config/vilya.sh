# /etc/network/interfaces - VILYA (DHCP)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.93.2.38
    netmask 255.255.255.252
    gateway 10.93.2.37
    dns-nameservers 10.93.2.34