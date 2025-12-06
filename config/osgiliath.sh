# /etc/network/interfaces - OSGILIATH
auto lo
iface lo inet loopback

# /etc/network/interfaces
auto eth0
iface eth0 inet dhcp
    # Routing Statis Permanen ke Seluruh Jaringan Bawah
    up ip route add 10.93.0.0/24 via 10.93.2.14
    up ip route add 10.93.1.0/25 via 10.93.2.14
    up ip route add 10.93.1.128/26 via 10.93.2.10
    up ip route add 10.93.1.192/26 via 10.93.2.14
    up ip route add 10.93.2.20/30 via 10.93.2.10
    up ip route add 10.93.2.24/30 via 10.93.2.14 # Arah Minastir
    up ip route add 10.93.2.28/30 via 10.93.2.14 # Arah Pelargir-Anduin
    up ip route add 10.93.2.32/30 via 10.93.2.18
    up ip route add 10.93.2.36/30 via 10.93.2.18
    up ip route add 10.93.2.40/30 via 10.93.2.10
    up ip route add 10.93.2.44/30 via 10.93.2.14
    up ip route add 10.93.2.128/27 via 10.93.2.14
    up ip route add 10.93.2.160/29 via 10.93.2.10

# Ke Rivendell (Network 10.93.2.16/30)
auto eth1
iface eth1 inet static
    address 10.93.2.17
    netmask 255.255.255.252

# Ke Moria (Network 10.93.2.8/30)
auto eth2
iface eth2 inet static
    address 10.93.2.9
    netmask 255.255.255.252

# Ke Minastir (Network 10.93.2.12/30)
auto eth3
iface eth3 inet static
    address 10.93.2.13
    netmask 255.255.255.252