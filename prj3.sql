-- prj3.sql


-- Query 1 --
SELECT pc.name, pd.timestamp, pd.price_cents
FROM product_catalog pc
JOIN product_data pd ON pc.id = pd.product_id
ORDER BY pc.name ASC, pd.timestamp DESC;

-- Query 2 --
SELECT pc.name, pd.timestamp, pd.price_cents / 100 AS price_dollars
FROM product_catalog pc
JOIN product_data pd ON pc.id = pd.product_id
ORDER BY pc.name ASC, pd.timestamp DESC;


-- Query 3 --
SELECT pc.name, MONTH(pd.timestamp) AS month, pd.price_cents
FROM product_catalog pc
JOIN product_data pd ON pc.id = pd.product_id
ORDER BY pc.name ASC, month;

-- Query 4 --
SELECT 
    pc.name, 
    ROUND(AVG(pd.price_cents) / 100.0, 2) AS avg_price_dollars
FROM product_catalog pc
JOIN product_data pd ON pc.id = pd.product_id
GROUP BY pc.name
HAVING AVG(pd.price_cents) / 100.0 > 50;

-- Query 5 --
SELECT u.username, pc.name AS product_name, pd.timestamp ,pd.price_cents, pd.stock
FROM users u
INNER JOIN user_product up ON u.id = up.user_id
INNER JOIN product_catalog pc ON up.product_id = pc.id
INNER JOIN product_data pd ON pc.id = pd.product_id
WHERE up.favorite = TRUE
ORDER BY u.username, pd.timestamp DESC;

-- Query 6 --
SELECT u.username, pc.name AS product_name, up.track_price
FROM users u
LEFT JOIN user_product up ON u.id = up.user_id
LEFT JOIN product_catalog pc ON up.product_id = pc.id
ORDER BY u.username;

-- Query 7 --
SELECT user_id, product_id, notify_low_stock
FROM user_product
WHERE user_id = 1 AND product_id = 2;

UPDATE user_product
SET notify_low_stock = TRUE
WHERE user_id = 1 AND product_id = 2;

SELECT user_id, product_id, notify_low_stock
FROM user_product
WHERE user_id = 1 AND product_id = 2;

-- Query 8 --
SELECT user_id, product_id, notify_low_stock
FROM user_product
WHERE user_id = 3 AND product_id = 5;

DELETE FROM user_product
WHERE user_id = 3 AND product_id = 5;

SELECT user_id, product_id, notify_low_stock
FROM user_product
WHERE user_id = 3 AND product_id = 5;

-- Query 9 --
CREATE VIEW user_favorites_latest AS
SELECT u.username, pc.name AS product_name, pd.price_cents, pd.stock
FROM users u
JOIN user_product up ON u.id = up.user_id
JOIN product_catalog pc ON up.product_id = pc.id
JOIN product_data pd ON pc.id = pd.product_id
WHERE up.favorite = TRUE
AND pd.timestamp = (SELECT MAX(timestamp) FROM product_data WHERE product_id = pc.id);

SELECT * FROM user_favorites_latest;

-- Query 10 --
SELECT user_id, product_id, track_price
FROM user_product
WHERE user_id = 2 AND product_id IN (1, 3, 5);

START TRANSACTION;

UPDATE user_product
SET track_price = FALSE
WHERE user_id = 2 AND product_id IN (1, 3, 5);

SELECT user_id, product_id, track_price
FROM user_product
WHERE user_id = 2 AND product_id IN (1, 3, 5);

ROLLBACK;

SELECT user_id, product_id, track_price
FROM user_product
WHERE user_id = 2 AND product_id IN (1, 3, 5);
