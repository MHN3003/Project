
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

# Load the CSV file
file_path = 'product_info.csv'
df = pd.read_csv(file_path)

# Fill missing values
fill_values = {'loves_count': 380, 'rating': 4, 'reviews':30}
df.fillna(fill_values, inplace=True)

# Remove duplicate rows
df.drop_duplicates(inplace=True)

# Check for duplicate rows
duplicates = df.duplicated()
print("Duplicate rows found:")
print(df[duplicates])

# Select numerical features for clustering
features = ['loves_count', 'rating','reviews','price_usd']

# Check for missing values in selected columns
missing_values = df[features].isnull().sum()
print("Missing values found:")
print(missing_values)

# Standardize the features
X = df[features]
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Apply K-means algorithm
k = 5  # Number of clusters
kmeans = KMeans(n_clusters=k, random_state=42)
labels = kmeans.fit_predict(X_scaled)
centroids = kmeans.cluster_centers_

# Add the cluster labels to the original dataframe
df['cluster'] = labels

# Plotting the clusters
plt.scatter(X_scaled[:, 0], X_scaled[:, 1], c=labels, cmap='viridis')
plt.scatter(centroids[:, 0], centroids[:, 1], s=300, c='red', marker='X')
plt.xlabel('Loves Count (standardized)')
plt.ylabel('Rating (standardized)')
plt.title('K-means Clustering of Products')
plt.show()

# Save the results to a new CSV file
output_file_path = 'products_with_clusters.csv'
df.to_csv(output_file_path, index=False)

# Load the CSV file (replace 'product_info.csv' with your actual file path)
file_path = 'product_info.csv'
df = pd.read_csv(file_path)

# Fill missing values (replace with your desired values)
fill_values = {'loves_count': 380, 'rating': 4, 'reviews':30}
df.fillna(fill_values, inplace=True)

# Remove duplicate rows
df.drop_duplicates(inplace=True)

# Check for duplicate rows (optional)
duplicates = df.duplicated()
print("Duplicate rows found:")
print(df[duplicates])

# Select numerical features for clustering
features = ['loves_count', 'rating','reviews','price_usd']

# Check for missing values in selected columns (optional)
missing_values = df[features].isnull().sum()
print("Missing values found:")
print(missing_values)

# Standardize the features (optional for correlation analysis)
X = df[features]
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Calculate correlation between rating and loves_count (optional)
correlation = df['loves_count'].corr(df['rating'])

# K-means clustering (keep this section if you want to perform clustering)
# ... (rest of your k-means clustering code using X_scaled)

# Prepare the scatter plot for rating vs. loves_count
plt.scatter(df['rating'], df['loves_count'])
plt.xlabel('Rating')
plt.ylabel('Loves Count')
plt.title('Sample Rating vs. Loves Count')

# Add correlation coefficient to plot (optional)
plt.annotate(f"Correlation: {correlation:.2f}", xy=(0.7, 0.7), xycoords='axes fraction')

plt.show()

