# WILDERLAND

# 1. Blokir semua paket DARI Khamul (Traffic Outbound)
iptables -I FORWARD -s 10.93.2.160/29 -j DROP
iptables -I INPUT -s 10.93.2.160/29 -j DROP

# 2. Blokir semua paket MENUJU Khamul (Traffic Inbound)
iptables -I FORWARD -d 10.93.2.160/29 -j DROP
iptables -I OUTPUT -d 10.93.2.160/29 -j DROP

#khamul (Harus Gagal)
ping 8.8.8.8 -c 3
#Cek Akses Web (Netcat/Curl): Coba akses ke IronHills atau Palantir.
curl -v http://10.93.2.42
# ATAU
nc -zv 10.93.2.42 80

# Bukti Durin Masih Hidup
ping 8.8.8.8 -c 3