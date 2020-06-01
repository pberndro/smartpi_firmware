################################################################################
#
# smartpi_exporter
#
################################################################################

SMARTPI_EXPORTER_VERSION = 82828e430af3faeda3fa440f02b9e71b15ada86d
SMARTPI_EXPORTER_SITE = $(call github,pberndro,smartpi_exporter,$(SMARTPI_EXPORTER_VERSION))
SMARTPI_EXPORTER_LICENSE = GPL-3.0
SMARTPI_EXPORTER_LICENSE_FILES = LICENSE

define SMARTPI_EXPORTER_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(SMARTPI_EXPORTER_PKGDIR)/smartpi_exporter.service \
		$(TARGET_DIR)/usr/lib/systemd/system/smartpi_exporter.service
endef

define SMARTPI_EXPORTER_INSTALL_CONFIG
	$(INSTALL) -D -m 644 $(@D)/smartpi.ini $(TARGET_DIR)/etc/smartpi_exporter/smartpi.ini
endef
SMARTPI_EXPORTER_POST_INSTALL_TARGET_HOOKS += SMARTPI_EXPORTER_INSTALL_CONFIG

$(eval $(golang-package))
