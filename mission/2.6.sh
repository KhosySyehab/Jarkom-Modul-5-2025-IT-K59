# PALANTIR

# Buat Chain Khusus untuk Log & Drop
iptables -N SCANNER
iptables -A SCANNER -j LOG --log-prefix "PORT_SCAN_DETECTED: "
iptables -A SCANNER -j DROP

# Logic Deteksi
iptables -A INPUT -m recent --name port_scan --update --seconds 20 --hitcount 15 -j SCANNER
iptables -A INPUT -p tcp --syn -m recent --name port_scan --set -j ACCEPT

#Elendil: . (Awalnya akan jalan, lalu tiba-tiba macet/filtered karena terblokir).
nmap -p 1-100 10.93.2.46