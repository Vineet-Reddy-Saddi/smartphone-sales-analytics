-- 1. Remove ₹ symbol
UPDATE smartphones
SET price = REPLACE(REPLACE(price, '₹', ''), ',', '');

-- 2. Convert to integer
ALTER TABLE smartphones
ALTER COLUMN price TYPE INTEGER
USING price::integer;

