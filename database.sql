-- Database Schema for Retail/Wholesale Management System

-- Location Table
CREATE TABLE Location (
    location_id INT PRIMARY KEY NOT NULL,
    state VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    pin_code int NOT NULL,
    village_area VARCHAR(100)
);

-- Item Table
CREATE TABLE Item (
    item_id INT PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Shop Table
CREATE TABLE Shop (
    shop_id INT PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL unique,
    location_id INT NOT NULL,

    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Wholesaler Details Table
CREATE TABLE Wholesaler_Details (
    wholesaler_id INT PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL,
    shop_id INT,
    contact int,
    location_id INT NOT NULL,
    img_url varchar(500),

    FOREIGN KEY (shop_id) REFERENCES Shop(shop_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Retailer Details Table
CREATE TABLE Retailer_Details (
    retailer_id INT PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL,
    contact int not null,
    location_id INT NOT NULL,
    img_url varchar(500),

    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

-- Order Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY not null,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    shop_id INT not null,
    total_bill DECIMAL(12, 2),
    
    FOREIGN KEY (item_id) REFERENCES Item(item_id),
    FOREIGN KEY (shop_id) REFERENCES Shop(shop_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY not null,
    retailer_id INT NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    wholesaler_id INT NOT NULL,
    date DATE NOT NULL,
    
    FOREIGN KEY (retailer_id) REFERENCES Retailer_Details(retailer_id),
    FOREIGN KEY (wholesaler_id) REFERENCES Wholesaler_Details(wholesaler_id)
);
