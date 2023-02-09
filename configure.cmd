extproc sh

d=$(dirname "$0" | tr '\\' /)

n=configure
test -f "$d/$n." || { echo "\`$d/$n' not found !!!"; exit 1; }

export LDFLAGS=-Zhigh-mem

opts="
    --prefix=/@unixroot/usr/local
    --enable-shared
    --enable-static
    --enable-nls
    --enable-extra-encodings
"

"$d/$n" $opts "$@" 2>&1 | tee "$n.log"
exit ${PIPESTATUS[0]}
