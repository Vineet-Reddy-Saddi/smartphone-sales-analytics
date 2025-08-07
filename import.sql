COPY smartphones(product_id, model, price, rating, sim, processor, ram, battery, display, camera, card, os)
FROM 'F:/Vineet_Saddi_Job_Ready/Projects/Smartphone/Data/smartphone_data.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ENCODING 'UTF8';

COPY customers(customer_id, first_name, last_name, gender, age, region, income_bracket)
FROM 'F:/Vineet_Saddi_Job_Ready/Projects/Smartphone/Data/customers.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ENCODING 'UTF8';

COPY sales(sale_id, product_id, units_sold, price, region, channel, promotion_type, customer_id)
FROM 'F:/Vineet_Saddi_Job_Ready/Projects/Smartphone/Data/sales_data.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ENCODING 'UTF8';
