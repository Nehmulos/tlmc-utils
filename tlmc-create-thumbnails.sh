#!/usr/bin/bash
FINAL_WIDTH=500

# You need imagemagick to run this.
# You must cd INTO the tlmc directory to run this.
# the generated covers will NOT be copied
# they are stored in $OUTDIR

find . -iname '*0001.JPG' | while read IMG; do
    DIR=`dirname "$IMG"`
    TMPNAME="/tmp/tmpcover"
    OUTDIR="/tmp/asdf/$DIR"
    OUTNAME="$OUTDIR/cover.jpg"
    ASPECT=`convert "$IMG" -format '%[fx:w/h]' info:`
    mkdir -p "$OUTDIR"
    if [ `echo "$ASPECT > 1.75"` ]; then
        convert -crop 50%x100% -thumbnail "$FINAL_WIDTH" "$IMG" "$TMPNAME"
        rm "$TMPNAME-0"
        mv "$TMPNAME-1" "$OUTNAME"
    else
        convert -thumbnail "$FINAL_WIDTH" "$IMG" "$OUTNAME"
    fi
done
