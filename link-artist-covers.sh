#!/bin/bash

# This creates a cover.jpg softlink in the artist directory,
# pointing to the first cover found for this artist.
# You must cd INTO the tlmc directory to run this.

find . -type d -maxdepth 1 | while read DIR; do
    find "$DIR" -name "cover.jpg" | head -n 1 | while read COVER; do
    OUTPUTFILE="$DIR/cover.jpg"
    [ -h "$OUTPUTFILE" ] && rm "$OUTPUTFILE" && echo "removed old link $OUTPUTFILE"
    echo "link $OUTPUTFILE -> $COVER"
        ln -s "$(pwd)/$COVER" "$OUTPUTFILE"
    done
done
