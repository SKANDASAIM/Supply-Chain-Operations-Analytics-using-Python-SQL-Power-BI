#View Data
SELECT * FROM supply_chain;

#Total Orders
SELECT COUNT(Order_ID) AS Total_Orders
FROM supply_chain;

#Total Quantity Ordered
SELECT SUM(Quantity) AS Total_Quantity
FROM supply_chain;

#Average Shipping Cost
SELECT AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM supply_chain;

#Top Products by Quantity
SELECT Product,
       SUM(Quantity) AS Total_Sold
FROM supply_chain
GROUP BY Product
ORDER BY Total_Sold DESC;

# Supplier Performance
SELECT Supplier,
       COUNT(Order_ID) AS Total_Orders
FROM supply_chain
GROUP BY Supplier
ORDER BY Total_Orders DESC;

# Warehouse Performance
SELECT Warehouse,
       COUNT(Order_ID) AS Total_Orders,
       AVG(Shipping_Cost) AS Avg_Cost
FROM supply_chain
GROUP BY Warehouse;

# Delayed Orders
SELECT *
FROM supply_chain
WHERE Order_Status = 'Delayed';

# Delay Percentage
SELECT 
    ROUND(
        (COUNT(CASE WHEN Order_Status = 'Delayed' THEN 1 END) * 100.0)
        / COUNT(*),
        2
    ) AS Delay_Percentage
FROM supply_chain;

# Delivery Time Analysis
SELECT Order_ID,
       DATEDIFF(Delivery_Date, Order_Date) AS Delivery_Days
FROM supply_chain;

# Average Delivery Time
SELECT AVG(DATEDIFF(Delivery_Date, Order_Date))
       AS Avg_Delivery_Days
FROM supply_chain;

# Low Stock Products
SELECT Product,
       Stock_Level
FROM supply_chain
WHERE Stock_Level < 50
ORDER BY Stock_Level;

# Out of Stock Products
SELECT Product
FROM supply_chain
WHERE Stock_Level = 0;

# Inventory by Product
SELECT Product,
       SUM(Stock_Level) AS Total_Stock
FROM supply_chain
GROUP BY Product
ORDER BY Total_Stock DESC;

# Monthly Orders Trend
SELECT MONTH(Order_Date) AS Month_Number,
       COUNT(Order_ID) AS Total_Orders
FROM supply_chain
GROUP BY MONTH(Order_Date)
ORDER BY Month_Number;

# Shipping Cost by Supplier
SELECT Supplier,
       AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM supply_chain
GROUP BY Supplier
ORDER BY Avg_Shipping_Cost DESC;

# Order Accuracy KPI
SELECT 
    ROUND(
        (SUM(Order_Accuracy) * 100.0)
        / COUNT(*),
        2
    ) AS Accuracy_Percentage
FROM supply_chain;

# Region-wise Orders
SELECT Customer_Region,
       COUNT(Order_ID) AS Total_Orders
FROM supply_chain
GROUP BY Customer_Region
ORDER BY Total_Orders DESC;

# Most Expensive Shipments
SELECT *
FROM supply_chain
ORDER BY Shipping_Cost DESC
LIMIT 10;

# Best Performing Warehouse
SELECT Warehouse,
       AVG(DATEDIFF(Delivery_Date, Order_Date))
       AS Avg_Delivery_Time
FROM supply_chain
GROUP BY Warehouse
ORDER BY Avg_Delivery_Time;

# Supplier Delay Analysis
SELECT Supplier,
       COUNT(CASE WHEN Order_Status = 'Delayed' THEN 1 END)
       AS Delayed_Orders
FROM supply_chain
GROUP BY Supplier
ORDER BY Delayed_Orders DESC;

# Inventory Turnover Analysis
SELECT Product,
       SUM(Quantity) / AVG(Stock_Level)
       AS Inventory_Turnover
FROM supply_chain
GROUP BY Product;