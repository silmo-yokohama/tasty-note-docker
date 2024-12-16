FROM node:20-slim

# システムの更新とタイムゾーン設定
RUN apt-get update && apt-get install -y \
  git \
  curl \
  tzdata \
  && rm -rf /var/lib/apt/lists/* \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# 作業ディレクトリの設定
WORKDIR /app

# デフォルトのnodeユーザーを使用（既にUID 1000で存在する）
USER node

# Nuxt.js開発サーバーのポート
EXPOSE 3000

# 開発サーバー起動コマンド
CMD ["sh", "-c", "npm install && npm run dev"]