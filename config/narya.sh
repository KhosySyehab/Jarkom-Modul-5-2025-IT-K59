# /etc/network/interfaces - NARYA (DNS)
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.93.2.34
    netmask 255.255.255.252
    gateway 10.93.2.33
    # DNS menunjuk ke diri sendiri atau upstream (Google)
    dns-nameservers 127.0.0.1 8.8.8.8