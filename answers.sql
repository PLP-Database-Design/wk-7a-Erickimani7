# Task 1: Load and Explore the Dataset

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.datasets import load_iris

# Load dataset
try:
    iris_raw = load_iris(as_frame=True)
    df = iris_raw.frame
    print("Dataset loaded successfully!\n")
except Exception as e:
    print(f"Error loading dataset: {e}")

# Display first few rows
print("First 5 rows of the dataset:")
print(df.head(), "\n")

# Data structure and missing values
print("Dataset Info:")
print(df.info(), "\n")

print("Missing Values:")
print(df.isnull().sum(), "\n")

# Clean dataset (no missing values in Iris, but here's how you would handle it)
# df.dropna(inplace=True)  # or df.fillna(method='ffill', inplace=True)

# Task 2: Basic Data Analysis

# Basic statistics
print("Descriptive Statistics:")
print(df.describe(), "\n")

# Grouping: Mean of each measurement per species
grouped = df.groupby('target').mean()
print("Mean values grouped by species (target):")
print(grouped, "\n")

# Map target numbers to species names for readability
df['species'] = df['target'].map(dict(zip(range(3), iris_raw.target_names)))

# Identify interesting patterns (e.g., which species has longest petals?)
longest_petal_species = df.groupby('species')['petal length (cm)'].mean().idxmax()
print(f"The species with the longest average petal length is: {longest_petal_species}\n")

# Task 3: Data Visualization

# 1. Line chart: Simulate time series using index
plt.figure(figsize=(10, 4))
plt.plot(df.index, df['sepal length (cm)'], label='Sepal Length')
plt.title('Sepal Length Trend Over Index (Simulated Time)')
plt.xlabel('Index')
plt.ylabel('Sepal Length (cm)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# 2. Bar chart: Average petal length per species
plt.figure(figsize=(6, 4))
sns.barplot(x='species', y='petal length (cm)', data=df)
plt.title('Average Petal Length per Species')
plt.xlabel('Species')
plt.ylabel('Petal Length (cm)')
plt.tight_layout()
plt.show()

# 3. Histogram: Distribution of sepal width
plt.figure(figsize=(6, 4))
plt.hist(df['sepal width (cm)'], bins=15, color='skyblue', edgecolor='black')
plt.title('Distribution of Sepal Width')
plt.xlabel('Sepal Width (cm)')
plt.ylabel('Frequency')
plt.tight_layout()
plt.show()

# 4. Scatter plot: Sepal length vs petal length
plt.figure(figsize=(6, 4))
sns.scatterplot(x='sepal length (cm)', y='petal length (cm)', hue='species', data=df)
plt.title('Sepal Length vs Petal Length')
plt.xlabel('Sepal Length (cm)')
plt.ylabel('Petal Length (cm)')
plt.tight_layout()
plt.show()
