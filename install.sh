#!/bin/bash

FONTS_DIR=$HOME/.fonts
TOP_FONTS=("Menlo-Regular.ttf" "Monaco-Linux.ttf" "DejaVuSansMono.ttf")

function die () {
    echo "${@}"
    exit 1
}

cat <<EOF

--------------------------
 Top Programming Fonts!
--------------------------
  - Created by hbin

  This install download and link (hardlink) the fonts.
  shameless stolen by zzeroo!

EOF

# Create font dir if not exists
if [[ ! -e $FONT_DIR ]]; then
    mkdir $FONT_DIR || die "Could not make $FONT_DIR"
fi

for i in ${TOP_FONTS[*]}; do
    echo "Downloading $i"; echo
    wget -c https://github.com/zzeroo/top-programming-fonts/raw/master/$i \
      || die "Fail to download ${i}"
    ln $i $FONT_DIR || die "Could not install $i"
    echo "Installed $i successfully"; echo
done

cat <<EOF

--------------------------
 Fonts installed! Enjoy!
--------------------------
  - If you have any question, pls
    mail to <co@zzeroo.com>

EOF
