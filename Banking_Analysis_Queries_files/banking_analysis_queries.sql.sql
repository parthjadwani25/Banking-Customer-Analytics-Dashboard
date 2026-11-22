-- create database banking_case;
USE banking_case;
show tables;
select * from customer;


-- =====================================================
-- 1. Income Band + Risk Weighting Analysis
-- Question: Different Income Bands mein Risk Weighting ka distribution aur average financial metrics kya hain?
-- Explanation: Ye query batati hai ki High Income customers mein high risk kitna hai aur unke deposits/loans ka average kya hai. Risk management ke liye bahut useful.
-- =====================================================
SELECT 
    CASE 
        WHEN `Estimated Income` < 100000 THEN 'Low'
        WHEN `Estimated Income` BETWEEN 100000 AND 300000 THEN 'Middle'
        ELSE 'High'
    END AS Income_Band,
    `Risk Weighting`,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Credit Card Balance`), 0) AS Avg_CC_Balance,
    ROUND(AVG(`Bank Deposits`), 0) AS Avg_Deposits,
    ROUND(AVG(`Bank Loans`), 0) AS Avg_Loans
FROM customer
GROUP BY Income_Band, `Risk Weighting`
ORDER BY Income_Band, `Risk Weighting`;


-- =====================================================
-- 2. Most Valuable Customer Segments
-- Question: Kaunsa Income Band + Loyalty Combination bank ke liye sabse valuable hai?
-- Explanation: Total deposits aur lending ke basis pe sabse profitable customer segments identify karta hai. Business strategy ke liye important.
-- =====================================================
SELECT 
    CASE 
        WHEN `Estimated Income` < 100000 THEN 'Low'
        WHEN `Estimated Income` BETWEEN 100000 AND 300000 THEN 'Middle'
        ELSE 'High'
    END AS Income_Band,
    `Loyalty Classification`,
    COUNT(*) AS Customers,
    ROUND(AVG(`Bank Deposits` + `Saving Accounts` + `Checking Accounts`), 0) AS Avg_Total_Deposits,
    ROUND(AVG(`Bank Loans` + `Business Lending`), 0) AS Avg_Total_Lending,
    ROUND(AVG(`Credit Card Balance`), 0) AS Avg_CC_Balance
FROM customer
GROUP BY Income_Band, `Loyalty Classification`
ORDER BY Avg_Total_Deposits DESC;


-- =====================================================
-- 3. Gender + Income Band Analysis
-- Question: Gender aur Income Band ke hisaab se financial behavior kaise alag hai?
-- Explanation: Gender-wise income, credit card balance, loans aur high-risk customers ka comparison karta hai.
-- =====================================================
SELECT 
    GenderId,
    CASE 
        WHEN `Estimated Income` < 100000 THEN 'Low'
        WHEN `Estimated Income` BETWEEN 100000 AND 300000 THEN 'Middle'
        ELSE 'High'
    END AS Income_Band,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Credit Card Balance`), 0) AS Avg_CC_Balance,
    ROUND(AVG(`Bank Loans`), 0) AS Avg_Loans,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN `Risk Weighting` >= 4 THEN 1 ELSE 0 END) AS High_Risk_Customers
FROM customer
GROUP BY GenderId, Income_Band
ORDER BY GenderId, Income_Band;


-- =====================================================
-- 4. Nationality-wise Performance
-- Question: Kaunsi Nationality ke customers sabse high income aur high risk wale hain?
-- Explanation: Nationality ke basis pe average income, deposits, loans aur risk level nikalta hai. Targeting ke liye useful.
-- =====================================================
SELECT 
    Nationality,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Bank Deposits`), 0) AS Avg_Deposits,
    ROUND(AVG(`Bank Loans`), 0) AS Avg_Loans,
    ROUND(AVG(`Risk Weighting`), 2) AS Avg_Risk,
    SUM(CASE WHEN `Risk Weighting` >= 4 THEN 1 ELSE 0 END) AS High_Risk_Count
FROM customer
GROUP BY Nationality
ORDER BY Avg_Income DESC;


-- =====================================================
-- 5. Top Occupations by Income & Lending
-- Question: Kaunse Occupations ke customers sabse high income aur high lending potential rakhte hain?
-- Explanation: Un occupations ko identify karta hai jahan high income + high loan potential hai (minimum 10 customers wale).
-- =====================================================
SELECT 
    Occupation,
    COUNT(*) AS Customers,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Bank Loans` + `Business Lending`), 0) AS Avg_Total_Lending,
    ROUND(AVG(`Credit Card Balance`), 0) AS Avg_CC_Balance
FROM customer
GROUP BY Occupation
HAVING COUNT(*) >= 10
ORDER BY Avg_Income DESC
LIMIT 15;


-- =====================================================
-- 6. Loyalty Classification vs Fee Structure
-- Question: Different Loyalty tiers mein Fee Structure ka distribution kaisa hai?
-- Explanation: Loyalty aur Fee Structure ke beech relationship dikhata hai. Product pricing strategy ke liye helpful.
-- =====================================================
SELECT 
    `Loyalty Classification`,
    `Fee Structure`,
    COUNT(*) AS Customers,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Bank Deposits`), 0) AS Avg_Deposits
FROM customer
GROUP BY `Loyalty Classification`, `Fee Structure`
ORDER BY `Loyalty Classification`, Customers DESC;


-- =====================================================
-- 7. High Income + High Risk Customers (Actionable List)
-- Question: Kaunse High Income customers high risk category mein aate hain?
-- Explanation: High Income + High Risk (4 ya 5) wale customers ki list nikalta hai. Ye bank ke liye monitoring ke liye important hain.
-- =====================================================

-- ALTER TABLE customer 
-- CHANGE `ï»¿Client ID` `Client ID` VARCHAR(20);
SELECT 
    `Client ID`,
    Name,
    Age,
    Nationality,
    Occupation,
    `Estimated Income`,
    `Risk Weighting`,
    `Loyalty Classification`,
    `Bank Deposits`,
    `Bank Loans`,
    `Credit Card Balance`
FROM customer
WHERE `Estimated Income` > 300000 
  AND `Risk Weighting` >= 4
ORDER BY `Estimated Income` DESC;


-- =====================================================
-- 8. Properties Owned Impact Analysis
-- Question: Properties Owned badhne se Income, Loans aur Risk kaise change hota hai?
-- Explanation: Properties Owned ke hisaab se financial behavior aur risk level ka analysis.
-- =====================================================
SELECT 
    `Properties Owned`,
    COUNT(*) AS Customers,
    ROUND(AVG(`Estimated Income`), 0) AS Avg_Income,
    ROUND(AVG(`Bank Loans`), 0) AS Avg_Loans,
    ROUND(AVG(`Bank Deposits`), 0) AS Avg_Deposits,
    ROUND(AVG(`Risk Weighting`), 2) AS Avg_Risk
FROM customer
GROUP BY `Properties Owned`
ORDER BY `Properties Owned`;