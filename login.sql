-- Create schema
CREATE DATABASE IF NOT EXISTS flight_db;
USE flight_db;

-- Airline
CREATE TABLE Airline (
    AirlineID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100)
);

-- Airport
CREATE TABLE Airport (
    AirportID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Aircraft
CREATE TABLE Aircraft (
    AircraftID VARCHAR(10) PRIMARY KEY,
    AirlineID VARCHAR(10),
    Model VARCHAR(100),
    Capacity INT,
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID)
);

-- Flight
CREATE TABLE Flight (
    FlightID VARCHAR(10) PRIMARY KEY,
    AirlineID VARCHAR(10),
    AircraftID VARCHAR(10),
    DepartureAirportID VARCHAR(10),
    ArrivalAirportID VARCHAR(10),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID),
    FOREIGN KEY (DepartureAirportID) REFERENCES Airport(AirportID),
    FOREIGN KEY (ArrivalAirportID) REFERENCES Airport(AirportID)
);

-- FlightDays
CREATE TABLE FlightDays (
    FlightID VARCHAR(10),
    DayOfWeek VARCHAR(10),
    PRIMARY KEY (FlightID, DayOfWeek),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    CHECK (DayOfWeek IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
);

-- Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Phone VARCHAR(20),
    PortfolioDetails TEXT
);

-- Ticket
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    CustomerID INT,
    BookingFee DECIMAL(10,2),
    TotalFare DECIMAL(10,2),
    DateTimePurchased DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- TicketFlight (Weak Entity)
CREATE TABLE TicketFlight (
    TicketID INT,
    FlightID VARCHAR(10),
    SeatNumber VARCHAR(10),
    Class VARCHAR(20),
    PRIMARY KEY (TicketID, FlightID),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    CHECK (Class IN ('Economy', 'Business', 'First'))
);

-- FlightWaitingList
CREATE TABLE FlightWaitingList (
    WaitID INT PRIMARY KEY,
    CustomerID INT,
    FlightID VARCHAR(10),
    Timestamp DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- FlightHistory
CREATE TABLE FlightHistory (
    HistoryID INT PRIMARY KEY,
    CustomerID INT,
    FlightID VARCHAR(10),
    DateTimeFlown DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- Admin
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100)
);

-- CustomerRep
CREATE TABLE CustomerRep (
    RepID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(100)
);

-- Question
CREATE TABLE Question (
    QuestionID INT PRIMARY KEY,
    CustomerID INT,
    RepID INT,
    QuestionText TEXT,
    AnswerText TEXT,
    Timestamp DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RepID) REFERENCES CustomerRep(RepID)
);

-- Dummy users
INSERT INTO Customer (CustomerID, Name, Email, Password, Phone, PortfolioDetails)
VALUES (1, 'John Doe', 'johnDoe', 'customerPass', '1234567890', 'None');

INSERT INTO Admin (AdminID, Name, Email, Password)
VALUES (1, 'Admin Person', 'admin@example.com', 'adminpass');

INSERT INTO CustomerRep (RepID, Name, Email, Password)
VALUES (1, 'Rep Smith', 'rep@example.com', 'repPass');
