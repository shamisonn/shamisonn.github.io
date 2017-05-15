#!/bin/sh

makepost() {
    TITLE="diary"
    if [ $# -gt 0 ]; then
        TITLE=$1
    fi
    DATE=`date '+%Y-%m-%d'`
    POSTPATH="_posts/${DATE}-${TITLE}.md"
    if [ -e ${POSTPATH} ]; then
        emacs -nw ${POSTPATH}
    else
        echo "---\nlayout: post\ntitle: たいとる\n---\n" > ${POSTPATH}
        emacs -nw ${POSTPATH}
    fi
    echo ${POSTPATH}
}

makepost $1
