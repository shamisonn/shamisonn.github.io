#!/bin/bash

makepost() {
    TITLE="diary"
    if [ $# -gt 0 ]; then
        TITLE=$1        
    else
        printf "\e[32m#\e[m input title(default 'diary'): "
        read INPUT
        if [ ${#INPUT} -gt 0 ]; then
            TITLE=${INPUT}
        fi        
    fi    
    DATE=`date '+%Y-%m-%d'`
    # 既に${DATE}-${TITLE}.mdが存在するなら
    if [ -e "_posts/${DATE}-${TITLE}.md" ]; then       
        COUNTS=`ls -U1  _posts/ | grep ${DATE}-${TITLE} | wc -l | tr -d ' '`
        # ${DATE}-${TITLE}-${同名のファイル数}.mdを作るか聞く
        printf "\e[32m#\e[m Same md files already exits\n"
        printf "\e[32m#\e[m Do you wanna make new file, "
        printf "\e[31m${TITLE}-${COUNTS}.md\e[m ? (y/n): "
        read ans
        case $ans in
            # yes ならば 新しいファイルを作る
            #     file名は diary.md, diary-1.md, diary-2.md, ... と値が増える 
            [Yy] | [Yy][Ee][Ss] ) ;;
            # no ならば COUNTSを減らして最新のファイルを指すようにする
            * ) exit 0;; 
        esac
        TITLE=${TITLE}-${COUNTS}
    fi
    POSTPATH="_posts/${DATE}-${TITLE}.md"
    printf "\e[32m#\e[m Write post, \e[32m${POSTPATH}\e[m ? (y/n): "
    read ans
    case $ans in
        [Yy] | [Yy][Ee][Ss] ) ;;
        * ) exit 0;;
    esac
    # もしファイルがないときは作成   
    if [ ! -f ${POSTPATH} ]; then
        echo -e "---\nlayout: post\ntitle: たいとる\n---\n" > ${POSTPATH}        
    fi
    # 最新のファイルを開く
    emacs -nw ${POSTPATH}
    printf "\e[32m#\e[m Opened, ${POSTPATH}\n"
}

makepost $1

