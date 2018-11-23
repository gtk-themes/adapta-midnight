#! /bin/bash
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

SRC_DIR="../assets-metacity"
ASSETS_DIR="../../metacity-1"
INDEX_C="assets-metacity-common.txt"
INDEX="assets-metacity.txt"
RECOLOR_FILE1=$SRC_DIR/"common/button_close_pressed.svg"
RECOLOR_FILE2=$SRC_DIR/"common/button_close_prelight.svg"
COL_FILE="../../../gtk/sass/common/_colors.scss"
KEY_FILE="../../../gtk/sass/common/resources/_key_colors.scss"

# Default colours
selection1="`grep 'Indigo500' $COL_FILE | \
                   cut -d' ' -f3`"
destruction1="`grep 'Red500' $COL_FILE | \
                     cut -d' ' -f3`"

# Check and re-color 'button_close_pressed' button
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
    destruction2="`grep 'key_destruction' $KEY_FILE | \
                   cut -d' ' -f2 | cut -d';' -f1`"

    cp -f $RECOLOR_FILE1.in $RECOLOR_FILE1
    cp -f $RECOLOR_FILE2.in $RECOLOR_FILE2

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $RECOLOR_FILE1
        echo $selection1 is re-colored with $selection2.
    fi

    if [ $destruction1 != $destruction2 ]; then
        sed -i "s/$destruction1/$destruction2/gi" $RECOLOR_FILE2
        echo $destruction1 is re-colored with $destruction2.
    fi
else
    echo ../../../gtk/sass/common/resources/_key_colors.scss was not found. Stopped...
    exit 1
fi

# Clone stock SVG files
for i in $(<$INDEX_C)
do
    if [ '!' -d $ASSETS_DIR/light ]; then
        mkdir -p $ASSETS_DIR/light
    fi
    if [ '!' -d $ASSETS_DIR/dark ]; then
        mkdir -p $ASSETS_DIR/dark
    fi
    if [ -f $ASSETS_DIR/light/$i.svg ] && \
        [ $SRC_DIR/common/$i.svg -ot $ASSETS_DIR/light/$i.svg ]; then
        echo $ASSETS_DIR/light/$i.svg exists.
    else
        echo Cloning $ASSETS_DIR/light/$i.svg
        cp $SRC_DIR/common/$i.svg $ASSETS_DIR/light
    fi
    if [ -f $ASSETS_DIR/dark/$i.svg ] && \
        [ $SRC_DIR/common/$i.svg -ot $ASSETS_DIR/dark/$i.svg ]; then
        echo $ASSETS_DIR/dark/$i.svg exists.
    else
        echo Cloning $ASSETS_DIR/dark/$i.svg
        cp $SRC_DIR/common/$i.svg $ASSETS_DIR/dark
    fi
done
for i in $(<$INDEX)
do
    if [ -f $ASSETS_DIR/light/$i.svg ] && \
        [ $SRC_DIR/light/$i.svg -ot $ASSETS_DIR/light/$i.svg ]; then
        echo $ASSETS_DIR/light/$i.svg exists.
    else
        echo Cloning $ASSETS_DIR/light/$i.svg
        cp $SRC_DIR/light/$i.svg $ASSETS_DIR/light
    fi
    if [ -f $ASSETS_DIR/dark/$i.svg ] && \
        [ $SRC_DIR/dark/$i.svg -ot $ASSETS_DIR/dark/$i.svg ]; then
        echo $ASSETS_DIR/dark/$i.svg exists.
    else
        echo Cloning $ASSETS_DIR/dark/$i.svg
        cp $SRC_DIR/dark/$i.svg $ASSETS_DIR/dark
    fi
done

exit 0
