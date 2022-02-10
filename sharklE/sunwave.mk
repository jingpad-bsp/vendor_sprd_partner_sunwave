PRODUCT_PACKAGES += vendor.sw.swfingerprint@1.0
PRODUCT_PACKAGES += vendor.sw.swfingerprint@1.0.vendor
# add for sunwave fingerprint CA
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib/hw/swfingerprint.default.so:vendor/lib/hw/swfingerprint.default.so
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib64/hw/swfingerprint.default.so:vendor/lib64/hw/swfingerprint.default.so
endif

#build sign ta file
PRODUCT_PACKAGES += \
    sf_trusty.elf

#fp factory so
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib64/libfactorylib.so:vendor/lib64/libfactorylib.so
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib64/libfactorylib.so:system/lib64/libfactorylib.so
endif
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib/libfactorylib.so:vendor/lib/libfactorylib.so
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/vendor/lib/libfactorylib.so:system/lib/libfactorylib.so

PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/sw_config.xml:vendor/etc/sw_config.xml

PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/sf-keys.kl:system/usr/keylayout/sf-keys.kl
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/sharklE/sf-keys.idc:system/usr/idc/sf-keys.idc
PRODUCT_COPY_FILES += vendor/sprd/partner/sunwave/init.sunwave.rc:vendor/etc/init/init.sunwave.rc

BOARD_SEPOLICY_DIRS += vendor/sprd/partner/sunwave/sepolicy

DEVICE_MANIFEST_FILE += vendor/sprd/partner/sunwave/sharklE/vendor/manifest_sunwave.xml
