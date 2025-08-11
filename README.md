#  Smartphone Sales Analytics — India Market

## Overview
This project provides an **end-to-end SQL-based analytics solution** for analyzing smartphone sales across India, covering both **offline** and **online** channels.  
It replicates the type of sales intelligence work done by analytics teams in consumer electronics companies and market research firms, with a focus on **pricing analysis, customer segmentation, channel performance, and promotion effectiveness**.

---

## Objectives
- **Design a relational database schema** to integrate customer, product, and sales data.  
- **Perform data cleaning** (currency symbol removal, price type conversion) for accurate calculations.  
- **Use advanced SQL** (CTEs, window functions, ranking, conditional aggregation) to:
  - Track KPIs such as **total revenue (₹)**, **total units sold**, and **average selling price (ASP)**.  
  - Identify **top-selling smartphone models** and their most common specifications.  
  - Segment customers by **age group, gender, region, and income bracket**.  
  - Analyze **channel performance** (offline vs. online).  
  - Evaluate **promotion effectiveness** per region.  

---

## Dataset Summary
The project uses three integrated datasets:

| Dataset       | Description                                                    | Rows   | Key Columns |
|---------------|----------------------------------------------------------------|--------|-------------|
| **Customers** | Customer demographics: gender, age, region, and income bracket | 25,500 | `customer_id`, `gender`, `age`, `region`, `income_bracket` |
| **Smartphones** | Product catalog with technical specifications and price in ₹  | 1,020  | `product_id`, `model`, `price` (₹), `ram`, `processor`, `camera`, `battery`, `display`, `os` |
| **Sales**     | Sales transactions for both offline and online channels        | 25,499 | `sale_id`, `product_id`, `customer_id`, `units_sold`, `price` (₹), `region`, `channel`, `promotion_type` |

**Geographic Scope:** Sales from across multiple regions in India  
**Channels:** Offline (retail outlets) & Online (e-commerce platforms)  

---

## Data Preparation
- **Currency & Type Conversion:** Removed the "₹" symbol and commas from price values; converted `price` from `TEXT` to `INTEGER` for accurate numeric analysis.  
- **Price Segmentation:** Classified products into:  
  - Low: < ₹15,000  
  - Mid: ₹15,000 – ₹50,000  
  - High: > ₹50,000  
- **Age Grouping:** Created custom age buckets (00–17, 18–25, 26–35, 36–45, 46–55, 56–65, 66+).  
- **Handling Missing Data:** Filled missing promotions with `"None"` for clear aggregation.  
- **Data Integration:** Joined customer, product, and sales datasets via foreign key relationships to create a unified analysis layer.  

---

## SQL Techniques Used
- **Common Table Expressions (CTEs)** for step-by-step query building and clarity.  
- **Window Functions** (`ROW_NUMBER`, `DENSE_RANK`) for ranking top products and promotions.  
- **CASE Statements** for price and age segmentation.  
- **Conditional Aggregation** to calculate premium device share by demographic.  
- **Data Unpivoting** to extract the most common product specs among top sellers.  
- **JOINs** (INNER, LEFT) for multi-table integration.  

---

## Key Insights

### 1. Sales Performance
- **Total Units Sold:** 31,800  
- **Total Revenue:** ₹935,47,80,39  
- High-tier smartphones (> ₹50,000) generated a large share of total revenue despite fewer units sold.  

### 2. Customer Demographics
- High-income groups accounted for the highest premium phone purchases.  
- **26–35 age group** was the most active buyer segment.  
- Male customers purchased slightly more units overall than female customers.  

### 3. Product Trends
- Mid-priced smartphones (₹15,000 – ₹50,000) dominated unit sales, driven by strong value-for-money positioning.  
- **Spec “fingerprint”** analysis showed 8GB RAM, Snapdragon processors, and large battery capacity as common features in top models.  

### 4. Channel Analysis
- Online sales channels had higher total units sold compared to offline.  
- Regional preferences differed — some regions leaned towards offline retail.  

### 5. Promotion Effectiveness
- Certain promotions achieved concentrated success in specific regions.  
- Seasonal campaigns boosted sales volume in the mid-price segment.  

---

## Example Business Questions Solved
- What percentage of sales in the high-income group come from premium devices (≥ ₹50,000)?  
- Who buys each top-selling model — and which gender/income bracket dominates?  
- What are the top 3 smartphone models for each gender?  
- Which specifications dominate the best-selling smartphones?  
- Which promotion type is most effective in each region?  
- How do sales compare between offline and online channels?  

---

## KPIs Calculated
- **Volume Metrics:** Total units sold, units per customer, units by segment.  
- **Revenue Metrics:** Total revenue (₹), ASP (Average Selling Price in ₹), revenue share by segment.  
- **Customer Metrics:** Units & revenue (₹) by gender, income bracket, age group, region.  
- **Product Metrics:** Top-N models by units & revenue (₹), spec fingerprint.  
- **Channel & Promo Metrics:** Units & revenue (₹) by channel, promotion effectiveness.  

---

## Tools & Skills
- **Database:** PostgreSQL  
- **Techniques:** Data cleaning, type casting, segmentation, ranking, unpivoting  
- **Business Analysis:** Pricing strategy, promotion ROI, market segmentation  

---

## Impact
By replicating realistic smartphone sales analytics for the Indian market, this project demonstrates:  
- **Data engineering skills** to structure and clean raw datasets.  
- **Advanced SQL querying** to answer targeted business questions.  
- **Insight generation** that informs product, marketing, and channel strategies.  
- The ability to bridge technical SQL outputs with **business storytelling**.  
