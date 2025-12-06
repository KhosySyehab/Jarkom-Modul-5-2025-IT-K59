# DOKUMENTASI FINAL: ALLIANCE NETWORK DEFENSE
**Topologi:** Daisy Chain (Seri) pada Jalur Selatan & Multi-Homing pada Router Distribusi.
**Prefix Basis:** `10.93.0.0/16`

---

## I. PERHITUNGAN VLSM (VARIABLE LENGTH SUBNET MASK)

Berikut adalah detail perhitungan pembagian blok IP berdasarkan urutan kebutuhan host terbanyak ke terkecil untuk menghemat ruang alamat.

| Prioritas | Nama Node / Subnet | Kebutuhan Host (+GW+Net+BC) | Block Size | Prefix | Subnet Mask | Network ID | Broadcast IP |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | **Elendil** (Pasukan) | 200 + 3 = 203 | 256 | **/24** | 255.255.255.0 | `10.93.0.0` | 10.93.0.255 |
| 2 | **Gilgalad** (Pasukan) | 100 + 3 = 103 | 128 | **/25** | 255.255.255.128 | `10.93.1.0` | 10.93.1.127 |
| 3 | **Durin** (Pasukan) | 50 + 3 = 53 | 64 | **/26** | 255.255.255.192 | `10.93.1.128` | 10.93.1.191 |
| 4 | **Isildur** (Pasukan) | 30 + 3 = 33 | 64 | **/26** | 255.255.255.192 | `10.93.1.192` | 10.93.1.255 |
| 5 | **Cirdan** (Pasukan) | 20 + 3 = 23 | 32 | **/27** | 255.255.255.224 | `10.93.2.128` | 10.93.2.159 |
| 6 | **Khamul** (Pasukan) | 5 + 3 = 8 | 8 | **/29** | 255.255.255.248 | `10.93.2.160` | 10.93.2.167 |
| 7 | **Narya** (DNS) | 1 + 3 = 4 | 4 | **/30** | 255.255.255.252 | `10.93.2.32` | 10.93.2.35 |
| 8 | **Vilya** (DHCP) | 1 + 3 = 4 | 4 | **/30** | 255.255.255.252 | `10.93.2.36` | 10.93.2.39 |
| 9 | **IronHills** (Web) | 1 + 3 = 4 | 4 | **/30** | 255.255.255.252 | `10.93.2.40` | 10.93.2.43 |
| 10 | **Palantir** (Web) | 1 + 3 = 4 | 4 | **/30** | 255.255.255.252 | `10.93.2.44` | 10.93.2.47 |
| 11 | **WAN Links** (6 Link) | 2 + 2 = 4 (per link) | 4 | **/30** | 255.255.255.252 | `10.93.2.8` s.d `.31` | - |

---

## II. TABEL ALOKASI IP (IMPLEMENTASI)

### A. Client & Server (End Devices)

| Node | Network ID | Prefix | Gateway (Router IP) | IP Device (Usable) | Lokasi Fisik (Router) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Elendil** | 10.93.0.0 | /24 | 10.93.0.1 | **10.93.0.2** | Minastir (eth2) |
| **Gilgalad** | 10.93.1.0 | /25 | 10.93.1.1 | **10.93.1.2** | AnduinBanks (eth1) |
| **Durin** | 10.93.1.128 | /26 | 10.93.1.129 | **10.93.1.130** | Wilderland (eth1) |
| **Isildur** | 10.93.1.192 | /26 | 10.93.1.193 | **10.93.1.194** | Minastir (eth2) |
| **Cirdan** | 10.93.2.128 | /27 | 10.93.2.129 | **10.93.2.130** | AnduinBanks (eth1) |
| **Khamul** | 10.93.2.160 | /29 | 10.93.2.161 | **10.93.2.162** | Wilderland (eth1) |
| **Narya** | 10.93.2.32 | /30 | 10.93.2.33 | **10.93.2.34** | Rivendell (eth1) |
| **Vilya** | 10.93.2.36 | /30 | 10.93.2.37 | **10.93.2.38** | Rivendell (eth1) |
| **IronHills**| 10.93.2.40 | /30 | 10.93.2.41 | **10.93.2.42** | Moria (eth1) |
| **Palantir** | 10.93.2.44 | /30 | 10.93.2.45 | **10.93.2.46** | Pelargir (eth2) |

