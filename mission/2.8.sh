# OSGILIATH

# Redirect traffic:
# Source: Vilya (10.93.2.38)
# Destination Asli: Khamul (10.93.2.162)
# Target Belok: IronHills (10.93.2.42)

iptables -t nat -A PREROUTING -s 10.93.2.38 -d 10.93.2.162 -j DNAT --to-destination 10.93.2.42

# IRONHILLS
# Izinkan Vilya (Sang Penyihir) masuk ke Web Server
iptables -I INPUT 1 -p tcp --dport 80 -s 10.93.2.38 -j ACCEPT

#Vilya: (IP Khamul). ("Welcome to IronHills")
curl http://10.93.2.162