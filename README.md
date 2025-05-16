# ✈️ Airline Reservation System

A basic airline reservation web application built as a final project for **CS 336 – Database Systems** at Rutgers University, Spring 2025. Developed by Group 13.

## 🧰 Tech Stack

- **Java (Servlets & Beans)**
- **JSP & HTML/CSS**
- **MySQL**
- **Apache Tomcat**

## 🎯 Features

- 🔍 Search for one-way or round-trip flights (fixed or flexible ±3 days)
- 🗂️ Sort/filter results by price, stops, airline, departure/arrival times
- 🎫 Make flight reservations or join a waitlist if full
- 📜 View upcoming and past reservations
- ❌ Cancel eligible bookings (Business/First Class)
- 🧑‍💼 Admin and customer rep login for booking/query management

## 🔐 Login Credentials (For Testing)

| Role               | Username              | Password   |
|--------------------|------------------------|------------|
| Admin              | `admin`                | `adminPass`|
| Customer Rep       | `customerRep1`         | `repPass`  |
| Sample Customer    | `shruti@example.com`   | `testpass` |

## 🛠️ Setup Instructions

1. Import the project into Eclipse as a Dynamic Web Project.
2. Set up your MySQL database using `login.sql`.
3. Update DB connection settings in `DBConnection.java`.
4. Deploy the project on Apache Tomcat.
5. Run the app via `http://localhost:8080/your_project_name/`.

This project was created for academic purposes and is not intended for production use.
