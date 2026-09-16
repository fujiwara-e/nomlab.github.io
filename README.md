## nomlab.github.io
乃村研究室の web ページ．
これまでは，[nomnichi](https://github.com/nomlab/nomnichi) として運用していたが，
Hugo + GitHub Pages に移行した．


## Setup
### Requirements
Hugo のモジュール管理に Go を利用する．
Go のバージョンは `go1.26.5` を想定している．
### Install
Hugo をインストールする．
Hugo のバージョンは `v0.164.0` を想定している．

- MacOS
  ```
  brew install hugo
  ```

- Linux
  ```
  # Hugo のリポジトリ (https://github.com/gohugoio/hugo) の Release から取得する
  wget https://github.com/gohugoio/hugo/releases/download/v0.164.0/hugo_0.164.0_Linux-64bit.tar.gz

  # tar を展開する
  tar -zvxf hugo_0.164.0_Linux-64bit.tar.gz

  # 展開した実行ファイルを任意のディレクトリに配置する
  mv hugo /path/to/your/directory

  # ディレクトリのパスを通す
  export PATH=/path/to/your/directory:$PATH #(永続化するには，.bashrc や .zshrc に追記する)
  ```


### Clone nomlab.github.io
GitHub より nomlab.github.io のリポジトリを clone し，リポジトリ内へ移動する．
```
$ git clone git@github.com:nomlab/nomlab.github.io.git
$ cd nomlab.github.io
```

### Init
コミット前に下書きの記事をチェックする Git hook をインストールする．
```
make init
```

## Write article 
記事の雛形を作成する．
```
make new
```
Title を入力し，YYYYMMDD-Title で content/articles/YYYYMMDD-title/index.md が作成される．
index.md を編集することで，記事を執筆する．

## Launch embedded server
Hugo の組み込み Web サーバを起動する．
```
make preview
```
`http://localhost:1313/lab/nom/` にアクセスすることで表示可能．
