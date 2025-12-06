# IRONHILLS

iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 3 -j REJECT

#Elendil, buka 4 terminal. Jalankan di masing-masing. Terminal ke-4 akan ditolak.

apt update && apt install apache2-utils
ab -n 3 -c 2 http://10.93.2.42/