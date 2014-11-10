extproc sh

libtoolize -f
(cd libcharset && libtoolize -f)

COMSPEC=/bin/sh \
GCCOPT="-pipe -Zexe" \
    ./autogen.sh --skip-gnulib
