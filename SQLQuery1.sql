use merchSales
SELECT * FROM SALES_DATA
--What are the top three products in terms of total sales revenue? 
--Can you provide a breakdown of their sales figures?

/*NOOB
select [Product Name],SUM([Total Sales]) 'Total Sales Revenue' from sales_data 
group by [Product Name],[Total Sales]
order by SUM([Total Sales]) desc;*/

WITH TotalRevenuePerProduct AS (
    SELECT 
        [Product Name],
        SUM([Total Sales]) AS 'Total Revenue' 
    FROM 
        SALES_DATA 
    GROUP BY 
        [Product Name]
)

SELECT * 
FROM (
    SELECT 
        *,
        RANK() OVER (ORDER BY [Total Revenue] DESC) AS 'rank' 
    FROM 
        TotalRevenuePerProduct
) AS RankedProducts
WHERE 
    [rank] < 4;



--Can you identify which city has the highest number of orders? 
--What does this tell us about our customer base in that location?

--NOOB
--WITH ORDERSPERCITY AS
--(SELECT CITY,COUNT([Order ID]) 'Orders' 
--FROM sales_data GROUP BY CITY)
--SELECT CITY,[ORDERS] FROM ORDERSPERCITY WHERE ORDERS in (SELECT max([Orders])
--FROM ORDERSPERCITY ) ;

WITH ORDERSPERCITY AS (
    SELECT 
        CITY,
        COUNT([Order ID]) AS 'Orders',
        RANK() OVER (ORDER BY COUNT([Order ID]) DESC) AS 'RANKING'
    FROM 
        sales_data 
    GROUP BY 
        CITY
)

SELECT 
    * 
FROM 
    ORDERSPERCITY
WHERE 
    [RANKING] = 1;


--How do the average ratings differ across product categories (e.g., Figurines, Anime, Music)? 
--Are there any categories that consistently receive higher ratings?



--NOOB
--SELECT CATEGORY, AVG(RATING)'AVERAGE RATING PER CATEGORY' 
--FROM SALES_DATA 
--GROUP BY CATEGORY ORDER BY AVG(RATING) DESC;

SELECT 
	[Supplier Name],
    Category,
    AVG(Rating) AS Average_Rating,
    COUNT(*) AS Total_Products
FROM 
    sales_data
GROUP BY 
    Category,[Supplier Name]
ORDER BY 
    Average_Rating DESC;



-- What is the overall return rate for the dataset? 
-- Are there specific products or categories that have a higher return rate?


SELECT [Supplier Name],Category,[Product Name],[Return Rate (%)],
DENSE_RANK() 
over(ORDER BY [Return Rate (%)] desc) 'rank1' FROM sales_data

SELECT Category,avg([Return Rate (%)]) Return_rate
FROM sales_data
 group by Category




 --How do sales figures compare between online and retail channels? 
 --Which channel performs better, and what might be the reasons for this?
SELECT * FROM SALES_DATA;

SELECT [Sales Channel],SUM([Total Sales]) 'SALES CONTRIBUTION'
FROM SALES_DATA
GROUP BY [Sales Channel];

SELECT [Sales Channel],AVG([Delivery Time (Days)])
FROM SALES_DATA
GROUP BY [Sales Channel];

Select [Sales Channel],count(city) 'nofocities' 
from sales_data GROUP by [Sales Channel];


--How many paid from which method?
SELECT [Payment Method],COUNT([Payment Method]) 'COUNT' 
FROM sales_data GROUP BY [Payment Method];


select [Payment Method],MAX(FREQ)
from(
	SELECT [Payment Method],
		ROW_NUMBER() OVER(PARTITION BY [Payment Method] order BY [Payment Method]) 'FREQ' 
		FROM sales_data )AS A
GROUP BY [Payment Method]



--Can you segment customers based on their purchase behavior?
--For example, can you identify high-value customers versus occasional buyers?
SELECT [Customer Name],COUNT([Order ID]) 
FROM sales_data GROUP BY [Customer Name];

SELECT [Order ID],DAY([Order Date]) 'DAY' 
FROM SALES_DATA



