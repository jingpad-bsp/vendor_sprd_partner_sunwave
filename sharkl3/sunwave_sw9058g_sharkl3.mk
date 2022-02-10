
PRODUCT_COPY_FILES += \
        vendor/sprd/partner/sunwave/init.sunwave_sw9058g.rc:vendor/etc/init/init.sunwave_sw9058g.rc

PRODUCT_PACKAGES += vendor.sw.swfingerprint@1.0
PRODUCT_PACKAGES += vendor.sw.swfingerprint@1.0.vendor

#build sign ta file
PRODUCT_PACKAGES += \
    sf_trusty.elf

PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/vendor/lib/hw/swfingerprint.default.so:vendor/lib/hw/swfingerprint.default.so
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/vendor/lib64/hw/swfingerprint.default.so:vendor/lib64/hw/swfingerprint.default.so
endif

#fp factory so
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/vendor/lib64/libfactorylib.so:vendor/lib64/libfactorylib.so
endif
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/vendor/lib/libfactorylib.so:vendor/lib/libfactorylib.so

BOARD_SEPOLICY_DIRS += vendor/sprd/partner/sunwave/sepolicy

DEVICE_MANIFEST_FILE += vendor/sprd/partner/sunwave/sharkl3/vendor/manifest_sunwave.xml

PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/sw_config.xml:vendor/etc/sw_config.xml

PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/sf-keys.kl:system/usr/keylayout/sf-keys.kl
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharkl3/sf-keys.idc:system/usr/idc/sf-keys.idc
