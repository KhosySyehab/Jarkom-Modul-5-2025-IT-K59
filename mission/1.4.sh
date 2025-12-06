# IRONHILLS
# 1. Install Apache2
apt update && apt install apache2 -y
# 2. Buat Halaman Web (Sesuai Soal)
echo "Welcome to IronHills" > /var/www/html/index.html
# 3. Jalankan Service
service apache2 restart

#PALANTIR
# 1. Install Apache2
apt update && apt install apache2 -y
# 2. Buat Halaman Web
echo "Welcome to Palantir" > /var/www/html/index.html
# 3. Jalankan Service
service apache2 restart

# NARYA
# 1. Install Bind9
apt update && apt install bind9 -y
# 2. Jalankan Service (Manual jika systemd tidak ada)
/usr/sbin/named -u bind
# ATAU jika support service:
service bind9 restart