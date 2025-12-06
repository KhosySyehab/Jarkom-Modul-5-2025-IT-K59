# Jarkom-Modul-5-2025-IT-K59

---
## Anggota Kelompok
| Nama | NRP |
|------|------|
| Muhammad Farrel Rafli Al Fasya | 5027241075 |
| Muhammad Khosyi Syehab | 5027241089 |
---

### Misi 1 : Memetakan Medan Perang

#### 1. Identifikasi Perangkat
* **Narya:** Berfungsi sebagai DNS Server.
* **Vilya:** Berfungsi sebagai DHCP Server.
* **Web Servers:** Palantir dan IronHills.
* **Client (Pasukan):**
    * **Khamul:** 5 host (Target/Burnice).
    * **Cirdan:** 20 host (Lycaon).
    * **Isildur:** 30 host (Policeboo).
    * **Durin:** 50 host (Caesar).
    * **Gilgalad:** 100 host (Ellen).
    * **Elendil:** 200 host (Jane).

#### 2. Pembagian Subnet (VLSM)
**Prefix Basis:** `10.93.0.0/16`

Berikut adalah hierarki pembagian IP yang digunakan dalam topologi jaringan Aliansi (Daisy Chain & Multi-Homing):

**Tabel Subnet Client & Server (Host)**

| Prioritas | Node | Kebutuhan | Block Size | Prefix | Network ID | Gateway | Range Host |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Elendil** | 200 | 256 | **/24** | `10.93.0.0` | 10.93.0.1 | .2 - .254 |
| 2 | **Gilgalad** | 100 | 128 | **/25** | `10.93.1.0` | 10.93.1.1 | .2 - .126 |
| 3 | **Durin** | 50 | 64 | **/26** | `10.93.1.128` | 10.93.1.129 | .130 - .190 |
| 4 | **Isildur** | 30 | 64 | **/26** | `10.93.1.192` | 10.93.1.193 | .194 - .254 |
| 5 | **Cirdan** | 20 | 32 | **/27** | `10.93.2.128` | 10.93.2.129 | .130 - .158 |
| 6 | **Khamul** | 5 | 8 | **/29** | `10.93.2.160` | 10.93.2.161 | .162 - .166 |
| 7 | **Narya** | 1 | 4 | **/30** | `10.93.2.32` | 10.93.2.33 | 10.93.2.34 |
| 8 | **Vilya** | 1 | 4 | **/30** | `10.93.2.36` | 10.93.2.37 | 10.93.2.38 |
| 9 | **IronHills** | 1 | 4 | **/30** | `10.93.2.40` | 10.93.2.41 | 10.93.2.42 |
| 10 | **Palantir** | 1 | 4 | **/30** | `10.93.2.44` | 10.93.2.45 | 10.93.2.46 |

**Tabel Subnet WAN (Backbone Router)**

| Link | Network ID | Prefix | Router A (Uplink) | Router B (Downlink) | Keterangan |
| :--- | :--- | :--- | :--- | :--- | :--- |
| WAN 1 | `10.93.2.8` | /30 | Osgiliath (.9) | Moria (.10) | Jalur Barat |
| WAN 2 | `10.93.2.12` | /30 | Osgiliath (.13) | Minastir (.14) | Jalur Selatan |
| WAN 3 | `10.93.2.16` | /30 | Osgiliath (.17) | Rivendell (.18) | Jalur Utara |
| WAN 4 | `10.93.2.20` | /30 | Moria (.21) | Wilderland (.22) | Distribusi Barat |
| WAN 5 | `10.93.2.24` | /30 | Minastir (.25) | Pelargir (.26) | Chain Link 1 |
| WAN 6 | `10.93.2.28` | /30 | Pelargir (.29) | AnduinBanks (.30) | Chain Link 2 |

#### 3. Konfigurasi Routing (Misi 1 No. 3)
Routing menggunakan **Static Route** dengan topologi Daisy Chain (Seri) pada jalur Selatan.

