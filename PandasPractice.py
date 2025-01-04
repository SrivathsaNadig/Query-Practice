import pandas as pd
import matplotlib.pyplot as plt


xl_location=r"D:\Skills\Merch Shop Sales 1.csv"
df=pd.read_csv(xl_location)
#print(df.columns)
'''
What are the top three products in terms of total sales revenue? Can you provide a breakdown of their sales figures?'''
top_products =df.groupby('Product Name')['Total Sales'].sum().nlargest(3)
print (top_products)


'''Can you identify which city has the highest number of orders? What does
this tell us about our customer base in that location?'''

top_cities=df.groupby('City')['Order ID'].value_counts()
print(top_cities)


'''How do the average ratings differ across product categories (e.g., Figurines,
Anime, Music)? 
Are there any categories that consistently receive higher ratings?'''
category_rate=df.groupby('Category')['Rating'].mean()
print(category_rate)


'''Is there any correlation between delivery time and customer ratings? How
does delivery time affect customer satisfaction?'''
ct=df['Delivery Time (Days)'].corr(df['Rating'])
print(ct)


'''What is the overall return rate for the dataset? Are there specific products
or categories that have a higher return rate?'''
print(df['Return Rate (%)'].mean())
print(df.groupby('Sales Channel')['Total Sales'].sum().nlargest(1))

'''Can you segment customers based on their purchase behavior? For example, 
can you identify high-value customers versus occasional buyers?'''
print(df.groupby('Customer Name')['Total Sales'].sum().sort_values(ascending=False))
