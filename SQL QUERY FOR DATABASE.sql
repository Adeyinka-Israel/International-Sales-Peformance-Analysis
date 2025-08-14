-- Creating Database 
CREATE SCHEMA Sales_Retails;

-- Selecting my Database
USE Sales_Retails;

-- Creating Tables for Our database

-- Creating Category Table
CREATE TABLE Category(
	Category_Id int primary key auto_increment not null,
    CategoryName varchar(200)
);

-- Creating Customer Table
CREATE TABLE Customer(
	Customer_Id int primary key auto_increment not null,
    Gender enum("Male","Female") default null,
    Name varchar(250) not null,
    City varchar(250),
    State varchar(250),
    Zipcode varchar(30),
    Country varchar(250),
    Continent varchar(250),
    Birthday varchar(20)
    )
    ;

-- Creating Product Table
CREATE TABLE Product(
	Product_Id int primary key auto_increment not null,
    Product_name varchar(250) not null,
    Brand varchar(250) default null,
    Color varchar(100) ,
    Unit_cost_usd float(10,2),
    Unit_price_usd float(10,2),
    Category_Key int,
    Sub_category_Key int,
    
    constraint Category_fk foreign key (category_key) references Category(Category_id),
    constraint Sub_category_fk foreign key (sub_category_key) references Sub_category(Sub_category_id)
);

-- Creating Sales Table
CREATE TABLE Sales(
	Id int primary key auto_increment not null,
    Line_item int,
    Order_date varchar(20),
    Customer_key int,
    Store_key int,
    Product_key int,
    Quantity int,
    Total_cost_usd float(10,2),
    Total_Amount_usd float(10,2),
    
    constraint Customer_fk foreign key (Customer_key) references Customer(Customer_Id),
    constraint Store_fk foreign key (Store_key) references Store(Store_id),
    constraint Product_fk foreign key (Product_key) references Product(Product_Id)
);

-- Creating Store Table
CREATE TABLE Store(
	Store_id int primary key auto_increment not null,
    Country varchar(200),
    State varchar(200),
    Sq_meters int,
    Open_date varchar(20)
);

-- Creating Sub-Category Table
CREATE TABLE Sub_category(
	Sub_category_id int primary key auto_increment not null,
    Sub_category varchar(200)
);

