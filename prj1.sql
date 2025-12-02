-- USERS: stores application users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX (username)
)ENGINE=InnoDB;

-- PRODUCT: user defined product entries
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    scraping BOOLEAN DEFAULT TRUE,
    favorite BOOLEAN DEFAULT FALSE,
    product VARCHAR(50),
    description VARCHAR(200),
    code VARCHAR(10),
    weight VARCHAR(50),
    link VARCHAR(250),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX (user_id),
    INDEX (product)
)ENGINE=InnoDB;

-- PRODUCT_DATA: scraped results for products
CREATE TABLE product_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    code VARCHAR(10),
    timestamp DATETIME,
    price_cents INT,
    price_per VARCHAR(20),
    stock INT,
    out_stock VARCHAR(30),
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    INDEX (product_id),
    INDEX (timestamp)
)ENGINE=InnoDB;

-- USER_PRODUCT_SETTINGS: optional customization of product tracking per user
CREATE TABLE user_product_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    notify_low_stock BOOLEAN DEFAULT FALSE,
    track_price BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    UNIQUE (user_id, product_id)
)ENGINE=InnoDB;