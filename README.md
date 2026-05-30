The project aims to showcase data analysis skills using MySQL to analyze a pizza restaurant's sales dataset

It involves transforming raw transactional data into actionable insights to help a business understand its revenue drivers, customer preferences, and operational efficiency

1. Data Architecture & Engineering
The project utilizes a relational database named pizza_hut, consisting of four primary tables imported from CSV files
pizzas: Contains pizza IDs, sizes, and prices
pizza_types: Includes pizza names, categories (Classic, Veggie, Supreme, Chicken), and ingredients
orders: Records transactional data including Order ID, Date, and Time
order_details: A bridge table containing Order ID, Pizza ID, and Quantity
Technical Achievement: For larger datasets (e.g., the orders table with 21,350 records), the project demonstrates manual table schema definition to ensure data integrity for dates and times during the import process
2. Analytical Levels & Key Findings
A. Basic Analysis (Sales Volume & Pricing)
Total Order Volume: The restaurant processed 21,350 total orders
Revenue Generation: The total revenue calculated from all sales was $817,860.05
Product Pricing: The Greek Pizza was identified as the highest-priced item in the inventory
B. Intermediate Analysis (Trends & Preferences)
Customer Preferences: The Large (L) size is the most frequently ordered pizza size
Top Sellers: The top 5 most ordered pizzas by quantity include the Classic Deluxe, Barbecue Chicken, and Hawaiian pizzas
Operational Peak Times: Analysis of hourly order distribution revealed peak hours between 12:00 PM – 1:00 PM and 4:00 PM – 7:00 PM, identifying the busiest times for staffing and kitchen operations
Daily Average: On average, the restaurant sells 138 pizzas per day
C. Advanced Analysis (Strategic Insights)
Revenue Contribution: The Classic pizza category is the primary revenue driver, contributing 26.91% of total sales
Top Revenue Performers: While the Classic Deluxe has high volume, the Thai Chicken Pizza was identified as the #1 revenue generator
Growth Tracking: Implemented Window Functions to calculate cumulative revenue over time, allowing the business to monitor sales growth trajectories
Categorical Rankings: Used RANK() and subqueries to identify the top 3 most profitable pizzas within every individual category
3. Business Value & Implementation
The analysis provides critical business intelligence for several restaurant functions:
Marketing: Highlights high-revenue pizzas like Thai Chicken for promotional focus
Inventory: Identifies that Large sizes and Classic categories require the most stock
.
Staffing: Uses hourly trends to optimize shift scheduling during the 12 PM and 5 PM rushes
.
4. Portfolio Presentation
To conclude the project, the analysis results are transformed into a professional presentation (PDF) using Canva and shared on GitHub and LinkedIn
. This demonstrates the ability to not only perform technical SQL queries but also to communicate complex data findings to stakeholders effectively
.
