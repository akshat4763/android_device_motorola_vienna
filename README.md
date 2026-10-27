# Motorola Edge 50 Neo (`vienna`) Device Tree

<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/bigpic/motorola-edge-50-neo.jpg" alt="Motorola Edge 50 Neo" width="300"/>
</p>

<p align="center">
  <b>Android Custom ROM Bring-up Project</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Device-Motorola%20Edge%2050%20Neo-2E86DE?style=flat-square" alt="Device"/>
  <img src="https://img.shields.io/badge/Codename-vienna-orange?style=flat-square" alt="Codename"/>
  <img src="https://img.shields.io/badge/SoC-MediaTek%20MT6878-green?style=flat-square" alt="SoC"/>
  <img src="https://img.shields.io/badge/Status-Work%20in%20Progress-yellow?style=flat-square" alt="Development status"/>
</p>

---

## Overview

This repository contains the device-specific configuration and ongoing bring-up work for the **Motorola Edge 50 Neo** (`vienna`), with the goal of enabling Android Open Source Project (AOSP)-based custom ROM development.

The project focuses on understanding the device's hardware configuration, adapting the necessary device-specific components, and establishing a foundation for building and testing custom Android ROMs.

Development is currently in progress. Hardware support, compilation, booting, and runtime functionality must be verified as development advances.

### Project Goals

- Establish a maintainable device tree for `vienna`.
- Adapt the necessary device configuration for an AOSP-based ROM.
- Investigate hardware compatibility and proprietary vendor dependencies.
- Configure the required partition, boot, kernel, and recovery-related components.
- Develop and validate SELinux policies and device-specific resource overlays.
- Work toward a bootable custom ROM and progressively improve hardware functionality.

## Device Specifications

| Component | Specification |
|---|---|
| Device | Motorola Edge 50 Neo |
| Device codename | `vienna` |
| Model | XT2409 series |
| Target variant | XT2409-3 |
| Software channel | RETIN (India) |
| SoC | MediaTek Dimensity 7300 |
| Platform | MediaTek MT6878 |
| CPU | Octa-core ARM64 |
| GPU | ARM Mali-G615 MC2 |
| Display | 6.4-inch pOLED, 1.5K, up to 120 Hz |
| Storage | UFS 3.1 |
| Memory | LPDDR4X |
| Stock firmware reference | `W1UI36H.39-25-11-4` |
| Android version of reference firmware | Android 16 |
| Development target | AOSP-based custom ROM |

*Specifications and configuration details should be checked against the exact hardware variant and firmware used for development.*

## Development Status

**Current stage: Initial device-tree bring-up and research.**

The objective is to build a reliable device-specific foundation before attempting to establish a fully functional custom ROM.

| Component | Status |
|---|---|
| Device identification and firmware research | In progress |
| Stock firmware extraction and analysis | In progress |
| Device-tree configuration | In progress |
| Proprietary vendor dependency mapping | In progress |
| Kernel and boot-image investigation | In progress |
| SELinux policy and resource overlays | In progress |
| Initial ROM compilation | Not yet confirmed |
| First successful boot | Not yet confirmed |
| Hardware functionality testing | Pending validation |

Statuses will be updated as components are implemented and tested. A configuration being present in the repository does not necessarily mean that the corresponding hardware feature is functional.

## Bring-up Approach

The bring-up process involves investigating the stock firmware, identifying the device-specific components, and adapting the configuration required by the selected ROM source.

### 1. Device Configuration

The device tree is intended to contain the configuration required to identify and configure `vienna` within an Android ROM build system.

Depending on the selected ROM and the current repository contents, this may include:

- Product and device makefiles.
- Board configuration and build properties.
- Device-specific resource overlays.
- Partition and filesystem configuration.
- Init scripts and hardware initialization.
- SELinux policy.
- Kernel and boot-image integration.

### 2. Hardware and Vendor Dependencies

The device relies on proprietary components for parts of its hardware implementation. These dependencies must be identified and matched to the relevant firmware and Android platform.

Areas under investigation include:

- MediaTek platform integration.
- Display and graphics.
- Camera and image processing.
- Audio and connectivity.
- Sensors and other hardware interfaces.
- Vendor services and HALs.
- Power management and charging.

The presence of a vendor component does not, by itself, guarantee compatibility with a different Android framework version.

### 3. Reference Device Research

The CMF Phone 1 (`tetris`), which uses the MediaTek MT6878 platform, may serve as a **reference for comparative research**.

Its configuration can help identify common platform conventions, build-system requirements, and potential starting points for investigation.

However, `tetris` and `vienna` are different devices. Any reused or adapted configuration must be reviewed against the Motorola Edge 50 Neo's own hardware, firmware, partition layout, kernel interfaces, and vendor implementation. Device-specific files must not be assumed interchangeable.

## Firmware Reference

The initial investigation uses stock Motorola firmware for the target device.

Reference build:

