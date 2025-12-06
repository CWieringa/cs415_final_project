-- prj1.sql

-- USERS --
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX (username)
) ENGINE=InnoDB;


-- PRODUCT_CATALOG --
CREATE TABLE product_catalog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    code VARCHAR(20) NOT NULL UNIQUE,
    weight VARCHAR(50),
    link VARCHAR(250)
) ENGINE=InnoDB;


-- USER_PRODUCT --
CREATE TABLE user_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    scraping BOOLEAN DEFAULT TRUE,
    favorite BOOLEAN DEFAULT FALSE,
    notify_low_stock BOOLEAN DEFAULT FALSE,
    track_price BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product_catalog(id) ON DELETE CASCADE,

    UNIQUE (user_id, product_id)
) ENGINE=InnoDB;


-- PRODUCT_DATA --
CREATE TABLE product_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    price_cents INT,
    stock INT,

    FOREIGN KEY (product_id) REFERENCES product_catalog(id) ON DELETE CASCADE,
    INDEX (product_id),
    INDEX (timestamp)
) ENGINE=InnoDB;