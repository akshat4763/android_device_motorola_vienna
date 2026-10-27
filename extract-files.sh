#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=vienna
VENDOR=motorola

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="$PWD/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        system_ext/etc/init/init.vtservice.rc)
            sed -i 's|start|enable|g' "$2"
            ;;
        system_ext/lib64/libsource.so)
            grep -q libui_shim.so "$2" || "$PATCHELF" --add-needed libui_shim.so "$2"
            ;;
        system_ext/priv-app/ImsService/ImsService.apk)
            apktool_patch "${2}" 'blob-patches'
            ;;
        vendor/lib64/hw/audio.primary.mt6878.so)
            "${PATCHELF}" --replace-needed "libalsautils.so" "libalsautils-stock.so" "${2}"
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/etc/init/android.hardware.graphics.allocator@4.0-service-mediatek.rc)
            sed -i 's|android.hardware.graphics.allocator@4.0-service-mediatek|mt6878/android.hardware.graphics.allocator@4.0-service-mediatek.mt6878|g' "${2}"
            ;;
        vendor/etc/init/android.hardware.graphics.allocator-V2-service-mediatek.rc)
            sed -i 's|android.hardware.graphics.allocator-V2-service-mediatek|mt6878/android.hardware.graphics.allocator-V2-service-mediatek.mt6878|g' "${2}"
            ;;
        vendor/etc/init/android.hardware.neuralnetworks-shim-service-mtk.rc)
            sed -i 's|start|enable|g' "$2"
            ;;
        vendor/lib64/hw/vendor.mediatek.hardware.pq_aidl-impl.so)
            "$PATCHELF" --replace-needed "libui.so" "libui-v34.so" "$2"
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/lib64/libnvram.so)
            "$PATCHELF" --add-needed libbase_shim.so "$2"
            ;;
        vendor/bin/hw/mt6878/camerahalserver)
            "$PATCHELF" --add-needed libcamera_metadata_shim.so "$2"
            ;;
        vendor/lib64/libtflite_mtk.so)
            "$PATCHELF" --add-needed libbase_shim.so "$2"
            ;;
        vendor/lib64/mt6878/libmmlpqImpl.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/lib64/libpqxmlflagparser.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/lib64/libpqxmlparser.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/lib64/libsilkybrightnesscore.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/lib64/libmtkcam_grallocutils_aidlv1helper.so|vendor/lib64/libmtkcam_grallocutils.so)
            "${PATCHELF}" --add-needed "libprocessgroup_shim.so" "${2}"
            "${PATCHELF}" --add-needed "libbase_shim.so" "${2}"
            ;;
        vendor/lib64/mt6878/libcam.hal3a.so|vendor/lib64/mt6878/libcam.hal3a.ctrl.so|vendor/lib64/mt6878/libmtkcam_cputrack.so|vendor/lib64/mt6878/libmtkcam_request_requlator.so)
            "${PATCHELF}" --add-needed "libprocessgroup_shim.so" "${2}"
            ;;
        vendor/lib64/libmmlpqImpl.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
       vendor/lib64/librt_extamp_intf.so)
            "$PATCHELF" --replace-needed "libtinyxml2.so" "libtinyxml2-v34.so" "$2"
            ;;
        vendor/etc/init/vendor.mediatek.hardware.mtkpower@1.0-service.rc)
            echo "$(cat ${2}) input" > "${2}"
            ;;
        vendor/lib64/hw/hwcomposer.mtk_common.so)
            ( "${PATCHELF}" --print-needed "${2}" | grep -q libprocessgroup_shim.so || \
              "${PATCHELF}" --add-needed libprocessgroup_shim.so "${2}" )
            ;;

    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

if [ -z "${SECTION}" ]; then
fi

"${MY_DIR}/setup-makefiles.sh"
