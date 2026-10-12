-- 02-seed.sql: Insert rich sample JSON data

INSERT INTO customers (username, email, profile) VALUES
('alice_dev', 'alice@example.com', '{"age": 28, "country": "US", "preferences": {"theme": "dark", "notifications": true}, "tags": ["vip", "early-adopter"]}'),
('bob_smith', 'bob@example.com', '{"age": 34, "country": "CA", "preferences": {"theme": "light", "notifications": false}, "tags": ["regular"]}'),
('charlie_99', 'charlie@example.com', '{"age": 41, "country": "UK", "preferences": {"theme": "dark", "notifications": true}, "tags": ["vip"]}'),
('diana_prince', 'diana@example.com', '{"age": 29, "country": "US", "preferences": {"theme": "system", "notifications": true}, "tags": ["wholesale"]}'),
('ethan_hunt', 'ethan@example.com', '{"age": 45, "country": "AU", "preferences": {"theme": "dark", "notifications": false}, "tags": ["regular"]}'),
('fiona_gallagher', 'fiona@example.com', '{"age": 25, "country": "US", "preferences": {"theme": "light", "notifications": true}, "tags": ["early-adopter"]}'),
('george_clark', 'george@example.com', '{"age": 38, "country": "DE", "preferences": {"theme": "dark", "notifications": true}, "tags": ["vip"]}'),
('hannah_abbott', 'hannah@example.com', '{"age": 31, "country": "UK", "preferences": {"theme": "light", "notifications": false}, "tags": ["regular"]}');

INSERT INTO orders (customer_id, total_amount, order_data) VALUES
(1, 299.98, '{"shipping_method": "express", "items": [{"product_id": "P101", "name": "Mechanical Keyboard", "qty": 1, "price": 149.99}, {"product_id": "P102", "name": "Wireless Mouse", "qty": 1, "price": 149.99}], "notes": "Leave at front door"}'),
(1, 45.50, '{"shipping_method": "standard", "items": [{"product_id": "P205", "name": "USB-C Cable", "qty": 2, "price": 22.75}], "notes": null}'),
(2, 599.00, '{"shipping_method": "express", "items": [{"product_id": "P301", "name": "UltraWide Monitor", "qty": 1, "price": 599.00}], "notes": "Fragile"}'),
(3, 120.00, '{"shipping_method": "standard", "items": [{"product_id": "P105", "name": "Desk Mat", "qty": 2, "price": 35.00}, {"product_id": "P106", "name": "Coffee Mug", "qty": 1, "price": 50.00}], "notes": null}'),
(4, 1250.00, '{"shipping_method": "express", "items": [{"product_id": "P401", "name": "Laptop Stand", "qty": 5, "price": 250.00}], "notes": "Business order"}'),
(5, 89.99, '{"shipping_method": "standard", "items": [{"product_id": "P110", "name": "Webcam Cover", "qty": 3, "price": 29.99}], "notes": null}'),
(6, 340.20, '{"shipping_method": "express", "items": [{"product_id": "P201", "name": "Bluetooth Headset", "qty": 1, "price": 199.20}, {"product_id": "P202", "name": "Stand", "qty": 1, "price": 141.00}], "notes": "Call upon arrival"}'),
(7, 450.00, '{"shipping_method": "standard", "items": [{"product_id": "P501", "name": "Ergonomic Chair", "qty": 1, "price": 450.00}], "notes": null}'),
(8, 75.00, '{"shipping_method": "express", "items": [{"product_id": "P108", "name": "Desk Lamp", "qty": 1, "price": 75.00}], "notes": "Gift wrap"}');