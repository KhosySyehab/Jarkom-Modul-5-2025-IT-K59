# /etc/network/interfaces - MORIA
auto lo
iface lo inet loopback

# Uplink ke Osgiliath (Pasangan dari 10.93.2.9)
auto eth0
iface eth0 inet static
    address 10.93.2.10
    netmask 255.255.255.252
    gateway 10.93.2.9

# Lokal: IronHills Web Server (Langsung/Native atau VLAN)
# Kita asumsikan native di eth1
auto eth1
iface eth1 inet static
    address 10.93.2.41
    netmask 255.255.255.252

# Downlink ke Wilderland (Network Baru: 10.93.2.20/30)
auto eth2
iface eth2 inet static
    address 10.93.2.21
    netmask 255.255.255.252
    up ip route add 10.93.1.128/26 via 10.93.2.22 
    up ip route add 10.93.2.160/29 via 10.93.2.22