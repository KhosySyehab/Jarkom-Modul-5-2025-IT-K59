# Jika DHCP:
# iface eth0 inet dhcp

# Jika Static:
auto eth0
iface eth0 inet static
    address 10.93.0.2
    netmask 255.255.255.0
    gateway 10.93.0.1
    dns-nameservers 10.93.2.34