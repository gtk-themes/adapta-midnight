#!/bin/sh
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016-2018 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

###############
# Print usage #
###############

# Usage: ./compile-gresource.sh GTK_VERSION
#
# Example:
#   ./compile-gresource.sh 3.22
#
#   compile gtk.gresouce for Gtk+ version 3.22

usage() {
    sed -rn '/^# Usage/,${/^#/!q;s/^# ?//;p}' "$0"
}

#############
# Compiling #
#############

xml="gtk.gresource.xml"
xml_dark="gtk-dark.gresource.xml"
image_list="`grep -e '.png' ./$xml.in | cut -d'>' -f2 | cut -d'<' -f1 | \
           cut -d'/' -f2`"

for i in $image_list
do
    if [ ! -f ../asset/assets-gtk3/$i ]; then
        echo "Error: 'assets-gtk3/$i' not found, aborted..."
        exit 1
    fi
done

case "$1" in
    3.20|3.22|3.24|4.0)
        cp "$xml".in ../gtk-"$1"/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"/"$xml"
        sed -i "s|@VARIANT[@]||g" ../gtk-"$1"/"$xml"
        cd ../gtk-"$1" && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1" \
                                             ../gtk-"$1"/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained.css");' \
            > ../gtk-"$1"/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'/gtk-contained-dark.css");' \
            > ../gtk-"$1"/gtk-dark.css

        rm -f ../gtk-"$1"/"$xml"
        rm -rf ../gtk-"$1"/assets

        cp "$xml".in ../gtk-"$1"-eta/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-eta/"$xml"
        sed -i "s|@VARIANT[@]|-eta|g" ../gtk-"$1"-eta/"$xml"
        cd ../gtk-"$1"-eta && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-eta \
                                             ../gtk-"$1"-eta/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-eta/gtk-contained.css");' \
            > ../gtk-"$1"-eta/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-eta/gtk-contained-dark.css");' \
            > ../gtk-"$1"-eta/gtk-dark.css

        rm -f ../gtk-"$1"-eta/"$xml"
        rm -rf ../gtk-"$1"-eta/assets

        cp "$xml".in ../gtk-"$1"-brila/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-brila/"$xml"
        sed -i "s|@VARIANT[@]|-brila|g" ../gtk-"$1"-brila/"$xml"
        cd ../gtk-"$1"-brila && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-brila \
                                             ../gtk-"$1"-brila/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-brila/gtk-contained.css");' \
            > ../gtk-"$1"-brila/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-brila/gtk-contained-dark.css");' \
            > ../gtk-"$1"-brila/gtk-dark.css

        rm -f ../gtk-"$1"-brila/"$xml"
        rm -rf ../gtk-"$1"-brila/assets

        cp "$xml".in ../gtk-"$1"-brila-eta/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-brila-eta/"$xml"
        sed -i "s|@VARIANT[@]|-brila-eta|g" ../gtk-"$1"-brila-eta/"$xml"
        cd ../gtk-"$1"-brila-eta && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-brila-eta \
                                             ../gtk-"$1"-brila-eta/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-brila-eta/gtk-contained.css");' \
            > ../gtk-"$1"-brila-eta/gtk.css
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-brila-eta/gtk-contained-dark.css");' \
            > ../gtk-"$1"-brila-eta/gtk-dark.css

        rm -f ../gtk-"$1"-brila-eta/"$xml"
        rm -rf ../gtk-"$1"-brila-eta/assets

        cp "$xml_dark".in ../gtk-"$1"-midnight/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-midnight/"$xml"
        sed -i "s|@VARIANT[@]|-midnight|g" ../gtk-"$1"-midnight/"$xml"
        cd ../gtk-"$1"-midnight && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-midnight \
                                             ../gtk-"$1"-midnight/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-midnight/gtk-contained-dark.css");' \
            > ../gtk-"$1"-midnight/gtk.css

        rm -f ../gtk-"$1"-midnight/"$xml"
        rm -rf ../gtk-"$1"-midnight/assets

        cp "$xml_dark".in ../gtk-"$1"-midnight-eta/"$xml"
        sed -i "s|@VERSION[@]|$1|g" ../gtk-"$1"-midnight-eta/"$xml"
        sed -i "s|@VARIANT[@]|-midnight-eta|g" ../gtk-"$1"-midnight-eta/"$xml"
        cd ../gtk-"$1"-midnight-eta && ln -sf ../asset/assets-gtk3 assets && cd ../sass
        $(command -v glib-compile-resources) --sourcedir=../gtk-"$1"-midnight-eta \
                                             ../gtk-"$1"-midnight-eta/"$xml"
        echo '@import url("resource:///org/adapta-project/gtk-'$1'-midnight-eta/gtk-contained-dark.css");' \
            > ../gtk-"$1"-midnight-eta/gtk.css

        rm -f ../gtk-"$1"-midnight-eta/"$xml"
        rm -rf ../gtk-"$1"-midnight-eta/assets
        ;;
    *)
        usage && exit 1
        ;;
esac

exit 0
