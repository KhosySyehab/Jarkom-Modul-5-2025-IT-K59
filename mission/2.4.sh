#IRONHILLS

date -s "2025-12-03 12:00:00"

iptables -F
# Izinkan Kurcaci (Durin/Khamul) & Manusia (Elendil/Isildur) HANYA Sabtu-Minggu
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.128/26 -m time --weekdays Wed -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.2.160/29 -m time --weekdays Wed -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.0.0/24 -m time --weekdays Wed -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.192/26 -m time --weekdays Wed -j ACCEPT

# Blokir akses selain aturan di atas
iptables -A INPUT -p tcp --dport 80 -j REJECT --reject-with tcp-reset

#Elendil: Harus BERHASIL ("Welcome to IronHills").
curl http://10.93.2.42 

# Hapus rule Rabu
iptables -F 
# Pasang rule Sabtu,Minggu (Soal Asli)
iptables -A INPUT -p tcp --dport 80 -s 10.93.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT
# ... (masukkan rule subnet lain) ...
iptables -A INPUT -p tcp --dport 80 -j REJECT --reject-with tcp-reset

#Elendil: Hasilnya harus GAGAL (Connection refused).
curl http://10.93.2.42 