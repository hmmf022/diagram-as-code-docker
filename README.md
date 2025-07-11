# AWSアーキテクチャ図ジェネレーター (diagram-as-code サンプル)

このリポジトリは、AWS Labsの [diagram-as-code](https://github.com/awslabs/diagram-as-code) (`awsdac`) を使用して、コード (YAML) からAWSのアーキテクチャ図を生成するためのサンプルプロジェクトです。

Dockerを利用して`awsdac`の実行環境を構築するため、ローカル環境を汚さずにすぐに試すことができます。

## 生成されるアーキテクチャ図

`diagram.yaml` からは、以下のような一般的なWebアプリケーションの3層アーキテクチャ図が生成されます。

<img width="1848" height="936" alt="diagram" src="https://github.com/user-attachments/assets/a48b4fc2-9ae4-4431-a49f-ed3f592d008b" />

## 特徴

*   **Declarative:** YAML形式でAWSの構成を宣言的に記述します。
*   **Reproducible:** コードで管理するため、誰でも同じ図を再現・バージョン管理できます。
*   **Portable:** Dockerコンテナ内で実行環境が完結しているため、環境差異に悩まされることがありません。

## 使い方

### 前提条件

*   [Docker](https://www.docker.com/) がインストールされていること。

### 1. Dockerイメージのビルド

リポジトリのルートディレクトリで以下のコマンドを実行し、`awsdac`を含むDockerイメージをビルドします。

```bash
docker build -t awsdac-runner .
```

### 2. アーキテクチャ図の生成

以下のコマンドを実行すると、`diagram.yaml`をインプットとして`diagram.png`というファイル名で図が生成されます。

```bash
docker run --rm -v "$(pwd):/app" awsdac-runner awsdac diagram.yaml -o output.png
```

コマンドが正常に完了すると、ホストマシンにPNG形式のアーキテクチャ図が作成されます。

## ファイル構成

```
.
├── Dockerfile      # awsdacの実行環境を定義するファイル
├── diagram.yaml    # 生成したいAWSアーキテクチャの定義ファイル
└── output/         # (生成後) 図が出力されるディレクトリ
```

*   **`Dockerfile`**: `awsdac` (v0.21.12) とその依存関係（Liberationフォント）をインストールしたGo言語環境を定義しています。
*   **`diagram.yaml`**: ALB、EC2、RDSなどを含むVPCの構成を定義したサンプルファイルです。このファイルを編集することで、独自のアーキテクチャ図を作成できます。
