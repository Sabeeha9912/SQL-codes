USE CLASS_DATABASE;

-- 1. UPDATE USER TABLE STRUCTURE
-- We use a slightly different approach to ensure 'Country' exists without erroring
SET @dbname = DATABASE();
SET @tablename = "Users";
SET @columnname = "Country";
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = @columnname) > 0,
  "SELECT 1",
  "ALTER TABLE Users ADD COLUMN Country VARCHAR(50) DEFAULT 'USA'"
));
PREPARE stmt FROM @preparedStatement;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 2. UPDATE THE COUNTRY CONSTRAINT
-- We drop the old one (if it exists) and add the new one to allow 'India'
-- If the DROP fails because it doesn't exist, the script continues to the ADD
ALTER TABLE Users DROP CONSTRAINT IF EXISTS CHK_MerchantCountry;
ALTER TABLE Users ADD CONSTRAINT CHK_MerchantCountry CHECK (Country IN ('USA', 'Canada', 'UK', 'India'));

-- 3. INSERT DUMMY DATA
-- Using 'INSERT IGNORE' to avoid errors if you run this script twice
INSERT IGNORE INTO Categories (CategoryID, CategoryName) VALUES (1, 'Electronics');

INSERT IGNORE INTO Products (ProductID, ProductName, Price, StockQuantity, CategoryID) 
VALUES (10, 'Smartphone', 500.00, 50, 1);

INSERT IGNORE INTO Users (UserID, Username, Email, Country) 
VALUES (100, 'jdoe', 'john@test.com', 'USA'),
       (201, 'india_merchant', 'sales@india.in', 'India');

INSERT IGNORE INTO Orders (OrderID, UserID) VALUES (500, 100);

-- FIXED: Added the missing 3rd value (Quantity) to match the column count
INSERT IGNORE INTO OrderDetails (OrderID, ProductID, Quantity) 
VALUES (500, 10, 5);

-- 4. FINAL VERIFICATION
-- Check Indian Merchants
SELECT UserID, Username, Country FROM Users WHERE Country = 'India';

-- Check Stock Reduction (Should be 45 if trigger is active)
SELECT ProductName, StockQuantity FROM Products WHERE ProductID = 10;