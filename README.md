# Motorola Edge 50 Neo (`vienna`) Device Tree

<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/bigpic/motorola-edge-50-neo.jpg" alt="Motorola Edge 50 Neo" width="300"/>
</p>

<p align="center">
  <b>Experimental Android Custom ROM Development</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Device-Motorola%20Edge%2050%20Neo-2E86DE?style=flat-square" alt="Device"/>
  <img src="https://img.shields.io/badge/Codename-vienna-orange?style=flat-square" alt="Codename"/>
  <img src="https://img.shields.io/badge/SoC-MediaTek%20MT6878-green?style=flat-square" alt="SoC"/>
  <img src="https://img.shields.io/badge/Initial%20Bring--up-Complete-blue?style=flat-square" alt="Initial bring-up complete"/>
  <img src="https://img.shields.io/badge/Status-Experimental%20%7C%20Untested-orange?style=flat-square" alt="Experimental and untested"/>
</p>

---

## Overview

This repository contains the device tree for the **Motorola Edge 50 Neo** (`vienna`), developed as a foundation for Android Open Source Project (AOSP)-based custom ROM development.

The initial device-tree bring-up has been completed. The current configuration represents the first clean experimental version prepared for the next stage of development: compilation, boot testing, and hardware validation.

The device tree has **not yet been validated through confirmed ROM compilation and on-device testing**. Its build compatibility, bootability, and hardware functionality therefore remain unverified.

### Project Goals

- Establish a device-specific configuration for the Motorola Edge 50 Neo.
- Prepare the initial device tree for integration with an AOSP-based ROM.
- Investigate stock firmware, partition layouts, and hardware dependencies.
- Identify and integrate the required proprietary vendor components.
- Establish the configuration needed for kernel and boot-image integration.
- Validate SELinux policies, device-specific overlays, and initialization.
- Progress toward a bootable custom ROM with functional hardware support.

## Device Specifications

| Component | Specification |
|---|---|
| Device | Motorola Edge 50 Neo |
| Codename | `vienna` |
| Model family | XT2409 series |
| Target variant | XT2409-3 |
| Software channel | RETIN (India) |
| SoC | MediaTek Dimensity 7300 |
| Platform | MediaTek MT6878 |
| CPU | Octa-core ARM64 |
| GPU | ARM Mali-G615 MC2 |
| Display | 6.4-inch pOLED, 1.5K resolution, up to 120 Hz |
| Storage | UFS 3.1 |
| RAM | LPDDR4X |
| Reference firmware | `W1UI36H.39-25-11-4` |
| Reference firmware Android version | Android 16 |
| Development target | AOSP-based custom ROM |

*Specifications describe the target device and reference firmware. Exact hardware and software configuration should be verified against the target variant.*

## Development Status

**Initial device-tree bring-up: Complete.**

**Current phase: Experimental validation and testing.**

The initial device-specific configuration has been assembled. The project is now ready to move into the next phase of validation, where the tree and its dependencies can be evaluated through ROM compilation, boot testing, and hardware checks.

| Development stage | Status |
|---|---|
| Device identification | Completed |
| Initial device-tree configuration | Completed |
| Initial clean device-tree bring-up | Completed |
| Stock firmware research | Performed; further investigation may be needed |
| Proprietary dependency validation | Pending verification |
| ROM compilation | Not yet confirmed |
| Successful on-device boot | Not yet confirmed |
| Hardware functionality | Untested |
| Stability testing | Pending |

These statuses distinguish completed device-tree preparation from the testing required to establish whether the configuration works correctly in practice.

## Bring-up Architecture

The device tree is intended to provide the device-specific configuration needed to integrate `vienna` into an Android ROM build environment.

The bring-up involves several related areas.

### Device Configuration

Depending on the target ROM and repository implementation, the device configuration may include:

- Product and device makefiles.
- Board configuration and build properties.
- Device-specific resource overlays.
- Partition and filesystem configuration.
- Init scripts and hardware initialization.
- SELinux policy.
- Kernel and boot-image integration.
- ROM-specific product configuration.

The exact requirements depend on the selected Android platform and the structure of this repository.

### Hardware and Vendor Integration

The Motorola Edge 50 Neo depends on platform-specific and proprietary components for hardware functionality.

Areas requiring investigation and validation include:

- MediaTek platform integration.
- Display and graphics.
- Camera and image processing.
- Audio.
- Connectivity.
- Sensors.
- Power management and charging.
- Vendor services and hardware abstraction layers (HALs).

The presence of configuration files or proprietary components does not guarantee that the corresponding hardware functionality is working.

### Reference Device: CMF Phone 1 (`tetris`)

The CMF Phone 1 (`tetris`) uses the MediaTek MT6878 platform and may provide a useful reference for comparative device-tree research.

Its configuration can help with understanding common MediaTek platform conventions, build-system integration, and potential implementation approaches.

However, `tetris` and `vienna` are different devices. Their hardware configuration, vendor implementation, firmware, partition layouts, and peripheral integration must not be assumed to be interchangeable.

Any adapted configuration must be reviewed and adjusted for the Motorola Edge 50 Neo.

## Stock Firmware Reference

The initial device investigation uses stock Motorola firmware as a reference for device-specific properties, partition information, boot configuration, and proprietary dependencies.

Reference details:

```text
Device:           Motorola Edge 50 Neo
Codename:         vienna
Model:            XT2409-3
Software channel: RETIN
Build:            W1UI36H.39-25-11-4
Android version:  16
```

Stock firmware analysis can help identify the components required for custom ROM development and provide a baseline for comparing device-specific configuration.

