#NARYA

# Izinkan Vilya
iptables -A INPUT -p udp --dport 53 -s 10.93.2.38 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -s 10.93.2.38 -j ACCEPT

# Blokir Sisanya
iptables -A INPUT -p udp --dport 53 -j DROP
iptables -A INPUT -p tcp --dport 53 -j DROP

#Vilya: (Harus succeeded).
nc -zv 10.93.2.34 53

#Elendil: (Harus Timed out).
nc -zv 10.93.2.34 53 

#Setelah tes selesai, boleh jalankan di Narya agar node lain bisa install paket lagi.
iptables -F