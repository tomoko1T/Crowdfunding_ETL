# Crowdfunding ETL

Independent Funding is a crowdfunding platform for funding independent projects or ventures.  As the firm has been growing, the improvement step has been taken to move all the accessible data from one large Excel file onto a PostgreSQL database.

The purpose of this project is to create a data of the backers who have pledged to the live projects and to follow up with them to reach the fundraising goal.  The backers’ contact information was extracted from a CSV file and transformed to create a DataFrame, and it was exported as a CSV file by using Python, Pandas, and Jupyter notebooks.  At the load phase, an ERD and a table schema were created to generate a new table in the database. The CSV file that contains the backers’ information was uploaded into this table.  At the final phase of the project, a data analysis on the database by using SQL queries.
