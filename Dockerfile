# ベースイメージとして公式のGoイメージを使用 (Go 1.23以上)
FROM golang:1.23-bookworm

# 作業ディレクトリの設定
WORKDIR /app

# diagram-as-codeが内部的に依存している Liberation フォントをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends fonts-liberation && \
    rm -rf /var/lib/apt/lists/*

# awsdacのバージョンを固定してインストール
RUN go install github.com/awslabs/diagram-as-code/cmd/awsdac@v0.21.12

# PATH環境変数を設定
ENV PATH="/go/bin:${PATH}"

# コンテナ起動時のデフォルトコマンド
CMD ["/bin/bash"]
