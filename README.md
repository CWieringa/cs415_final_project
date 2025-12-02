# CS415 Final Database Project

---

## Database Summary Report 

* 
*

---

## Database ER Model

*
*

```mermaid

```
---

## Create Tables

```sql
-- prj1.sql

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
```

---

## Insert Data

```sql
-- prj2.sql

-- USERS --

INSERT INTO users (username, email, password_hash)
VALUES
('clay', 'wieringac@huntington.edu', 'hash1'),
('david', 'david@hotmail.com', 'hash2'),
('ben', 'ben@gmail.com', 'hash3'),
('jesse', 'jesse@yahoo.com', 'hash4'),
('eve', 'eve@gmail.com', 'hash5'),
('frank', 'frank@gmail.com', 'hash6'),
('grace', 'grace@yahoo.com', 'hash7'),
('jeff', 'jeff@hotmail.com', 'hash8'),
('ivan', 'ivan@gmail.com', 'hash9'),
('nick', 'nick@yahoo.com', 'hash10'),
('mallory', 'mallory@gmail.com', 'hash11'),
('nancy', 'nancy@gmail.com', 'hash12'),
('oliver', 'oliver@hotmail.com', 'hash13'),
('sam', 'sam@yahoo.com', 'hash14'),
('quentin', 'quentin@gmail.com', 'hash15'),
('rachel', 'rachel@yahoo.com', 'hash16'),
('steve', 'steve@gmail.com', 'hash17'),
('trent', 'trent@gmail.com', 'hash18'),
('victor', 'victor@hotmail.com', 'hash19'),
('dale', 'dale@yahoo.com', 'hash20');



-- PRODUCTS --

INSERT INTO product (user_id, scraping, favorite, product, description, code, weight, link)
VALUES
(1, TRUE, FALSE, 'Barley', 'Whole Barley - Animal Feed, Organic', 'GP168', '45 lb', 'https://azurestandard.com/barley'),
(1, TRUE, TRUE, 'Oats', 'Oats Steel Cut GF Organic', 'CE641', '25 lb', 'https://azurestandard.com/oats'),
(1, TRUE, FALSE, 'Chickpeas', 'Garbanzo Beans Organic', 'BE036', '25 lb', 'https://azurestandard.com/chickpeas'),
(1, TRUE, FALSE, 'Chicken Wheat', 'Chicken Wheat Animal Feed Organic', 'GP073', '50 lb', 'https://azurestandard.com/chickenwheat'),
(1, TRUE, TRUE, 'Alfalfa', 'Alfalfa Pellets Organic', 'GP491', '40 lb', 'https://azurestandard.com/alfalfa'),
(1, TRUE, FALSE, 'Peas', 'Field Peas Animal Feed Organic', 'GP559', '50 lb', 'https://azurestandard.com/peas'),
(1, TRUE, FALSE, 'Whole Corn', 'Whole Yellow Corn Animal Feed Organic', 'GP850', '50 lb', 'https://azurestandard.com/corn'),
(1, TRUE, TRUE, 'Sunflower Seeds', 'Sunflower Seeds Black Oil Organic', 'GP603', '25 lb', 'https://azurestandard.com/sunflower'),
(1, TRUE, FALSE, 'Quinoa', 'Quinoa White Organic', 'GR074', '25 lb', 'https://azurestandard.com/quinoa'),
(1, TRUE, FALSE, 'Flax Seeds', 'Flax Seeds Organic', 'SE019', '50 lb', 'https://azurestandard.com/flax'),
(1, TRUE, FALSE, 'Rye', 'Azure Market Organics Rye Grain', 'GR059', '50lb', 'https://azurestandard.com/rye'),

(2, TRUE, FALSE, 'Barley', 'Whole Barley Organic', 'GP168', '45 lb', 'https://azurestandard.com/barley'),
(2, TRUE, TRUE, 'Oats', 'Oats Steel Cut GF', 'CE641', '25 lb', 'https://azurestandard.com/oats'),
(2, TRUE, FALSE, 'Chickpeas', 'Chickpeas Organic', 'BE036', '25 lb', 'https://azurestandard.com/chickpeas'),
(2, TRUE, FALSE, 'Chicken Wheat', 'Chicken Wheat Organic', 'GP073', '50 lb', 'https://azurestandard.com/chickenwheat'),
(2, TRUE, FALSE, 'Alfalfa', 'Alfalfa Pellets Organic', 'GP491', '40 lb', 'https://azurestandard.com/alfalfa'),
(2, TRUE, FALSE, 'Peas', 'Peas Organic', 'GP559', '50 lb', 'https://azurestandard.com/peas'),
(2, TRUE, FALSE, 'Whole Corn', 'Whole Yellow Corn', 'GP850', '50 lb', 'https://azurestandard.com/corn'),
(2, TRUE, FALSE, 'Sunflower Seeds', 'Sunflower Seeds Organic', 'GP603', '25 lb', 'https://azurestandard.com/sunflower'),
(2, TRUE, FALSE, 'Quinoa', 'Quinoa Organic', 'GR074', '25 lb', 'https://azurestandard.com/quinoa'),
(2, TRUE, FALSE, 'Flax Seeds', 'Flax Organic', 'SE019', '50 lb', 'https://azurestandard.com/flax'),
(2, TRUE, FALSE, 'Rye', 'Azure Market Organics Rye Grain', 'GR059', '50lb', 'https://azurestandard.com/rye'),

(3, TRUE, FALSE, 'Oats', 'Oats Organic', 'CE641', '25 lb', 'https://azurestandard.com/oats'),
(3, TRUE, TRUE, 'Sunflower Seeds', 'Black Oil Organic', 'GP603', '25 lb', 'https://azurestandard.com/sunflower'),
(3, TRUE, FALSE, 'Peas', 'Field Peas', 'GP559', '50 lb', 'https://azurestandard.com/peas'),
(3, TRUE, FALSE, 'Quinoa', 'Quinoa White', 'GR074', '25 lb', 'https://azurestandard.com/quinoa'),
(3, TRUE, FALSE, 'Flax Seeds', 'Flax Seeds', 'SE019', '50 lb', 'https://azurestandard.com/flax'),
(3, TRUE, FALSE, 'Barley', 'Barley Whole', 'GP168', '45 lb', 'https://azurestandard.com/barley'),
(3, TRUE, TRUE, 'Chicken Wheat', 'Chicken Wheat', 'GP073', '50 lb', 'https://azurestandard.com/chickenwheat'),
(3, TRUE, FALSE, 'Chickpeas', 'Chickpeas', 'BE036', '25 lb', 'https://azurestandard.com/chickpeas'),
(3, TRUE, FALSE, 'Whole Corn', 'Corn Yellow', 'GP850', '50 lb', 'https://azurestandard.com/corn'),
(3, TRUE, FALSE, 'Alfalfa', 'Alfalfa', 'GP491', '40 lb', 'https://azurestandard.com/alfalfa'),
(3, TRUE, FALSE, 'Rye', 'Azure Market Organics Rye Grain', 'GR059', '50lb', 'https://azurestandard.com/rye'),

(4, TRUE, FALSE, 'Barley', 'Barley Organic', 'GP168', '45 lb', 'https://azurestandard.com/barley'),
(4, TRUE, FALSE, 'Oats', 'Oats Organic', 'CE641', '25 lb', 'https://azurestandard.com/oats'),
(4, TRUE, FALSE, 'Flax Seeds', 'Flax', 'SE019', '50 lb', 'https://azurestandard.com/flax'),
(4, TRUE, FALSE, 'Peas', 'Peas', 'GP559', '50 lb', 'https://azurestandard.com/peas'),
(4, TRUE, FALSE, 'Quinoa', 'Quinoa', 'GR074', '25 lb', 'https://azurestandard.com/quinoa'),
(4, TRUE, FALSE, 'Chickpeas', 'Chickpeas', 'BE036', '25 lb', 'https://azurestandard.com/chickpeas'),
(4, TRUE, FALSE, 'Chicken Wheat', 'Chicken Wheat', 'GP073', '50 lb', 'https://azurestandard.com/chickenwheat'),
(4, TRUE, FALSE, 'Sunflower Seeds', 'Sunflower Seeds', 'GP603', '25 lb', 'https://azurestandard.com/sunflower'),
(4, TRUE, FALSE, 'Whole Corn', 'Corn', 'GP850', '50 lb', 'https://azurestandard.com/corn'),
(4, TRUE, FALSE, 'Alfalfa', 'Alfalfa', 'GP491', '40 lb', 'https://azurestandard.com/alfalfa'),
(4, TRUE, FALSE, 'Rye', 'Azure Market Organics Rye Grain', 'GR059', '50lb', 'https://azurestandard.com/rye');


-- PRODUCT_DATA --

INSERT INTO product_data (product_id, code, timestamp, price_cents, price_per, stock, out_stock)
VALUES

(1,'GP168','2024-06-24 17:24:47',2358,'0.52/pound',2589,''),
(2,'CE641','2024-06-24 17:24:47',3068,'0.08/ounce',100,''),
(3,'BE036','2024-06-24 17:24:47',5209,'2.08/pound',698,''),
(4,'GP073','2024-06-24 17:24:47',3258,'0.65/pound',1054,''),
(5,'GP491','2024-06-24 17:24:47',3082,'0.77/pound',1053,''),
(6,'GP559','2024-06-24 17:24:47',4038,'0.81/pound',358,''),
(7,'GP850','2024-06-24 17:24:47',2473,'0.49/pound',475,''),
(8,'GP603','2024-06-24 17:24:47',5513,'2.21/pound',63,''),
(9,'GR074','2024-06-24 17:24:47',5578,'2.23/pound',1325,''),
(10,'SE019','2024-06-24 17:24:47',6818,'1.36/pound',824,''),
(11,'GR059','2024-06-24 17:24:47',4239,'0.85/pound',618,''),

(1,'GP168','2024-07-01 09:00:00',2300,'0.51/pound',2600,''),
(2,'CE641','2024-07-01 09:00:00',3040,'0.07/ounce',99,''),
(3,'BE036','2024-07-01 09:00:00',5250,'2.09/pound',700,''),
(4,'GP073','2024-07-01 09:00:00',3300,'0.66/pound',1052,''),
(5,'GP491','2024-07-01 09:00:00',3100,'0.78/pound',1050,''),
(6,'GP559','2024-07-01 09:00:00',4050,'0.82/pound',355,''),
(7,'GP850','2024-07-01 09:00:00',2490,'0.49/pound',470,''),
(8,'GP603','2024-07-01 09:00:00',5500,'2.22/pound',60,''),
(9,'GR074','2024-07-01 09:00:00',5600,'2.24/pound',1320,''),
(10,'SE019','2024-07-01 09:00:00',6850,'1.37/pound',820,''),
(11,'GR059','2024-07-01 09:00:00',4290,'0.86/pound',620,''),

(1,'GP168','2024-07-08 09:00:00',2380,'0.53/pound',2590,''),
(2,'CE641','2024-07-08 09:00:00',3000,'0.07/ounce',98,''),
(3,'BE036','2024-07-08 09:00:00',5180,'2.07/pound',690,''),
(4,'GP073','2024-07-08 09:00:00',3280,'0.65/pound',1053,''),
(5,'GP491','2024-07-08 09:00:00',3070,'0.77/pound',1051,''),
(6,'GP559','2024-07-08 09:00:00',3990,'0.80/pound',360,''),
(7,'GP850','2024-07-08 09:00:00',2450,'0.49/pound',478,''),
(8,'GP603','2024-07-08 09:00:00',5490,'2.20/pound',61,''),
(9,'GR074','2024-07-08 09:00:00',5580,'2.23/pound',1321,''),
(10,'SE019','2024-07-08 09:00:00',6820,'1.36/pound',825,''),
(11,'GR059','2024-07-08 09:00:00',4210,'0.84/pound',615,''),

(1,'GP168','2024-07-15 09:00:00',2380,'0.53/pound',2690,''),
(2,'CE641','2024-07-15 09:00:00',3000,'0.07/ounce',108,''),
(3,'BE036','2024-07-15 09:00:00',5180,'2.07/pound',790,''),
(4,'GP073','2024-07-15 09:00:00',3280,'0.65/pound',1253,''),
(5,'GP491','2024-07-15 09:00:00',3070,'0.77/pound',951,''),
(6,'GP559','2024-07-15 09:00:00',3990,'0.80/pound',480,''),
(7,'GP850','2024-07-15 09:00:00',2450,'0.49/pound',498,''),
(8,'GP603','2024-07-15 09:00:00',5490,'2.20/pound',91,''),
(9,'GR074','2024-07-15 09:00:00',5580,'2.23/pound',1621,''),
(10,'SE019','2024-07-15 09:00:00',6820,'1.36/pound',925,''),
(11,'GR059','2024-07-15 09:00:00',4300,'0.86/pound',625,''),

(1,'GP168','2024-07-22 09:00:00',2400,'0.54/pound',2700,''),
(2,'CE641','2024-07-22 09:00:00',3020,'0.07/ounce',107,''),
(3,'BE036','2024-07-22 09:00:00',5220,'2.08/pound',700,''),
(4,'GP073','2024-07-22 09:00:00',3320,'0.66/pound',1260,''),
(5,'GP491','2024-07-22 09:00:00',3090,'0.78/pound',940,''),
(6,'GP559','2024-07-22 09:00:00',4020,'0.81/pound',470,''),
(7,'GP850','2024-07-22 09:00:00',2480,'0.49/pound',490,''),
(8,'GP603','2024-07-22 09:00:00',5520,'2.21/pound',92,''),
(9,'GR074','2024-07-22 09:00:00',5590,'2.23/pound',1600,''),
(10,'SE019','2024-07-22 09:00:00',6840,'1.36/pound',928,''),
(11,'GR059','2024-07-22 09:00:00',4310,'0.86/pound',630,''),

(1,'GP168','2024-07-29 09:00:00',2410,'0.54/pound',2680,''),
(2,'CE641','2024-07-29 09:00:00',3010,'0.07/ounce',105,''),
(3,'BE036','2024-07-29 09:00:00',5170,'2.06/pound',710,''),
(4,'GP073','2024-07-29 09:00:00',3270,'0.65/pound',1240,''),
(5,'GP491','2024-07-29 09:00:00',3050,'0.76/pound',930,''),
(6,'GP559','2024-07-29 09:00:00',3970,'0.79/pound',485,''),
(7,'GP850','2024-07-29 09:00:00',2420,'0.48/pound',460,''),
(8,'GP603','2024-07-29 09:00:00',5460,'2.19/pound',85,''),
(9,'GR074','2024-07-29 09:00:00',5560,'2.22/pound',1580,''),
(10,'SE019','2024-07-29 09:00:00',6790,'1.35/pound',900,''),
(11,'GR059','2024-07-29 09:00:00',4200,'0.84/pound',600,''),

(1,'GP168','2024-08-05 09:00:00',2390,'0.53/pound',2670,''),
(2,'CE641','2024-08-05 09:00:00',2990,'0.07/ounce',104,''),
(3,'BE036','2024-08-05 09:00:00',5160,'2.06/pound',715,''),
(4,'GP073','2024-08-05 09:00:00',3260,'0.65/pound',1230,''),
(5,'GP491','2024-08-05 09:00:00',3040,'0.76/pound',920,''),
(6,'GP559','2024-08-05 09:00:00',3960,'0.79/pound',488,''),
(7,'GP850','2024-08-05 09:00:00',2430,'0.48/pound',462,''),
(8,'GP603','2024-08-05 09:00:00',5470,'2.19/pound',83,''),
(9,'GR074','2024-08-05 09:00:00',5570,'2.22/pound',1590,''),
(10,'SE019','2024-08-05 09:00:00',6810,'1.36/pound',897,''),
(11,'GR059','2024-08-05 09:00:00',4220,'0.84/pound',602,''),

(1,'GP168','2024-08-12 09:00:00',2400,'0.53/pound',2660,''),
(2,'CE641','2024-08-12 09:00:00',2980,'0.07/ounce',102,''),
(3,'BE036','2024-08-12 09:00:00',5150,'2.06/pound',720,''),
(4,'GP073','2024-08-12 09:00:00',3275,'0.65/pound',1225,''),
(5,'GP491','2024-08-12 09:00:00',3060,'0.76/pound',915,''),
(6,'GP559','2024-08-12 09:00:00',3975,'0.79/pound',490,''),
(7,'GP850','2024-08-12 09:00:00',2440,'0.49/pound',465,''),
(8,'GP603','2024-08-12 09:00:00',5480,'2.19/pound',84,''),
(9,'GR074','2024-08-12 09:00:00',5585,'2.22/pound',1595,''),
(10,'SE019','2024-08-12 09:00:00',6830,'1.36/pound',910,''),
(11,'GR059','2024-08-12 09:00:00',4260,'0.85/pound',610,'');


-- USER_PRODUCT_SETTINGS --

INSERT INTO user_product_settings (user_id, product_id, notify_low_stock, track_price)
VALUES
(1, 1, TRUE, TRUE),
(1, 2, FALSE, TRUE),
(1, 3, TRUE, TRUE),
(1, 4, FALSE, TRUE),
(1, 5, FALSE, TRUE),
(1, 6, TRUE, TRUE),
(1, 7, FALSE, TRUE),
(1, 8, TRUE, TRUE),
(1, 9, FALSE, TRUE),
(1, 10, TRUE, TRUE),

(2, 11, TRUE, TRUE),
(2, 12, FALSE, TRUE),
(2, 13, TRUE, TRUE),
(2, 14, TRUE, TRUE),
(2, 15, FALSE, TRUE),
(2, 16, TRUE, TRUE),
(2, 17, FALSE, TRUE),
(2, 18, TRUE, TRUE),
(2, 19, FALSE, TRUE),
(2, 20, TRUE, TRUE),

(3, 21, TRUE, TRUE),
(3, 22, FALSE, TRUE),
(3, 23, TRUE, TRUE),
(3, 24, FALSE, TRUE),
(3, 25, TRUE, TRUE),
(3, 26, FALSE, TRUE),
(3, 27, TRUE, TRUE),
(3, 28, FALSE, TRUE),
(3, 29, TRUE, TRUE),
(3, 30, FALSE, TRUE),

(4, 31, TRUE, TRUE),
(4, 32, FALSE, TRUE),
(4, 33, TRUE, TRUE),
(4, 34, FALSE, TRUE),
(4, 35, TRUE, TRUE),
(4, 36, FALSE, TRUE),
(4, 37, TRUE, TRUE),
(4, 38, FALSE, TRUE),
(4, 39, TRUE, TRUE),
(4, 40, FALSE, TRUE);
```

---

## Queries

```sql
```

---

## Reports

---

## Delete Tables

```sql
-- prj4.sql

-- drop tables --
drop table user_product_settings;
drop table product_data;
drop table product;
drop table users;

```

---

## Poster

[Poster PDF](poster.pdf)

---

