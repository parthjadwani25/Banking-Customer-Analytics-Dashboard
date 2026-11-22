# Banking Customer Analytics Dashboard

### End-to-End Banking Analytics Project using Power BI | MySQL | Python

![Project Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Tools](https://img.shields.io/badge/Tools-Power%20BI%20%7C%20MySQL%20%7C%20Python-blue)
![Dataset](https://img.shields.io/badge/Dataset-3000%20Customers-orange)

---

## Project Overview

This project is a complete **Banking Customer Analytics** solution that analyzes 3,000 customer records to uncover insights related to income segments, risk profiles, loyalty behavior, deposits, loans, and overall customer value.

The solution combines:
- **Python** for Exploratory Data Analysis (EDA)
- **MySQL** for advanced business queries
- **Power BI** for interactive dashboards and KPI monitoring

---

## Author

**Parth Jadwani**

---

## Tools & Technologies

| Tool          | Purpose                              |
|---------------|--------------------------------------|
| **Power BI**  | Interactive Dashboard & Visualizations |
| **MySQL**     | Business Analysis & Complex Queries  |
| **Python**    | EDA, Data Cleaning & Statistical Analysis |
| **Pandas**    | Data Manipulation                    |
| **Seaborn / Matplotlib** | Data Visualization          |

---

## Dataset Information

- **File**: `banking-clients.csv`
- **Records**: 3,000 customers
- **Attributes**: 25 columns
- **Data Quality**: No null values, No duplicate rows

### Key Columns
- Demographics: Age, Gender, Nationality, Occupation
- Financial: Estimated Income, Bank Deposits, Bank Loans, Credit Card Balance, Business Lending
- Behavioral: Risk Weighting, Loyalty Classification, Fee Structure
- Derived: Income Band (Low / Middle / High)

---

## Project Structure

```
Banking-Customer-Analytics-Dashboard/
│
├── README.md
├── Project_Report.pdf
├── .gitignore
│
├── Dataset/
│   └── banking-clients.csv
│
├── SQL/
│   └── banking_analysis_queries.sql
│
├── Python/
│   ├── main.py
│   └── eda.py
│
├── Screenshots/
│   ├── 01_Home_Page.png
│   ├── 02_Loan_Analysis.png
│   ├── 03_Deposit_Analysis.png
│   ├── 04_Summary_Page.png
│   └── 05_Correlation_Heatmap.png
│
└── PowerBI/
    └── Banking_Dashboard.pbix
```

---

## Power BI Dashboard

The dashboard consists of **4 main pages**:

### 1. Home Page
- Professional landing page with bank-themed design
- Navigation to other analysis pages
- High-level KPI cards

### 2. Loan Analysis
- Total Loan, Bank Loan, Business Lending, Credit Card Balance
- Loan distribution by Banking Relationship, Nationality, Occupation
- Loan by Income Band (Donut Chart)

### 3. Deposit Analysis
- Total Deposit, Bank Deposit, Saving & Checking Account amounts
- Deposit analysis by BR, Nationality, Occupation & Income Band

### 4. Summary Page
- Consolidated view of all major metrics
- Interactive filters: Year, Month, Gender, Banking Relationship, Investment Advisor

---

## Key Insights

### Customer Segmentation
- **Middle Income** customers form the largest segment (**50.6%**)
- High Income customers are only **15.2%** but highly valuable

### Risk Profile
- Majority of customers fall under **Risk 1 & Risk 2** (healthy portfolio)
- High Income customers show higher concentration in Risk 3, 4 & 5

### Strong Correlations
| Relationship                        | Correlation |
|-------------------------------------|-------------|
| Bank Deposits ↔ Checking Accounts   | **0.84**    |
| Bank Deposits ↔ Saving Accounts     | **0.75**    |
| Bank Loans ↔ Business Lending       | **0.42**    |

### Other Findings
- Average Credit Card Balance increases with Income Band
- Jade is the most popular Loyalty tier
- Gender distribution across loyalty programs is balanced
- European customers form the largest nationality group

---

## SQL Analysis (8 Business Queries)

1. **Income Band + Risk Weighting Analysis**
2. **Most Valuable Customer Segments** (Income + Loyalty)
3. **Gender + Income Band Analysis**
4. **Nationality-wise Performance**
5. **Top Occupations by Income & Lending**
6. **Loyalty Classification vs Fee Structure**
7. **High Income + High Risk Customers** (Actionable List)
8. **Properties Owned Impact Analysis**

---

## Business Recommendations

1. **Focus on High-Income Segment** – Launch premium products and wealth management services
2. **Enhanced Risk Monitoring** – Special attention to High Income + High Risk customers
3. **Deposit Cross-Selling** – Bundle deposit products to increase customer stickiness
4. **Loyalty Program Optimization** – Create clear upgrade paths from Jade to higher tiers
5. **Occupation-Based Targeting** – Design products for high-income professional groups
6. **Geographic Strategy** – Prioritize European and Asian customer segments

---

## How to Run the Project

### 1. Python EDA
```bash
pip install pandas numpy matplotlib seaborn mysql-connector-python
python Python/eda.py
```

### 2. MySQL Queries
- Create database `banking_case`
- Import the dataset into table `customer`
- Run queries from `SQL/banking_analysis_queries.sql`

### 3. Power BI Dashboard
- Open `PowerBI/Banking_Dashboard.pbix`
- Connect to the data source
- Interact with slicers and visuals

---

## Project Report

A detailed project report is available:  
**[Download Project Report (PDF)](Project_Report.pdf)**

---

## Future Scope

- Customer Churn Prediction using Machine Learning
- Credit Risk Scoring Model
- Real-time dashboard with live data
- Customer Lifetime Value (CLV) analysis
- Personalized product recommendation engine

---

## License

This project is created for educational and portfolio purposes.

---

**Developed by Parth Jadwani**  
*Banking Customer Analytics Dashboard | Power BI + MySQL + Python*
