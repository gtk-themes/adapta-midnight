ACLOCAL_AMFLAGS = -I m4

themedir  = $(datadir)/themes
adaptadir = $(DESTDIR)$(themedir)/Adapta
briladir = $(DESTDIR)$(themedir)/Adapta-Brila
midnightdir  = $(DESTDIR)$(themedir)/Adapta-Midnight
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
brilaetadir = $(DESTDIR)$(themedir)/Adapta-Brila-Eta
midnightetadir  = $(DESTDIR)$(themedir)/Adapta-Midnight-Eta

SUBDIRS = \
	gtk \
	shell \
	wm \
	extra

EXTRA_DIST = \
	COPYING \
	LICENSE_CC_BY_SA4 \
	README.md

install-data-hook:
	cp -Rv $(EXTRA_DIST) $(adaptadir)

uninstall-hook:
	test -e $(midnightdir) && rm -rfv $(midnightdir)
	test -e $(briladir) && rm -rfv $(briladir)
	test -e $(adaptadir) && rm -rfv $(adaptadir)
	test -e $(noktetaodir) && rm -rfv $(midnightetadir)
	test -e $(brilaetadir) && rm -rfv $(brilaetadir)
	test -e $(adaptaetadir) && rm -rfv $(adaptaetadir)