**Router: OSGILIATH (Core)**
```bash
# Routing ke seluruh subnet bawah
up ip route add 10.93.0.0/24 via 10.93.2.14
up ip route add 10.93.1.0/25 via 10.93.2.14
up ip route add 10.93.1.128/26 via 10.93.2.10
up ip route add 10.93.1.192/26 via 10.93.2.14
up ip route add 10.93.2.20/30 via 10.93.2.10
up ip route add 10.93.2.24/30 via 10.93.2.14
up ip route add 10.93.2.28/30 via 10.93.2.14
up ip route add 10.93.2.32/30 via 10.93.2.18
up ip route add 10.93.2.36/30 via 10.93.2.18
up ip route add 10.93.2.40/30 via 10.93.2.10
up ip route add 10.93.2.44/30 via 10.93.2.14
up ip route add 10.93.2.128/27 via 10.93.2.14
up ip route add 10.93.2.160/29 via 10.93.2.10
# Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
```

**Router: MINASTIR (Head of Chain)**
```bash
# Routing ke Rantai Bawah via Pelargir (.26)
up ip route add 10.93.2.28/30 via 10.93.2.26
up ip route add 10.93.1.0/25 via 10.93.2.26
up ip route add 10.93.2.128/27 via 10.93.2.26
up ip route add 10.93.2.44/30 via 10.93.2.26
echo 1 > /proc/sys/net/ipv4/ip_forward
```

**Router: PELARGIR (Transit)**
```bash
# Default Route ke Minastir (.25)
up ip route add default via 10.93.2.25
# Routing ke Bawah via AnduinBanks (.30)
up ip route add 10.93.1.0/25 via 10.93.2.30
up ip route add 10.93.2.128/27 via 10.93.2.30
echo 1 > /proc/sys/net/ipv4/ip_forward
```

**Router: MORIA**
```bash
# Routing ke Wilderland
up ip route add 10.93.1.128/26 via 10.93.2.22
up ip route add 10.93.2.160/29 via 10.93.2.22
echo 1 > /proc/sys/net/ipv4/ip_forward
```

#### 4. Konfigurasi Service (Misi 1 No. 4)

**A. VILYA (DHCP Server)**
* **Paket:** `isc-dhcp-server`
* **Konfigurasi:** File `/etc/dhcp/dhcpd.conf` mencakup semua subnet:
    * Subnet Elendil (`10.93.0.0/24`)
    * Subnet Gilgalad (`10.93.1.0/25`)
    * Subnet Durin (`10.93.1.128/26`)
    * Subnet Isildur (`10.93.1.192/26`)
    * Subnet Cirdan (`10.93.2.128/27`)
    * Subnet Khamul (`10.93.2.160/29`)
* **Catatan:** `Option Routers` diarahkan ke Gateway masing-masing subnet. `Option DNS` diarahkan ke Narya (`10.93.2.34`).

**B. DHCP Relay**
* **Paket:** `isc-dhcp-relay` diinstall pada router:
    * **Minastir:** Interface `eth2` (Arah Elendil/Isildur)
    * **AnduinBanks:** Interface `eth1` (Arah Gilgalad/Cirdan)
    * **Wilderland:** Interface `eth1` (Arah Durin/Khamul)
    * **Rivendell:** Interface `eth1` (Arah Vilya)
* **Target Server:** `10.93.2.38`

**C. NARYA (DNS Server)**
* **Paket:** `bind9`
* **Service:** Berjalan pada port 53 (UDP/TCP).

**D. WEB SERVERS**
* **Paket:** `apache2`
* **IronHills:** File `/var/www/html/index.html` berisi `"Welcome to IronHills"`.
* **Palantir:** File `/var/www/html/index.html` berisi `"Welcome to Palantir"`.

---

### Misi 2: Menemukan Jejak Kegelapan (Security Rules)

Berikut adalah aturan Firewall (iptables) yang diterapkan untuk mengamankan jaringan.

#### 1. Akses Internet (SNAT)

