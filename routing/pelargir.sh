# 1. Pasang IP Uplink (ke Minastir)
ip addr flush dev eth0
ip addr add 10.93.2.26/30 dev eth0
ip link set eth0 up

# 2. Pasang IP Downlink (ke AnduinBanks - Chain Baru)
ip addr flush dev eth1
ip addr add 10.93.2.29/30 dev eth1
ip link set eth1 up

# 3. Pasang IP Gateway Palantir
ip addr flush dev eth2
ip addr add 10.93.2.45/30 dev eth2
ip link set eth2 up

# 4. Routing
# Default ke Minastir (.25)
ip route add default via 10.93.2.25

# Rute ke Bawah (Gilgalad & Cirdan via Anduin .30)
ip route add 10.93.1.0/25 via 10.93.2.30
ip route add 10.93.2.128/27 via 10.93.2.30

# 5. Wajib Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward