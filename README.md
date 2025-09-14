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
