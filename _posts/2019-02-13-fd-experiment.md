---
layout: default
title: file descriptorの実験(不完全)
mode: post
---
<!--readmore-->

満足な結果を得られていないけどメモ程度に書く。

# 内容

docker内でファイルを開きまくったら
hostのfile descriptorの上限を超えれるか？

# 予想

https://stackoverflow.com/questions/46211558/ulimits-in-docker-host-vs-container

より、どうやらdockerはdefaultでカーネルのパラメータをそのまま使用しているので無理っぽい?

# 環境

mac にて

```
(mac)$ launchctl limit maxfiles
	maxfiles    524288         524288
```

その後 docker imageを取得
```
(mac)$ docker run -it -d --name ubuntu1604 ubuntu:16.04
(mac)$ docker exec -it ubuntu1604 /bin/bash
```

# やったこと

起動済みdocker 内にて 下記のpythonプログラムを実行

```python
f = []
for i in range(524288):
	f.append(open('/tmp/{0}.txt'.format(i), 'w+'))
	print(f[i].fileno())
```

# 結果

```
(docker)$ ls /tmp | sort -n
0.txt
1.txt
...
326672.txt
326673.txt
326674.txt
```
ということで 326674個まで開けた。
プログラム上では最後にただ単に `Killed` と書かれていた。

# 観察

だいたい`320000`個ぐらいから次のファイルを開き始めるまでの時間がどんどん伸びていき、
最終的にプロセスを殺されてしまった。

# まとめ

実験が雑なのでもっとラズパイあたりでやり直すと良さそう。


