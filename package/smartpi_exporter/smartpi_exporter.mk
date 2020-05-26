################################################################################
#
# smartpi_exporter
#
################################################################################

SMARTPI_EXPORTER_VERSION = 3cbbab1aacb7cf94497d7e81c6a312f3d56cab9c
SMARTPI_EXPORTER_SITE = $(call github,pberndro,smartpi_exporter,$(SMARTPI_EXPORTER_VERSION))
SMARTPI_EXPORTER_LICENSE = GPL-3.0
SMARTPI_EXPORTER_LICENSE_FILES = LICENSE

define SMARTPI_EXPORTER_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 $(SMARTPI_EXPORTER_PKGDIR)/smartpi_exporter.service \
		$(TARGET_DIR)/usr/lib/systemd/system/smartpi_exporter.service
	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants
	ln -sf ../../../../usr/lib/systemd/system/smartpi_exporter.service \
		$(TARGET_DIR)/usr/lib/systemd/system/multi-user.target.wants/smartpi_exporter.service
endef

define SMARTPI_EXPORTER_INSTALL_CONFIG
	$(INSTALL) -D -m 644 $(SMARTPI_EXPORTER_PKGDIR)/smartpi.ini $(TARGET_DIR)/etc/smartpi_exporter/smartpi.ini
endef
LIBFOO_POST_INSTALL_TARGET_HOOKS += SMARTPI_EXPORTER_INSTALL_CONFIG

$(eval $(golang-package))
