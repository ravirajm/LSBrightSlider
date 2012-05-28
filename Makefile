export GO_EASY_ON_ME = 1
export THEOS_DEVICE_IP = localhost
include theos/makefiles/common.mk

TWEAK_NAME = LSBrightSlider
LSBrightSlider_FILES = LSBrightSlider.xm
LSBrightSlider_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk
