#THEOS_DEVICE_IP = 192.168.1.131
ARCHS=arm64 #arm64e
#MODULES = jailed #Descomentar para generar ipa
#CODESIGN_IPA=0 #Descomentar para generar ipa

ROOTLESS = 1

ifeq ($(ROOTLESS), 1)
THEOS_PACKAGE_SCHEME = rootless
endif

ifeq ($(ROOTLESS), 2)
THEOS_PACKAGE_SCHEME = roothide
endif

MOBILE_THEOS=0
ifeq ($(MOBILE_THEOS),1)
  # path to your sdk
  SDK_PATH = $(THEOS)/sdks/iPhoneOS16.5.sdk/
  $(info ===> Setting SYSROOT to $(SDK_PATH)...)
  SYSROOT = $(SDK_PATH)
else
  TARGET = iphone:clang:latest:8.0
endif
#INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

TWEAK_NAME = R6X9
DISPLAY_NAME = Call Of Duty
BUNDLE_ID = com.activision.callofduty.shooter#com.tencent.tmgp.cod#com.garena.game.codm#vn.vng.codmvn#com.activision.callofduty.shooter#com.robtop.geometryjumplite#com.tencent.ig

LOGIN_SRC =  $(wildcard Login/*.mm)
HOSTS_SRC = $(wildcard Hosts/*.m)
IMGUI_SRC = $(wildcard imgui/*.cpp)
KITTYMEMORY_SRC = $(wildcard KittyMemory/*.cpp)

R6X9_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -Wunused-but-set-variable -DNDEBUG
R6X9_FILES = Tweak.xm $(LOGIN_SRC) $(IMGUI_SRC) $(HOSTS_SRC) ModController.mm CheatState/CheatState.cpp Stream/HeeeNoScreenShotView.m imgui/imgui_impl_metal.mm $(KITTYMEMORY_SRC)
R6X9_CFLAGS = -fobjc-arc -Werror -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wunused-but-set-variable -Wno-enum-conversion
R6X9_FRAMEWORKS = UIKit Foundation MetalKit Metal ModelIO
R6X9_IPA = tu.ipa

$(TWEAK_NAME)_LIBRARIES += substrate

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard || :"