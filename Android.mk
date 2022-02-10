LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

#build signed fingerprint ta
LOCAL_MODULE := sf_trusty.elf
LOCAL_SRC_FILES := sharklE/vendor/firmware/unsign/sf_trusty.elf
ifeq (sp9863a,$(filter sp9863a,$(TARGET_BOARD_PLATFORM)))
LOCAL_SRC_FILES := sharkl3/vendor/firmware/unsign/sf_trusty.elf
endif
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/firmware
LOCAL_MODULE_TAGS := optional


sign_script_base_dir := $(PWD)/vendor/sprd/proprietories-source/packimage_scripts/signimage
sign_script := $(sign_script_base_dir)/dynamicTA/signta.py
sign_key := $(sign_script_base_dir)/sprd/config/dynamic_ta_privatekey.pem
src_elf_dir := $(PWD)/vendor/sprd/partner/sunwave/sharklE/vendor/firmware/unsign
ifeq (sp9863a,$(filter sp9863a,$(TARGET_BOARD_PLATFORM)))
src_elf_dir := $(PWD)/vendor/sprd/partner/sunwave/sharkl3/vendor/firmware/unsign
endif
target_elf_dir := $(PWD)/$(TARGET_OUT_VENDOR)/firmware
ta_uuid := 4304bef636e54d9195b01ea4cd51d40d
ifeq (sp9863a,$(filter sp9863a,$(TARGET_BOARD_PLATFORM)))
ta_uuid := 4304bef636e54d9194b01ea4cd51d408
endif
ta := sf_trusty

sign_cmd := source $(PWD)/vendor/sprd/partner/sunwave/signta.sh $(sign_script) $(ta_uuid) $(sign_key) $(src_elf_dir)/$(ta).elf $(target_elf_dir)/$(ta).elf

LOCAL_ADDITIONAL_DEPENDENCIES := $(src_elf_dir)/$(ta).elf $(sign_key)
LOCAL_POST_INSTALL_CMD := rm $(target_elf_dir)/$(ta).elf; $(sign_cmd)

include $(BUILD_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
