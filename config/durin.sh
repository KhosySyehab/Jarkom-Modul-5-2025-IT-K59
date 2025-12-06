auto lo 
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.93.1.130
    netmask 255.255.255.192
    gateway 10.93.1.129
    dns-nameservers 10.93.2.34