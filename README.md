🚕 Uber Ride Database SQL Project

A complete SQL project simulating an Uber-style ride booking system.
This project demonstrates database creation, data import from CSV, and SQL queries to analyze rides, customers, drivers, payments, and cancellations.

📊 Project Overview

This project answers key business questions for a ride-hailing platform using SQL queries. It includes:

- Managing Rides, Customers, Drivers, and Payments data
- Importing data from CSV into PostgreSQL
- Writing queries to analyze:
- Ride volumes and booking status
- Top pickup hubs and customer trends
- Cancellation patterns (customer vs. driver)
- Revenue and booking value insights
- Driver and customer performance ratings
- The project showcases SQL fundamentals such as joins, aggregations, GROUP BY, HAVING, ranking, and window functions to replicate real-world business analytics.

🗂️ Dataset Structure

| Column                                    | Description                         |
| ----------------------------------------- | ----------------------------------- |
| **Date, Time**                            | Booking date and time               |
| **Booking\_ID**                           | Unique ride identifier              |
| **Booking\_Status**                       | Completed, Cancelled, Incomplete    |
| **Customer\_ID**                          | Unique customer reference           |
| **Vehicle\_Type**                         | Car, Bike, Auto, etc.               |
| **Pickup\_Location, Drop\_Location**      | Ride start and end points           |
| **Avg\_VTAT, Avg\_CTAT**                  | Average wait & completion times     |
| **Cancelled\_Rides\_by\_Customer**        | Number of cancellations by customer |
| **Reason\_for\_Cancelling\_by\_Customer** | Customer cancellation reason        |
| **Cancelled\_Rides\_by\_Driver**          | Number of cancellations by driver   |
| **Driver\_Cancellation\_Reason**          | Driver cancellation reason          |
| **Incomplete\_Rides**                     | Unfinished rides                    |
| **Booking\_Value**                        | Ride cost                           |
| **Ride\_Distance**                        | Distance traveled (km)              |
| **Driver\_Ratings, Customer\_Rating**     | Ratings given post-ride             |
| **Payment\_Method**                       | Cash, UPI, Card, Wallet             |

🧠 SQL Queries Included

| Query No. | Query Title            | Description                                  |
| --------- | ---------------------- | -------------------------------------------- |
| 1         | First 10 Rows          | Display sample ride records                  |
| 2         | Total Rides            | Count all rides booked                       |
| 3         | Rides by Status        | Count rides by booking status                |
| 4         | Rides by Vehicle Type  | Analyze demand by vehicle                    |
| 5         | Payment Methods        | Distinct payment modes used                  |
| 6         | Avg Ride Distance      | Calculate average ride distance              |
| 7         | Avg Booking Value      | Calculate average ride value                 |
| 8         | Total Customer Cancels | Find rides cancelled by customers            |
| 9         | Top 5 Pickup Locations | Most popular pickup points                   |
| 10        | High-Rating Rides      | Completed rides with rating ≥ 4.5            |
| 11        | Top Drivers            | Best-rated drivers with 50+ rides            |
| 12        | Highest Revenue Day    | Day with max total booking value             |
| 13        | Cancellation %         | Compare customer vs driver cancellations     |
| 14        | Payment Insights       | Avg distance & value per payment method      |
| 15        | Revenue by Location    | Rank pickup locations by revenue             |
| 16        | Low-Rating Customers   | Customers never cancelling but <3 rating     |
| 17        | Premium Vehicles       | Vehicle type with highest avg value (>10 km) |
| 18        | Driver Performance     | Completed vs cancelled rides per driver      |
| 19        | Monthly Trends         | Monthly completed rides trend                |
| 20        | Top Customers          | Top 5 customers by total spend               |

🧰 Tech Stack

Database: PostgreSQL (v15+)
Tool: pgAdmin
Data Source: CSV file (ncr_ride_bookings.csv)
Editor: VS Code + PostgreSQL extension

📈 Project Flow

```Uber_Ride_Database/
├── csv_files/
│   ├── ncr_ride_bookings.csv
├── sql_load/
│   ├── create_table.sql (CREATE TABLE + schema)
│   ├── import_data.sql (COPY command for CSV load)
├── queries/
│   ├── basic_queries.sql (counts, averages, cancellations, etc.)
│   ├── advanced_queries.sql (driver ratings, monthly trends, revenue analysis)
├── uber_ride_database.sql
├── README.md

