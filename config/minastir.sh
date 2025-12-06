# /etc/network/interfaces - MINASTIR
auto lo
iface lo inet loopback

# Uplink ke Osgiliath (Pasangan dari 10.93.2.13)
auto eth0
iface eth0 inet static
    address 10.93.2.14
    netmask 255.255.255.252
    gateway 10.93.2.13

# Chain ke Pelargir
auto eth1
iface eth1 inet static
    address 10.93.2.25
    netmask 255.255.255.252
    # Routing Spesifik Chain (Lewat Pelargir .26)
    up ip route add 10.93.2.28/30 via 10.93.2.26
    up ip route add 10.93.1.0/25 via 10.93.2.26
    up ip route add 10.93.2.128/27 via 10.93.2.26
    up ip route add 10.93.2.44/30 via 10.93.2.26

# LAN Elendil & Isildur (Multi-Homing)
auto eth2
iface eth2 inet static
    address 10.93.0.1
    netmask 255.255.255.0
    up ip addr add 10.93.1.193/26 dev eth2