### B. Koneksi WAN (Backbone Router)

| Link ID | Network | Prefix | Router A (Uplink) | Router B (Downlink) | Keterangan |
|---------|---------|--------|-------------------|---------------------|------------|
| WAN 1 | 10.93.2.8 | /30 | Osgiliath (.9) | Moria (.10) | Jalur Barat |
| WAN 2 | 10.93.2.12 | /30 | Osgiliath (.13) | Minastir (.14) | Jalur Selatan |
| WAN 3 | 10.93.2.16 | /30 | Osgiliath (.17) | Rivendell (.18) | Jalur Utara |
| WAN 4 | 10.93.2.20 | /30 | Moria (.21) | Wilderland (.22) | Distribusi Barat |
| WAN 5 | 10.93.2.24 | /30 | Minastir (.25) | Pelargir (.26) | Chain Link 1 |
| WAN 6 | 10.93.2.28 | /30 | Pelargir (.29) | AnduinBanks (.30) | Chain Link 2 |

---

## III. Struktur Topologi & Interface

### A. Router Core & Distribusi
1.  **Osgiliath** (Gateway Utama)
    * `eth0`: Internet (SNAT)
    * `eth1`: Link ke Rivendell
    * `eth2`: Link ke Moria
    * `eth3`: Link ke Minastir
2.  **Moria** (Distribusi Barat)
    * `eth0`: Uplink ke Osgiliath
    * `eth1`: Gateway IronHills
    * `eth2`: Downlink ke Wilderland
3.  **Minastir** (Distribusi Selatan - Head of Chain)
    * `eth0`: Uplink ke Osgiliath
    * `eth1`: Downlink ke Pelargir
    * `eth2`: **Multi-Homing** (Gateway Elendil & Isildur)

### B. Router Edge & Transit
4.  **Wilderland** (Edge Barat)
    * `eth0`: Uplink ke Moria
    * `eth1`: **Multi-Homing** (Gateway Durin & Khamul)
5.  **Rivendell** (Edge Utara)
    * `eth0`: Uplink ke Osgiliath
    * `eth1`: **Multi-Homing** (Gateway Narya & Vilya)
6.  **Pelargir** (Transit Selatan)
    * `eth0`: Uplink dari Minastir
    * `eth1`: Downlink ke AnduinBanks
    * `eth2`: Gateway Palantir
7.  **AnduinBanks** (Edge Selatan - Tail of Chain)
    * `eth0`: Uplink dari Pelargir
    * `eth1`: **Multi-Homing** (Gateway Gilgalad & Cirdan)

---

## IV. Konfigurasi Service & Security

### Service Nodes:
* **Vilya (10.93.2.38):** DHCP Server untuk seluruh subnet client.
* **Narya (10.93.2.34):** DNS Server (Bind9).
* **IronHills (10.93.2.42):** Web Server (Apache2) - Halaman "Welcome to IronHills".
* **Palantir (10.93.2.46):** Web Server (Apache2) - Halaman "Welcome to Palantir".

### Security Policy (Firewall Rules):
1.  **Internet Access:** Menggunakan **SNAT** (bukan Masquerade) di Osgiliath.
2.  **Protection:**
    * **Vilya:** Anti-Ping (Drop ICMP Echo Request).
    * **Narya:** Akses DNS hanya diizinkan dari Vilya.
3.  **Access Control:**
    * **IronHills:** Hanya bisa diakses hari **Sabtu & Minggu**, Rate Limit max 3 koneksi.
    * **Palantir:** Shift kerja (Elf 07-15, Manusia 17-23), Anti Port Scan (Blokir jika >15 port dalam 20s).
4.  **Special Rules:**
    * **Sihir Hitam:** Redirect trafik Vilya->Khamul menjadi ke IronHills (di Osgiliath).
    * **Isolasi Nazgûl:** Blokir total trafik keluar/masuk untuk **Khamul** di router Wilderland.