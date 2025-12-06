#OSGILIATH

ip a show eth0
# Hapus rule lama
iptables -t nat -F POSTROUTING
# Pasang SNAT (GANTI 192.168.122.92 DENGAN IP ASLI ETH0 ANDA)
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.122.92

#Elendil: (harus reply)
ping 8.8.8.8 -c 3