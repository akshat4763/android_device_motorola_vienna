# Motorola Edge 50 Neo (`vienna`) Device Tree

<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/bigpic/motorola-edge-50-neo.jpg" alt="Motorola Edge 50 Neo" width="300px"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Device-Motorola%20Edge%2050%20Neo-blue?style=flat-square" />
  <img src="https://img.shields.io/badge/Codename-vienna-orange?style=flat-square" />
  <img src="https://img.shields.io/badge/SoC-MediaTek%20MT6878-green?style=flat-square" />
  <img src="https://img.shields.io/badge/Base-CMF%20Tetris%20MT6878-purple?style=flat-square" />
  <img src="https://img.shields.io/badge/Status-WIP%20Bringup-yellow?style=flat-square" />
</p>

---

## 📱 Device Specifications

| Feature | Specification Details |
| :--- | :--- |
| **Marketing Name** | Motorola Edge 50 Neo |
| **Codename** | `vienna` |
| **Model Variants** | XT2409 / XT2409-3 |
| **SoC** | MediaTek Dimensity 7300 (`MT6878`) |
| **CPU Architecture** | 4x Cortex-A78 @ 2.5 GHz + 4x Cortex-A55 @ 2.0 GHz (arm64-v8a) |
| **GPU** | ARM Mali-G615 MC2 |
| **Display** | 6.4" 1.5K LTPO pOLED, 120Hz, HDR10+ |
| **Battery** | 4310 mAh, 68W TurboPower Fast Charging |
| **Storage / RAM** | UFS 3.1 / LPDDR4X |
| **Partition Scheme** | Virtual A/B (V/A/B) with Retrofit Super Partition |
| **Kernel / Android Base** | Linux 6.1 (GKI) / Android 14–16 Base |

---

## 🛠️ Bringup Overview

This device tree configures AOSP/LineageOS-based custom builds for the Motorola Edge 50 Neo (`vienna`). 

Because Motorola employs Treble-style platform updates with locked vendor baselines on the `MT6878` platform, this tree uses:
* **Base Platform Plumbing:** MediaTek common framework, compiler targets, and display/audio HAL bridges ported from the CMF Phone 1 (`tetris` / MT6878).
* **Hardware Overlay & Firmware:** Partition layouts, `fstab` entries, device trees (`dtbo`), and proprietary blobs extracted from clean stock Motorola Vienna firmware.

---

## 🚀 Setup & Build Instructions

### 1. Clone the Device Tree
Clone this repository into your ROM source tree:
```bash
git clone [https://github.com/your-username/android_device_motorola_vienna](https://github.com/your-username/android_device_motorola_vienna) device/motorola/vienna
