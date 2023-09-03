################################################################################
#
# libretro-hatarib
#
################################################################################
# Version: Commits on Sep 3, 2023
LIBRETRO_HATARIB_VERSION = 98f658838ec29032b4de5cdccba2ee28d4fd7a54
LIBRETRO_HATARIB_SITE = https://github.com/bbbradsmith/hatariB
LIBRETRO_HATARIB_SITE_METHOD=git
LIBRETRO_HATARIB_LICENSE = GPLv2
LIBRETRO_HATARIB_DEPENDENCIES = libcapsimage libpng libzlib sdl2

LIBRETRO_HATARIB_GIT_SUBMODULES = YES

LIBRETRO_HATARIB_CONF_ENV += \
    SHORTHASH='"$(shell echo $(LIBRETRO_HATARIB_VERSION) | cut -c 1-7)"' \
	SDL2_INCLUDE="$(STAGING_DIR)/usr/include/SDL2" \
	SDL2_LIB="$(STAGING_DIR)/usr/lib" \
	SDL2_LINK="$(STAGING_DIR)/usr/lib/libSDL2.so" \
	ZLIB_INCLUDE="$(STAGING_DIR)/usr/include" \
	ZLIB_LIB="$(STAGING_DIR)/usr/lib" \
	ZLIB_LINK="$(STAGING_DIR)/usr/lib/libz.so"

define LIBRETRO_HATARIB_BUILD_CMDS
    CC="$(TARGET_CC)" AR="$(TARGET_AR)" RANLIB="$(TARGET_RANLIB)" \
	cd $(@D) && $(MAKE) -f makefile \
	$(LIBRETRO_HATARIB_CONF_ENV)
endef

define LIBRETRO_HATARIB_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/build/hatarib.so \
		$(TARGET_DIR)/usr/lib/libretro/hatarib_libretro.so
endef

$(eval $(generic-package))
