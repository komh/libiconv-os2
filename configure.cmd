extproc sh

./configure --prefix=/usr --enable-shared --enable-static --enable-nls \
            --enable-extra-encodings \
            "$@"
