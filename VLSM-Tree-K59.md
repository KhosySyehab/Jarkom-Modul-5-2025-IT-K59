# VLSM TREE DAN TABEL SUBNET (REVISI)
## Prefix IP: 10.93.0.0/16

## Tabel Pembagian Subnet (Berdasarkan Topologi Sebenarnya)

| Subnet Name | Network Address | Netmask | Broadcast | Usable Host Range | Host Count | Assigned To | Keterangan |
|-------------|----------------|---------|-----------|-------------------|------------|-------------|------------|
| A1 | 10.93.0.0 | /24 | 10.93.0.255 | 10.93.0.1 - 10.93.0.254 | 254 | **Elendil** | Switch4 - Elendil (200 host) |
| A2 | 10.93.1.0 | /25 | 10.93.1.127 | 10.93.1.1 - 10.93.1.126 | 126 | **Gilgalad** | Switch5 - Gilgalad (100 host) |
| A3 | 10.93.1.128 | /26 | 10.93.1.191 | 10.93.1.129 - 10.93.1.190 | 62 | **Durin** | Switch3 - Durin (50 host) |
| A4 | 10.93.1.192 | /27 | 10.93.1.223 | 10.93.1.193 - 10.93.1.222 | 30 | **Isildur** | Pelargir - Isildur (30 host) |
| A5 | 10.93.1.224 | /27 | 10.93.1.255 | 10.93.1.225 - 10.93.1.254 | 30 | **Cirdan** | Switch5 - Cirdan (20 host) |
| A6 | 10.93.2.0 | /29 | 10.93.2.7 | 10.93.2.1 - 10.93.2.6 | 6 | **Khamul** | Wilderland - Khamul (5 host) |
| A7 | 10.93.2.8 | /30 | 10.93.2.11 | 10.93.2.9 - 10.93.2.10 | 2 | P2P | Osgiliath (eth2) - Moria (eth0) |
| A8 | 10.93.2.12 | /30 | 10.93.2.15 | 10.93.2.13 - 10.93.2.14 | 2 | P2P | Osgiliath (eth3) - Minastir (eth0) |
| A9 | 10.93.2.16 | /30 | 10.93.2.19 | 10.93.2.17 - 10.93.2.18 | 2 | P2P | Osgiliath (eth1) - Rivendell (eth0) |
| A10 | 10.93.2.20 | /30 | 10.93.2.23 | 10.93.2.21 - 10.93.2.22 | 2 | P2P | Osgiliath (eth0) - Pelargir (eth1) |
| A11 | 10.93.2.24 | /30 | 10.93.2.27 | 10.93.2.25 - 10.93.2.26 | 2 | P2P | Osgiliath (eth0) - AnduinBanks (eth0) |
| A12 | 10.93.2.28 | /30 | 10.93.2.31 | 10.93.2.29 - 10.93.2.30 | 2 | P2P | Moria (eth1) - Wilderland (eth0) |
| A13 | 10.93.2.32 | /30 | 10.93.2.35 | 10.93.2.33 - 10.93.2.34 | 2 | P2P | Moria (eth1) - Switch2 (e0) |
| A14 | 10.93.2.36 | /30 | 10.93.2.39 | 10.93.2.37 - 10.93.2.38 | 2 | P2P | Wilderland (eth2) - Switch3 (e0) |
| A15 | 10.93.2.40 | /30 | 10.93.2.43 | 10.93.2.41 - 10.93.2.42 | 2 | P2P | Rivendell (eth1) - Switch1 (e0) |
| A16 | 10.93.2.44 | /30 | 10.93.2.47 | 10.93.2.45 - 10.93.2.46 | 2 | P2P | Minastir (eth1) - Switch4 (e0) |
| A17 | 10.93.2.48 | /30 | 10.93.2.51 | 10.93.2.49 - 10.93.2.50 | 2 | P2P | Pelargir (eth0) - Switch4 (e1) |
| A18 | 10.93.2.52 | /30 | 10.93.2.55 | 10.93.2.53 - 10.93.2.54 | 2 | P2P | AnduinBanks (eth1) - Switch5 (e0) |
| A19 | 10.93.2.56 | /30 | 10.93.2.59 | 10.93.2.57 - 10.93.2.58 | 2 | P2P | Switch1 (e2) - Vilya (eth0) |
| A20 | 10.93.2.60 | /30 | 10.93.2.63 | 10.93.2.61 - 10.93.2.62 | 2 | P2P | Switch1 (e1) - Narya (eth0) |
| A21 | 10.93.2.64 | /30 | 10.93.2.67 | 10.93.2.65 - 10.93.2.66 | 2 | P2P | Switch2 (e1) - IronHills (eth0) |
| A22 | 10.93.2.68 | /30 | 10.93.2.71 | 10.93.2.69 - 10.93.2.70 | 2 | P2P | Switch2 (e0) - Palantir (eth0) |

## Struktur Jaringan Berdasarkan Topologi:

### Client Subnets (butuh DHCP):
1. **Khamul** (5 host): 10.93.2.0/29 → terhubung ke Wilderland (eth1)
2. **Durin** (50 host): 10.93.1.128/26 → terhubung ke Switch3 (e1)
3. **Gilgalad** (100 host): 10.93.1.0/25 → terhubung ke Switch5 (e3)
4. **Elendil** (200 host): 10.93.0.0/24 → terhubung ke Switch4 (e1)
5. **Cirdan** (20 host): 10.93.1.224/27 → terhubung ke Switch5 (e2)
6. **Isildur** (30 host): 10.93.1.192/27 → terhubung ke Pelargir (eth2)

### Server Subnets:
1. **Vilya** (DHCP): 10.93.2.58/30 → gateway 10.93.2.57
2. **Narya** (DNS): 10.93.2.62/30 → gateway 10.93.2.61
3. **Palantir** (Web): 10.93.2.70/30 → gateway 10.93.2.69
4. **IronHills** (Web): 10.93.2.66/30 → gateway 10.93.2.65

## DHCP Relay Locations:
- **Wilderland**: Relay untuk Khamul dan Durin
- **Rivendell**: Relay untuk Vilya/Narya (jika diperlukan)
- **Minastir**: Relay untuk Elendil
- **AnduinBanks**: Relay untuk Gilgalad dan Cirdan

## Gateway untuk Setiap Subnet Client:
- Khamul: 10.93.2.1 (Wilderland eth1)
- Durin: 10.93.1.129 (interface Switch3 ke Durin - **PERLU ROUTER**)
- Gilgalad: 10.93.1.1 (interface Switch5 ke Gilgalad - **PERLU ROUTER**)
- Elendil: 10.93.0.1 (interface Switch4 ke Elendil - **PERLU ROUTER**)
- Cirdan: 10.93.1.225 (interface Switch5 ke Cirdan - **PERLU ROUTER**)
- Isildur: 10.93.1.193 (Pelargir eth2)
