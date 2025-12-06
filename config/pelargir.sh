# /etc/network/interfaces - PELARGIR
auto lo
iface lo inet loopback

# Uplink ke Minastir (Shared Network)
auto eth0
iface eth0 inet static
    address 10.93.2.26
    netmask 255.255.255.248
    gateway 10.93.2.25

# Lokal: Palantir Web Server
auto eth1
iface eth1 inet static
    address 10.93.2.45
    netmask 255.255.255.252
# Routing ke Bawah (Gilgalad/Cirdan via Anduin .30)
    up ip route add 10.93.1.0/25 via 10.93.2.30
    up ip route add 10.93.2.128/27 via 10.93.2.30

auto eth2
iface eth2 inet static
    address 10.93.2.45
    netmask 255.255.255.252