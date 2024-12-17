FROM php:8.1.29-fpm

# システムの依存パッケージをインストール
RUN apt-get update && apt-get install -y \
  git \
  curl \
  libpng-dev \
  libonig-dev \
  libxml2-dev \
  zip \
  unzip \
  libssl-dev \
  ca-certificates \
  && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
  && update-ca-certificates

# Composerのインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 作業ディレクトリの設定
WORKDIR /var/www/html

# ユーザーを作成
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# パーミッションの設定
RUN chown -R www:www /var/www

# ユーザーの切り替え
USER www

# コンテナ起動時のコマンド
CMD ["php-fpm"]

EXPOSE 9000