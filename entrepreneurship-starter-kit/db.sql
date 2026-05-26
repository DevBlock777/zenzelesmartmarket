-- =============================================
-- CRÉATION DE LA BASE DE DONNÉES
-- =============================================
CREATE DATABASE IF NOT EXISTS zenzenle
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE zenzenle;

-- =============================================
-- TABLE : user
-- =============================================
CREATE TABLE `user` (
  `id`         CHAR(36)     NOT NULL DEFAULT (UUID()),
  `email`      VARCHAR(255) NOT NULL UNIQUE,
  `password`   VARCHAR(255) NOT NULL,
  `pinhash`    VARCHAR(255)     NULL,
  `address`    VARCHAR(255)     NULL,
  `seed`       text     NULL,
  `created_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- =============================================
-- TABLE : profile
-- =============================================
CREATE TABLE `profile` (
  `id`          CHAR(36)     NOT NULL DEFAULT (UUID()),
  `user_id`     CHAR(36)     NOT NULL UNIQUE,
  `image`       VARCHAR(500)     NULL,
  `description` TEXT             NULL,
  `jobtitle`    VARCHAR(255)     NULL,
  `audio`       VARCHAR(500)     NULL,
  `country`     VARCHAR(100)     NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_profile_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLE : service
-- =============================================
CREATE TABLE `service` (
  `id`          CHAR(36)     NOT NULL DEFAULT (UUID()),
  `user_id`     CHAR(36)     NOT NULL,
  `description` TEXT             NULL,
  `audio`       VARCHAR(500)     NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_service_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLE : service_media
-- =============================================
CREATE TABLE `service_media` (
  `id`         CHAR(36)     NOT NULL DEFAULT (UUID()),
  `service_id` CHAR(36)     NOT NULL,
  `image`      VARCHAR(500)     NULL,
  `url`        VARCHAR(500)     NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_service_media_service`
    FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLE : follower
-- =============================================
CREATE TABLE `follower` (
  `id`          CHAR(36)     NOT NULL DEFAULT (UUID()),
  `user_id`     CHAR(36)     NOT NULL,
  `follower_id` CHAR(36)     NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_follow` (`user_id`, `follower_id`),
  CONSTRAINT `fk_follower_user`
    FOREIGN KEY (`user_id`)     REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_follower_follower`
    FOREIGN KEY (`follower_id`) REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLE : nft
-- =============================================
CREATE TABLE `nft` (
  `id`       CHAR(36)     NOT NULL DEFAULT (UUID()),
  `user_id`  CHAR(36)     NOT NULL,
  `policyid` VARCHAR(255)     NULL,
  `name`     VARCHAR(255)     NULL,
  `txhash`   VARCHAR(255)     NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_nft_user`
    FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- TABLE : like
-- =============================================
CREATE TABLE `like` (
  `id`         CHAR(36)     NOT NULL DEFAULT (UUID()),
  `profile_id` CHAR(36)     NOT NULL,
  `user_id`    CHAR(36)     NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_like` (`profile_id`, `user_id`),
  CONSTRAINT `fk_like_profile`
    FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like_user`
    FOREIGN KEY (`user_id`)    REFERENCES `user` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;