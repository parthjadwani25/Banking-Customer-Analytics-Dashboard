import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import mysql.connector

df=pd.read_csv('banking-clients.csv')

print(20*"=","HEAD()")
print(df.head())
 
print(20*"=","SHAPE")
print(df.shape)

print(20*"=","DTYPE")
print(df.dtypes)

print(20*"=","DESCRIBE-statistcs")
print(df.describe())

print(20*"=","COLUMN_NAMES")
print(df.columns)

print(20*"=","INFO")
print(df.info())


print(20*"=","DESCRIBE=ALL")
print(df.describe(include="all"))


print(20*"=","size")
print(df.size)

print(20*"=","ndim")
print(df.ndim)
print(20*"=")  
print(20*"=")
print(20*"=")


print("MAKING INCOME BAND")

bins = [0, 100000, 300000, float('inf')]

labels = [
    'Low',
    'Middle',
    'High'
]

df['Income Band'] = pd.cut(
    df['Estimated Income'],
    bins=bins,
    labels=labels
)

# count=df["Income Band"].value_counts()
# ax=count.plot(kind="bar")
# ax.bar_label(ax.containers[0], padding=3)
# plt.title("Income Distribution")
# plt.xlabel("Income Band")
# plt.ylabel("Number of Customers")
# plt.show()

categorical_cols = ["BRId", "GenderId", "IAId", "Amount of Credit Cards", 
                    "Nationality", "Occupation", "Fee Structure", "Loyalty Classification","Risk Weighting","Income Band"]

for col in categorical_cols:
    print(f"\nValue Counts for '{col}':")
    print(df[col].value_counts())
    print("-" * 40)


# for i, predictor in enumerate (df[["BRId", "GenderId", "IAId", "Amount of Credit Cards", 
#                     "Nationality", "Occupation", "Fee Structure", "Loyalty Classification","Risk Weighting","Income Band"]]):
#     plt.figure(i)
#     sns.countplot(data=df, x=predictor, hue='GenderId')
#     plt.title(f"Countplot of {predictor}")
#     plt.xticks(rotation=45)
#     plt.show()


print("Null Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())
numerical_cols = ['Age', 'Estimated Income', 'Superannuation Savings', 
                  'Credit Card Balance', 'Bank Loans', 'Bank Deposits',
                  'Checking Accounts', 'Saving Accounts', 
                  'Foreign Currency Account', 'Business Lending', 'Properties Owned']

print(df[numerical_cols].describe())

# heatmap
plt.figure(figsize=(12,8))
sns.heatmap(df[numerical_cols].corr(), annot=True, cmap='coolwarm')
plt.title("Correlation Heatmap")
plt.show()


# 1. Average Estimated Income by Gender
print(df.groupby('GenderId')['Estimated Income'].mean())

# 2. Average Credit Card Balance by Income Band
print(df.groupby('Income Band')['Credit Card Balance'].mean())

# 3. Risk Weighting vs Income Band
print(pd.crosstab(df['Income Band'], df['Risk Weighting']))

# 4. Loyalty Classification vs Fee Structure
print(pd.crosstab(df['Loyalty Classification'], df['Fee Structure']))
  

# Income Band Distribution
sns.countplot(data=df, x='Income Band', palette='Set2')
plt.title("Customer Distribution by Income Band")
plt.show()

# Risk Weighting Distribution
sns.countplot(data=df, x='Risk Weighting', palette='viridis')
plt.title("Risk Weighting Distribution")
plt.show()

# Gender vs Loyalty
sns.countplot(data=df, x='Loyalty Classification', hue='GenderId')
plt.title("Loyalty Classification by Gender")
plt.show()