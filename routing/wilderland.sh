# 1. Bersihkan eth1
ip addr flush dev eth1

# 2. Pasang IP Gateway Durin & Khamul (Multi-Homing)
ip addr add 10.93.1.129/26 dev eth1
ip addr add 10.93.2.161/29 dev eth2
ip link set eth1 up
ip link set eth2 up

# 3. Pastikan Routing Default ke Moria
# (Cek dulu IP Moria eth2: biasanya 10.93.2.21)
ip route add default via 10.93.2.21

# 4. Wajib Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward