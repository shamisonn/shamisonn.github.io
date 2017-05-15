---
layout: post
title: jekyll用のpost用のスクリプトのアプデ
---

色々いじって色々変えた。

特にファイル名を`makepost.sh`から`write.sh`に変えたのは大きい。(モチベ的に)

```shell
#!/bin/sh

writepost() {
    TITLE="diary"
    if [ $# -gt 0 ]; then
        TITLE=$1        
    else
        printf "\e[32m#\e[m Input Title(default 'diary'): "
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
        printf "\e[32m#\e[m Do you wanna write the new file, "
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
    printf "\e[32m#\e[m Do you wanna write the post, \e[32m${POSTPATH}\e[m ? (y/n): "
    read ans
    case $ans in
        [Yy] | [Yy][Ee][Ss] ) ;;
        * ) exit 0;;
    esac
    # もしファイルがないときは作成   
    if [ ! -f ${POSTPATH} ]; then
        printf "%s\n%s\n%s\n%s\n" \
               "---" \
               "layout: post" \
               "title: たいとる" \
               "---" > ${POSTPATH}        
    fi
    # 最新のファイルを開く
    emacs -nw ${POSTPATH}
    printf "\e[32m#\e[m Opened, ${POSTPATH}\n"
}

writepost $1
```

# 大変だったこと

- 比較演算子の-eqとか-neとか-gtとかの仕様把握
- 色付け(`echo "\e[32mhoge\e[m` とかやってみてくれ)
- 同名ファイル重複時の仕様設計と動作の実装
  - `file`.mdがあるときは`file-1`.mdを作成
    - `file-1`.mdがあるときは`file-2`.mdを作成
    - `file-(n)`.mdがあるときは`file-(n+1)`.mdを作成
    - のようにした
  - 結構めんどくてここに一番時間をかけた
    - その割には一番使わなそうな機能である ;D

- `echo -e`がbashとかじゃないと使えないからprintfに置き換え
  - そしたら謎エラー発生
  - `printf "--"`をするとわかる
    - 解決: [bash - Dashes in printf - Unix &amp; Linux Stack Exchange](https://unix.stackexchange.com/questions/22764/dashes-in-printf/22765)
    - ダブルクフォートで囲ってもダメなんですか。。。ワカンナイよ。。。
    - 2番目の回答を参考にfix
    - 結構綺麗にかけて満足

- yes or no の部分の作成
  - 色々悩んで結局コピった
  - caseでやったけどこれifでもいいんじゃないか？(とか思いつつも放置

# まとめ
  
色々機能足したけどちょっとビミョーだけど自己満的にはOK。

Emacsで管理できれば最高なんじゃないか？って気がしてきたけど、

とりあえず構想だけ頭に置いといて、

とりあえずあとでいいやって思った。

とりあえずこれでEnd。

