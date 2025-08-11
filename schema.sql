CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    age INTEGER,
    region VARCHAR(50),
    income_bracket VARCHAR(20)
);

CREATE TABLE smartphones (
    product_id INTEGER PRIMARY KEY,
    model VARCHAR(100),
    price TEXT,
    rating DECIMAL(4,1),
    sim VARCHAR(100),
    processor VARCHAR(100),
    ram VARCHAR(100), 
    battery VARCHAR(100),
    display VARCHAR(150),
    camera VARCHAR(150),
    card VARCHAR(100), 
    os VARCHAR(50)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES smartphones(product_id),
    units_sold INTEGER,
    price INTEGER,
    region VARCHAR(50),
    channel VARCHAR(50),
    promotion_type VARCHAR(50),
    customer_id INTEGER REFERENCES customers(customer_id)
);

