extproc sh

n=configure
test -f "./$n." || { echo "\`./$n' not found !!!"; exit 1; }

opts="
    --enable-shared
    --enable-static
    --enable-nls
    --enable-extra-encodings
"

"./$n" $opts "$@" 2>&1 | tee "$n.log"
