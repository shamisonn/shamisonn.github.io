---
layout: default
mode: post
title: このブログについて書いておこうと思う。
---
<!--readmore-->
技術的にどうやってこのブログが作られているかをここに書いておいて、
未来の自分が「暇人か？」とか「賢いなぁ〜〜！！」って思うことを期待する。
記事をこしらえる練習をしておきたかった。

# gh-pages

はい。
このブログはいわゆるひとつの *gh-pages* になっている。
gh-pages はデフォルトで静的Webサイトジェネレータである *Jekyll* に対応している。
後輩氏がJekyllでゴリゴリWebページを作成しているのをみてパクｔ…パクった。

* "[GitHubPages + Jekyll] 無料でWebページを作ってみた - Qiita" https://qiita.com/koyo-miyamura/items/5ec89ac9689be49a55f6

# Jekyll

ざっくり言えばいい感じにwebサイトを楽に作れるくん。
markdownでかけたり、なんか自分で全部構築してる感が味わえて気持ちよかったりする。
あ〜忘れてたけどEmacsでブログ記事かけるのは最高。
いまVSCodeで書いているけど。

* "Jekyll • シンプルで、ブログのような、静的サイト" https://jekyllrb-ja.github.io/

ちなみにblogのrootのdirectory構造は以下。

```
├── _config.yml
├── _layouts
│   └── default.html
├── _posts
│   ├── 2016-03-19-init.md
│   ├── 2016-12-31-diary.md
│   ├── 2017-01-05-movies.md
.........
│   └── 2018-11-27-blog-description.md
├── about
│   └── index.md
├── assets
│   ├── posts
│   │   └── 2017-06-14-convection-oven.jpg
│   └── res
│       └── icon.png
├── css
│   ├── style.scss
│   └── syntax.css
├── index.html
├── posts
│   └── index.html
├── works
│   └── index.html
└── write.sh
```

結構ごちゃごちゃしててキモいな。

ブログをあげるときは`_posts`に
markdownファイルを`年-月-日-タイトル.md`という名前でぶち込めばいい。

postを補助するためにshellスクリプトを以下

* "shamisonn.github.io" https://shamisonn.github.io/2017/05/15/update-post-shell.html

のようにこしらえたりしている。
今思えば別にshellじゃないくていいなコレ。

# 伝えたいこと

Jekyllを利用して簡単にブログを構築できるぞ！！

好きなエディタでかけるぞ！！！！

自分でテーマ作れるぞ！！！！！！！！！！！！

時間ない人は、はてなブログとかのサービス使えばいいんじゃないかな。

* "はてなブログ" https://hatenablog.com/