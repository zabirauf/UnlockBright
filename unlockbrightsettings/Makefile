include theos/makefiles/common.mk

BUNDLE_NAME = UnlockBrightSettings
UnlockBrightSettings_FILES = UnlockBrightSettings.mm
UnlockBrightSettings_INSTALL_PATH = /Library/PreferenceBundles
UnlockBrightSettings_FRAMEWORKS = UIKit
UnlockBrightSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/UnlockBrightSettings.plist$(ECHO_END)
