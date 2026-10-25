# Motorola Edge 50 Neo (`vienna`) Recovery & Device Tree

<p align="center">
  <img src="https://images.unsplash.com/photo-1598327105666-5b89351aff97?q=80&w=1000&auto=format&fit=crop" alt="Motorola Edge 50 Neo" width="400px"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Device-Motorola%20Edge%2050%20Neo-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/Codename-vienna-orange?style=flat-square" />
  <img src="https://img.shields.io/badge/SoC-MediaTek%20MT6878-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Maintenance-Active-success?style=flat-square" />
</p>

---

## 📱 Device Specifications

| Feature | Specification Details |
| :--- | :--- |
| **Marketing Name** | Motorola Edge 50 Neo |
| **Codename** | `vienna` |
| **SoC** | MediaTek Dimensity 7300 (MT6878) — 64-bit Octa-core |
| **GPU** | Mali-G615 MC2 |
| **Display** | 6.4-inch pOLED, 120Hz Refresh Rate, HDR10+ |
| **Battery** | 4310 mAh with 68W TurboPower Fast Charging |
| **Main Camera** | 50 MP (Sony Lytia-700C, OIS) + 13 MP (Ultrawide) + 10 MP (Telephoto) |
| **Partition Layout** | A/B Dynamic Partitions (Virtual A/B) |
| **Storage Type** | UFS |

---

## 🛠️ Repository Purpose
This open-source repository provides the recovery and device configurations for building custom recovery images (OrangeFox / TWRP) and custom ROM architectures for the Motorola Edge 50 Neo. 

---

## 🚀 Building Instructions

### 1. Environment Setup
Clone this repository into your custom recovery source tree under the correct vendor path:
```bash
git clone [https://github.com/wheelfix/android_device_motorola_vienna](https://github.com/wheelfix/android_device_motorola_vienna) -b main device/motorola/vienna
