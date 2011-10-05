include theos/makefiles/common.mk

TWEAK_NAME = UnlockBright
UnlockBright_FILES = Tweak.xm
UnlockBright_FRAMEWORKS = UIKit CoreGraphics
SUBPROJECTS= unlockbrightsettings
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk