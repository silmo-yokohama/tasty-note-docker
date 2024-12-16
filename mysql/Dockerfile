FROM mysql:5.7

# 環境変数の設定
ENV TZ=Asia/Tokyo

# MySQLのカスタム設定
RUN echo "[mysqld]" > /etc/mysql/conf.d/custom.cnf \
  && echo "character-set-server = utf8mb4" >> /etc/mysql/conf.d/custom.cnf \
  && echo "collation-server = utf8mb4_unicode_ci" >> /etc/mysql/conf.d/custom.cnf \
  && echo "default-storage-engine = InnoDB" >> /etc/mysql/conf.d/custom.cnf \
  && echo "innodb_buffer_pool_size = 128M" >> /etc/mysql/conf.d/custom.cnf \
  && echo "max_connections = 100" >> /etc/mysql/conf.d/custom.cnf \
  && echo "sql_mode = STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" >> /etc/mysql/conf.d/custom.cnf

# クライアント設定
RUN echo "[client]" >> /etc/mysql/conf.d/custom.cnf \
  && echo "default-character-set = utf8mb4" >> /etc/mysql/conf.d/custom.cnf

EXPOSE 3306