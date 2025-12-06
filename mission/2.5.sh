# PALANTIR

# Shift Elf (Gilgalad & Cirdan): 07.00 - 15.00
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.2.128/27 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT

# Shift Manusia (Elendil & Isildur): 17.00 - 23.00
iptables -A INPUT -p tcp --dport 80 -s 10.93.0.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.192/26 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT

# Blokir akses di luar jam kerja
iptables -A INPUT -p tcp --dport 80 -j DROP

#Ubah jam di Palantir () lalu tes curl dari Gilgalad/Elendil sesuai jamnya.
date -s "12:00:00" atau "20:00:00"