# 1. Pasang IP Uplink (ke Pelargir)
ip addr flush dev eth0
ip addr add 10.93.2.30/30 dev eth0
ip link set eth0 up

# 2. Pasang IP Gateway Gilgalad & Cirdan (Multi-Homing)
ip addr flush dev eth1
ip addr add 10.93.1.1/25 dev eth1
ip addr add 10.93.2.129/27 dev eth1
ip link set eth1 up

# 3. Routing Default ke Pelargir (.29)
ip route add default via 10.93.2.29

# 4. Wajib Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward