CREATE DATABASE purchase_vendor_analysis;

use purchase_vendor_analysis;

select * from purchase_vendor_analysis_dataset;

select count(*) from purchase_vendor_analysis_dataset;

rename table purchase_vendor_analysis_dataset to purchase_data;

alter table purchase_data drop column MyUnknownColumn;
alter table purchase_data drop column `MyUnknownColumn_[0]`;

update purchase_data set Unit_Price=replace(Unit_Price,'â‚¹','');

update purchase_data set Total_Cost=replace(Total_Cost,'â‚¹','');

SELECT SUM(total_cost) AS total_procurement_cost
FROM purchase_data;

describe purchase_data;

ALTER TABLE purchase_data
RENAME COLUMN `ï»¿Purchase_ID` TO Purchase_ID;

ALTER TABLE purchase_data
RENAME COLUMN `Month Name` TO Month_name;

SELECT COUNT(purchase_id) AS total_orders
FROM purchase_data;

SELECT AVG(delivery_days) AS avg_delivery_days
FROM purchase_data;

SELECT vendor_name,
SUM(total_cost) AS total_spending
FROM purchase_data
GROUP BY vendor_name
ORDER BY total_spending DESC;

SELECT vendor_name,
ROUND(AVG(vendor_rating),2) AS avg_rating
FROM purchase_data
GROUP BY vendor_name
ORDER BY avg_rating DESC;

SELECT vendor_name,
COUNT(*) AS delayed_orders
FROM purchase_data
WHERE delivery_status='Delayed'
GROUP BY vendor_name
ORDER BY delayed_orders DESC;

SELECT department,
SUM(total_cost) AS department_spend
FROM purchase_data
GROUP BY department
ORDER BY department_spend DESC;

SELECT department,
SUM(total_cost) AS spend
FROM purchase_data
GROUP BY department
ORDER BY spend DESC
LIMIT 1;

SELECT product_name,
SUM(quantity) AS total_quantity
FROM purchase_data
GROUP BY product_name
ORDER BY total_quantity DESC;

SELECT month_name,
SUM(total_cost) AS monthly_spend
FROM purchase_data
GROUP BY month_name;

SELECT payment_status,
COUNT(*) AS total_orders
FROM purchase_data
GROUP BY payment_status;

SELECT SUM(total_cost) AS pending_amount
FROM purchase_data
WHERE payment_status='Pending';