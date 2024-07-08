#!/bin/zsh

compress() {
    tar cvzf $1.tar.gz $1
}

zipFile() {
    zip -r $1.zip $1
}


#remove(){
#    read WORD
#
#    for f in *$WORD*; do
#        mv -- "$f" "${f/$WORD/}"
#    done
#}