Using Android 16 stock firmware as a reference does not, by itself, establish compatibility with an Android 15 or other custom ROM target. Kernel interfaces, vendor components, framework expectations, and build requirements must be evaluated for the specific target.

## Proprietary Vendor Blobs

Custom ROM development may require proprietary libraries, executables, firmware files, and HAL components from the stock firmware.

Where supported by the repository's extraction scripts and blob list, extraction may follow this general form:

```bash
./extract-files.sh /path/to/stock_firmware_or_dump
```

The exact input format depends on the implementation of the extraction script. It may require an extracted firmware directory, mounted images, an ADB-connected device, or another supported input source.

Before running the extraction process, review:

- `extract-files.sh`
- `setup-makefiles.sh`
- `proprietary-files.txt`

These files should be checked to determine the expected source paths, extraction method, and required dependencies.

**Important:** Proprietary blob mappings and successful extraction do not establish that the blobs are compatible with the selected ROM or Android version. Compatibility and redistribution permissions must be assessed separately.

## Getting Started

### Prerequisites

A typical Android ROM development environment requires:

- A compatible Linux build environment.
- Git and the dependencies documented by the target ROM.
- A compatible Java Development Kit (JDK).
- The source tree for the selected ROM.
- Sufficient RAM and storage for the chosen Android platform.
- Any required device-specific, common-platform, kernel, and vendor dependencies.

Follow the official build instructions for the ROM you intend to use.

### Clone the Device Tree

From the root of your ROM source tree, clone this repository into the device-specific directory:

```bash
git clone https://github.com/akshat4763/android_device_motorola_vienna.git device/motorola/vienna
```

Inspect the repository structure and verify that the files are in the expected locations.

### Integrate with a ROM Source Tree

The device tree must be integrated with a compatible ROM source tree and all required dependencies.

Before attempting a build, verify:

1. The device product is defined correctly.
2. The selected ROM branch is compatible with the configuration.
3. Required common device-tree dependencies are present.
4. Kernel and vendor dependencies are available and correctly referenced.
5. Proprietary blobs are mapped and extracted where required.
6. Partition, boot-image, and filesystem configurations match the device.
7. Required product makefiles and build targets resolve correctly.

### Build Configuration

Once the source tree and dependencies have been configured, initialize the ROM build environment:

```bash
source build/envsetup.sh
```

Select the product target actually defined by the device tree and supported by the ROM source.

For example, `lineage_vienna-userdebug` would be a possible naming convention, but **it is only an example and must not be assumed to exist in this repository**.

Proceed with compilation only after confirming the product configuration and build requirements against the selected ROM.

A successful device-tree setup does not guarantee successful compilation. Likewise, successful compilation does not guarantee a bootable ROM.

## Testing and Validation

The next stage is to validate the initial device tree in a controlled development environment.

Recommended validation areas include:

### Build Validation

- Product configuration and lunch target resolution.
- Makefile and dependency resolution.
- Kernel and vendor integration.
- Missing modules, libraries, and build targets.
- Partition and boot-image configuration.

### Boot Validation

- Kernel startup.
- Boot-image and device-tree compatibility.
- Init service startup.
- Filesystem mounting.
- SELinux policy and denials.
- Framework startup and system stability.

### Hardware Validation

- Display and touch.
- Camera and image processing.
- Audio.
- Wi-Fi and Bluetooth.
- Mobile network and telephony.
- Sensors.
- Charging and power management.
- Suspend and resume.

All functionality should be reported according to actual test results. Until validation has been performed, no hardware feature should be considered confirmed working.

## Contributing

Contributions, technical feedback, and device-specific research are welcome.

If you have experience with MediaTek platforms, Motorola devices, Android device trees, kernel integration, or custom ROM bring-up, help is welcome in areas such as:

- Reviewing the device-specific configuration.
- Identifying missing dependencies.
- Comparing reference device trees with stock firmware.
- Investigating compilation and boot failures.
- Testing hardware functionality.
- Improving documentation and build reproducibility.

When opening an issue or pull request, include relevant logs, the target ROM and branch, the stock firmware version, and the steps needed to reproduce the problem.

Please remove personal information and sensitive device identifiers from diagnostic logs before sharing them publicly.

## Community and Discussion

- **GitHub Repository:** [android_device_motorola_vienna](https://github.com/akshat4763/android_device_motorola_vienna)
- **XDA Forums:** [Motorola Edge 50 Neo Rooting & Development](https://xdaforums.com/t/rooting-motorola-edge-50-neo.4713457/)

Use GitHub for repository issues, proposed changes, and technical contributions. Use the XDA thread for community discussion, development updates, and collaboration.

## Disclaimer

This is an independent community development project. It is not affiliated with, endorsed by, or supported by Motorola, Lenovo, MediaTek, or any custom ROM project unless explicitly stated.

The device tree is experimental. Although the initial device-tree bring-up is complete, successful ROM compilation, bootability, and hardware functionality have not yet been confirmed.

Custom ROM development and flashing can result in data loss, boot loops, or device failure. Verify compatibility with your exact device variant, keep appropriate backups, and understand the recovery procedure before flashing any images.

## License and Attribution

Original device-specific work should be distributed under the terms specified in this repository's `LICENSE` file, if present.

Third-party code and configurations remain subject to their original licenses and attribution requirements. Any adapted configuration should retain applicable copyright notices and required acknowledgements.

Proprietary vendor components may be subject to separate licensing and redistribution restrictions.

---

<p align="center">
  <b>Motorola Edge 50 Neo · vienna</b><br/>
  Initial bring-up complete · Experimental validation pending
</p>
