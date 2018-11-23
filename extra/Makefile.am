themedir     = $(datadir)/themes
adaptadir    = $(DESTDIR)$(themedir)/Adapta
briladir     = $(DESTDIR)$(themedir)/Adapta-Brila
midnightdir     = $(DESTDIR)$(themedir)/Adapta-Midnight
adaptaetadir = $(DESTDIR)$(themedir)/Adapta-Eta
brilaetadir  = $(DESTDIR)$(themedir)/Adapta-Brila-Eta
midnightetadir  = $(DESTDIR)$(themedir)/Adapta-Midnight-Eta

plankdir         = $(srcdir)/plank
plank_light_file = $(plankdir)/dock-light.theme
plank_dark_file  = $(plankdir)/dock-dark.theme

telegramdir         = $(srcdir)/telegram
telegram_file       = $(telegramdir)/adapta.tdesktop-theme
telegram_brila_file = $(telegramdir)/adapta-brila.tdesktop-theme
telegram_midnight_file = $(telegramdir)/adapta-midnight.tdesktop-theme

geditdir   = $(srcdir)/gedit
gedit_file = \
	$(geditdir)/adapta.xml \
	$(geditdir)/README.md
gedit_brila_file = \
	$(geditdir)/adapta-brila.xml

tweetdeckdir         = $(srcdir)/tweetdeck
tweetdeck_light_file = $(tweetdeckdir)/light/ColorDeck-adapta.cdk
tweetdeck_dark_file  = $(tweetdeckdir)/dark/ColorDeck-adapta-midnight.cdk

# ******************
# * Generate files *
# ******************

all:
if ENABLE_TWEETDECK
	cd $(tweetdeckdir) && ./recolor-cdk.sh
endif

# *****************
# * Install files *
# *****************

install-data-local:
if ENABLE_PLANK
	$(MKDIR_P) $(adaptadir)/plank
	$(MKDIR_P) $(briladir)/plank
	$(MKDIR_P) $(midnightdir)/plank
	$(MKDIR_P) $(adaptaetadir)/plank
	$(MKDIR_P) $(brilaetadir)/plank
	$(MKDIR_P) $(midnightetadir)/plank
	cp -Rv $(plank_dark_file) $(adaptadir)/plank/dock.theme
	cp -Rv $(plank_light_file) $(briladir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(midnightdir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(adaptaetadir)/plank/dock.theme
	cp -Rv $(plank_light_file) $(brilaetadir)/plank/dock.theme
	cp -Rv $(plank_dark_file) $(midnightetadir)/plank/dock.theme
endif

if ENABLE_TELEGRAM
	$(MKDIR_P) $(adaptadir)/telegram
	$(MKDIR_P) $(briladir)/telegram
	$(MKDIR_P) $(midnightdir)/telegram
	cp -Rv $(telegram_file) $(adaptadir)/telegram
	cp -Rv $(telegram_brila_file) $(briladir)/telegram
	cp -Rv $(telegram_midnight_file) $(midnightdir)/telegram
endif

if ENABLE_TWEETDECK
	$(MKDIR_P) $(adaptadir)/tweetdeck
	$(MKDIR_P) $(briladir)/tweetdeck
	$(MKDIR_P) $(midnightdir)/tweetdeck
	cp -Rv $(tweetdeck_light_file) $(adaptadir)/tweetdeck
	cp -Rv $(tweetdeck_light_file) $(briladir)/tweetdeck
	cp -Rv $(tweetdeck_dark_file) $(midnightdir)/tweetdeck
endif

	$(MKDIR_P) $(adaptadir)/gedit
	$(MKDIR_P) $(briladir)/gedit
	$(MKDIR_P) $(midnightdir)/gedit
	cp -Rv $(gedit_file) $(adaptadir)/gedit
	cp -Rv $(gedit_brila_file) $(briladir)/gedit
	cp -Rv $(gedit_file) $(midnightdir)/gedit

# *******************
# * Uninstall files *
# *******************

uninstall-local:
if ENABLE_PLANK
	test -e $(midnightdir)/plank && rm -rfv $(midnightdir)/plank
	test -e $(briladir)/plank && rm -rfv $(briladir)/plank
	test -e $(adaptadir)/plank && rm -rfv $(adaptadir)/plank
	test -e $(midnightetadir)/plank && rm -rfv $(midnightetadir)/plank
	test -e $(brilaetadir)/plank && rm -rfv $(brilaetadir)/plank
	test -e $(adaptaetadir)/plank && rm -rfv $(adaptaetadir)/plank
endif

if ENABLE_TELEGRAM
	test -e $(midnightdir)/telegram && rm -rfv $(midnightdir)/telegram
	test -e $(briladir)/telegram && rm -rfv $(briladir)/telegram
	test -e $(adaptadir)/telegram && rm -rfv $(adaptadir)/telegram
endif

if ENABLE_TWEETDECK
	test -e $(midnightdir)/tweetdeck && rm -rfv $(midnightdir)/tweetdeck
	test -e $(briladir)/tweetdeck && rm -rfv $(briladir)/tweetdeck
	test -e $(adaptadir)/tweetdeck && rm -rfv $(adaptadir)/tweetdeck
endif

	test -e $(midnightdir)/gedit && rm -rfv $(midnightdir)/gedit
	test -e $(briladir)/gedit && rm -rfv $(briladir)/gedit
	test -e $(adaptadir)/gedit && rm -rfv $(adaptadir)/gedit

# ****************************
# * Clean up generated files *
# ****************************

CLEANFILES =

if ENABLE_TWEETDECK
CLEANFILES += \
	$(tweetdeckdir)/light/ColorDeck-adapta.cdk \
	$(tweetdeckdir)/dark/ColorDeck-adapta-midnight.cdk
endif

DISTCLEANFILES = \
	$(CLEANFILES)
