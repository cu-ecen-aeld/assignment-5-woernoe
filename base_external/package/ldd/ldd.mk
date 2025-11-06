###############################################################################################
#
# ldd.mk  - Buildroot package for scull and misc-modules
#
###############################################################################################
#LDD_VERSION = f5dbc03367bfc4f3f3103246d8842831add70238
LDD_VERSION = c0c8365b832c0afd22ad8333cd0b8fe4bd23699b
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-woernoe.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES


# Submodules
LDD_MODULE_SUBDIRS = scull misc-modules

LDD_LICENCE = GPL-2.0
LDD_DEPENDENCIES = linux

# build submodule
define LDD_BUILD_CMDS

       $(MAKE)  -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(LDD_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS) modules
endef

# Install all built files
define LDD_INSTALL_TARGET_CMDS

         $(MAKE) -C $(LINUX_DIR) \
                 M=$(@D) \
                 MODULE_SUBDIRS="$(addprefix $(@D)/, $(LDD_MODULE_SUBDIRS))" \
                 $(LINUX_MAKE_FLAGS)  \
                 INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef


$(eval $(kernel-module))
$(eval $(generic-package))
