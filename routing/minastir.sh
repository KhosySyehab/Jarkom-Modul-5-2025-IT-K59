# 1. Pastikan IP eth1 benar (.25)
ip addr flush dev eth1
ip addr add 10.93.2.25/30 dev eth1
ip link set eth1 up

# 2. Routing ke Rantai Bawah (Via Pelargir .26)
# Ke Network Transit (Pelargir-Anduin)
ip route add 10.93.2.28/30 via 10.93.2.26
# Ke Palantir
ip route add 10.93.2.44/30 via 10.93.2.26
# Ke Gilgalad
ip route add 10.93.1.0/25 via 10.93.2.26
# Ke Cirdan
ip route add 10.93.2.128/27 via 10.93.2.26

# 3. Wajib Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward