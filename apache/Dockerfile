FROM httpd:2.4

# 必要なモジュールをインストール
RUN apt-get update && apt-get install -y \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Apache モジュールを有効化
RUN sed -i \
  -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
  -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
  -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
  /usr/local/apache2/conf/httpd.conf

# デフォルトのconfをバックアップ
RUN cp /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf.orig

# DocumentRootディレクトリの作成
RUN mkdir -p /var/www/html/public

# PHP-FPMとの連携設定
RUN echo "<FilesMatch \.php$>" >> /usr/local/apache2/conf/httpd.conf \
  && echo "    SetHandler \"proxy:fcgi://php:9000\"" >> /usr/local/apache2/conf/httpd.conf \
  && echo "</FilesMatch>" >> /usr/local/apache2/conf/httpd.conf

# DocumentRootの設定
RUN sed -i 's|/usr/local/apache2/htdocs|/var/www/html/public|' /usr/local/apache2/conf/httpd.conf

# DirectoryIndexにindex.phpを追加
RUN sed -i 's|DirectoryIndex index.html|DirectoryIndex index.php index.html|' /usr/local/apache2/conf/httpd.conf

# AllowOverrideをAllに設定（.htaccessを有効化）
RUN sed -i 's|AllowOverride None|AllowOverride All|' /usr/local/apache2/conf/httpd.conf

EXPOSE 80