```text
Device:       Motorola Edge 50 Neo
Codename:     vienna
Model:        XT2409-3
Channel:      RETIN
Build:        W1UI36H.39-25-11-4
Android:      16
```

Firmware analysis can help identify partition images, boot configuration, device-specific properties, vendor components, and other implementation details needed during bring-up.

Stock firmware is a reference for investigation, not proof that a device tree or vendor configuration is compatible with another Android version.

## Proprietary Vendor Blobs

Custom ROM development may require proprietary libraries, executables, firmware files, and hardware abstraction layer components from the stock firmware.

If supported by the repository's extraction scripts and blob lists, the extraction process can be run using:

```bash
./extract-files.sh /path/to/stock_firmware_or_dump
```

The expected input depends on the extraction script. Some implementations require a mounted or extracted firmware image, an ADB-connected device, or a specific directory structure.

Before extraction, review the repository's `extract-files.sh`, `setup-makefiles.sh`, and `proprietary-files.txt` to confirm the supported workflow.

**Note:** This repository's device-specific configuration and proprietary blob mappings should be treated as separate concerns. Blob availability, licensing, and compatibility must be assessed independently.

## Getting Started

### Prerequisites

A typical Android ROM development environment requires:

- A Linux build environment.
- Git and the build dependencies documented by the selected ROM.
- A suitable Java Development Kit (JDK).
- The Android build tools and source tree required by the target ROM.
- Adequate RAM and storage for the selected Android platform and build configuration.

Check the official documentation for your chosen ROM before setting up the environment.

### Clone the Device Tree

Clone the repository into the device-specific directory of your ROM source tree:

```bash
git clone https://github.com/akshat4763/android_device_motorola_vienna.git device/motorola/vienna
```

Verify the repository structure and required dependencies before proceeding.

### Build Integration

The exact build commands depend on the ROM source, product configuration, branch, and build target implemented by the device tree.

For a compatible ROM source tree, the general workflow is:

```bash
source build/envsetup.sh
```

Select the actual product target defined by the device tree and supported by the ROM source. For example, `lineage_vienna-userdebug` is only an illustrative target name and must not be assumed to exist.

After confirming the product configuration and required dependencies, proceed with the build using the instructions for the selected ROM.

**Important:** Cloning a device tree into a ROM source tree does not automatically make the device buildable. Required common trees, vendor dependencies, kernel configuration, product definitions, and other components must also be available and correctly integrated.

## Testing and Validation

Once a build becomes available, validation should be performed incrementally.

Recommended areas of investigation include:

1. Build-system configuration and product resolution.
2. Kernel, boot image, and device-tree compatibility.
3. Partition layout and boot-image requirements.
4. Boot process, init services, and SELinux denials.
5. Display, touch, audio, camera, sensors, and connectivity.
6. Charging, power management, and suspend/resume.
7. Stability, logs, and regression testing.

Initial testing should be performed on hardware with a verified recovery path and a backup of the original firmware.

Do not assume that a successful compilation means the ROM will boot, or that a successful boot means all hardware components work.

## Contributing

Contributions, technical feedback, and device-specific research are welcome.

If you have experience with MediaTek platforms, Motorola devices, Android device trees, kernel integration, or custom ROM bring-up, consider helping with:

- Reviewing device-specific configuration.
- Identifying missing dependencies.
- Comparing reference configurations with stock firmware.
- Debugging compilation and boot failures.
- Testing hardware functionality.
- Improving documentation and reproducibility.

When submitting an issue or pull request, include relevant logs, the firmware version, the ROM branch, and the exact steps needed to reproduce the problem. Please avoid posting personal information or sensitive device identifiers.

## Community

- **GitHub Repository:** [android_device_motorola_vienna](https://github.com/akshat4763/android_device_motorola_vienna)
- **XDA Forums:** [Motorola Edge 50 Neo Rooting & Development](https://xdaforums.com/t/rooting-motorola-edge-50-neo.4713457/)

Use the GitHub issue tracker for repository-specific development issues and the XDA thread for community discussion, device research, and collaboration.

## Disclaimer

This project is an independent development effort and is not affiliated with, endorsed by, or supported by Motorola, Lenovo, MediaTek, or any custom ROM project unless explicitly stated.

This repository is a work in progress. No claim is made that a complete, bootable, or fully functional custom ROM is currently available.

Custom ROM development and flashing carry risks, including data loss, boot loops, and device failure. Verify all instructions for your exact device variant, maintain appropriate backups, and understand the recovery procedure before flashing anything.

## License and Attribution

Original device-specific work should be licensed under the terms specified in this repository's `LICENSE` file, if present.

Third-party configurations, source code, and proprietary components remain subject to their respective licenses and redistribution terms. Please retain required copyright notices and provide attribution for any code or configuration adapted from other projects.

---

<p align="center">
  <b>Motorola Edge 50 Neo · vienna</b><br/>
  Community-driven Android development
</p>
