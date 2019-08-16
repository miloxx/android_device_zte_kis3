# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8610

# Platform
TARGET_BOARD_PLATFORM := msm8610

# Architecture
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_SPECIFIC_HEADER_PATH += device/zte/kis3/include

# Flags
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Kernel
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/zte/kis3/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/zte/msm8610
TARGET_KERNEL_CONFIG := msm8610-zte_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := zImage

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073725440 # 1073741824 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
BOARD_FLASH_BLOCK_SIZE := 131072

# TWRP Specific
RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TWHAVE_SELINUX := true
TW_THEME := portrait_mdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_FSTAB := device/zte/kis3/recovery/etc/twrp.fstab
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
#HAVE_SELINUX := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
BOARD_CUSTOM_BOOTIMG_MK := device/zte/kis3/mkbootimg.mk
