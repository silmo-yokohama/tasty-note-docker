-- データベースの作成
CREATE DATABASE IF NOT EXISTS tasty_note;
CREATE DATABASE IF NOT EXISTS tasty_note_testing;

-- 文字コードの設定
ALTER DATABASE tasty_note CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER DATABASE tasty_note_testing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ユーザーの作成と権限付与
CREATE USER IF NOT EXISTS 'tasty_note'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON tasty_note.* TO 'tasty_note'@'%';
GRANT ALL PRIVILEGES ON tasty_note_testing.* TO 'tasty_note'@'%';
FLUSH PRIVILEGES;