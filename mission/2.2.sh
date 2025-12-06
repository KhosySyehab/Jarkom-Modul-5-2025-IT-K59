# VILYA

# Izinkan paket balasan (agar Vilya tetap bisa internetan)
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Blokir Ping Masuk (ICMP Echo Request)
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

#Elendil: (harus gagal)
ping 10.93.2.38 -c 3

#Vilya: (harus reply) 
ping 8.8.8.8 -c 3x