**Lokasi:** Osgiliath
**Deskripsi:** Mengganti Masquerade dengan SNAT agar routing lebih spesifik.
```bash
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source [IP_WAN_ETH0]
```

#### 2. Proteksi Vilya (Anti-Ping)

**Lokasi:** Vilya
**Deskripsi:** Vilya menolak ping dari luar, tapi bisa ping keluar.
```bash
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
```

#### 3. Keamanan DNS Narya

**Lokasi:** Narya
**Deskripsi:** Hanya Vilya yang diizinkan mengakses port 53.
```bash
iptables -A INPUT -p udp --dport 53 -s 10.93.2.38 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -s 10.93.2.38 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j DROP
iptables -A INPUT -p tcp --dport 53 -j DROP
```

#### 4. Akses Akhir Pekan IronHills

**Lokasi:** IronHills
**Deskripsi:** Akses Web hanya diizinkan pada hari Sabtu & Minggu untuk IP tertentu.
```bash
# Izinkan IP Kurcaci & Manusia pada Sabtu-Minggu
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.128/26 -m time --weekdays Sat,Sun -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.2.160/29 -m time --weekdays Sat,Sun -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.0.0/24 -m time --weekdays Sat,Sun -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.192/26 -m time --weekdays Sat,Sun -j ACCEPT
# Bypass untuk Sihir Hitam (Redirect dari Vilya)
iptables -A INPUT -p tcp --dport 80 -s 10.93.2.38 -j ACCEPT
# Blokir sisanya
iptables -A INPUT -p tcp --dport 80 -j REJECT
```

#### 5. Shift Kerja Palantir

**Lokasi:** Palantir
**Deskripsi:** Membatasi akses berdasarkan jam kerja Ras.
```bash
# Shift Elf (07:00 - 15:00)
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.0/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.2.128/27 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT
# Shift Manusia (17:00 - 23:00)
iptables -A INPUT -p tcp --dport 80 -s 10.93.0.0/24 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.93.1.192/26 -m time --timestart 17:00 --timestop 23:00 -j ACCEPT
# Blokir di luar jam kerja
iptables -A INPUT -p tcp --dport 80 -j DROP
```

#### 6. Anti Port Scan

**Lokasi:** Palantir
**Deskripsi:** Mendeteksi dan memblokir scan port berlebih (>15 port dalam 20 detik).
```bash
iptables -N SCANNER
iptables -A SCANNER -j LOG --log-prefix "PORT_SCAN: "
iptables -A SCANNER -j DROP
iptables -A INPUT -m recent --name port_scan --update --seconds 20 --hitcount 15 -j SCANNER
iptables -A INPUT -p tcp --syn -m recent --name port_scan --set -j ACCEPT
```

#### 7. Rate Limiting IronHills

**Lokasi:** IronHills
**Deskripsi:** Membatasi maksimal 3 koneksi bersamaan per IP.
```bash
iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 3 -j REJECT
```

#### 8. Sihir Hitam (Traffic Redirection)

**Lokasi:** Osgiliath
**Deskripsi:** Membelokkan trafik dari Vilya yang menuju Khamul, agar sampai ke IronHills.
```bash
iptables -t nat -A PREROUTING -s 10.93.2.38 -d 10.93.2.162 -j DNAT --to-destination 10.93.2.42
```

---

### Misi 3: Isolasi Sang Nazgûl (Khamul)

**Lokasi:** Router Wilderland
**Deskripsi:** Memblokir total akses jaringan untuk subnet Khamul (10.93.2.160/29), namun memastikan Durin (10.93.1.128/26) tetap aman.
```bash
# Blokir Paket DARI Khamul (Source)
iptables -I FORWARD -s 10.93.2.160/29 -j DROP
iptables -I INPUT -s 10.93.2.160/29 -j DROP
# Blokir Paket MENUJU Khamul (Destination)
iptables -I FORWARD -d 10.93.2.160/29 -j DROP
iptables -I OUTPUT -d 10.93.2.160/29 -j DROP
```