-- Library Management System
-- Database: PostgreSQL
-- File: 01_create_tables.sql
-- Description: Creates the database tables and their relationships.





-- Stores library members and their membership details
CREATE TABLE members(
member_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
member_name VARCHAR(100) NOT NULL ,
email VARCHAR(150) UNIQUE NOT NULL CHECK (email like '%_@_%._%') ,
phone VARCHAR(10) UNIQUE NOT NULL CHECK (phone ~ '^05[0-9]{8}$') ,
join_date DATE DEFAULT CURRENT_DATE NOT NULL ,
membership_type VARCHAR(50) NOT NULL DEFAULT 'Regular' CHECK(membership_type IN('Regular' ,'Premium' , 'VIP'))
);





-- Stores library employees and their job information
CREATE TABLE employees(
employee_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
employee_name VARCHAR(100) NOT NULL , 
job_position VARCHAR(50) NOT NULL CHECK(job_position IN('Librarian' , 'Assistant' , 'Manager')) ,
salary DECIMAL(10,2) NOT NULL CHECK(salary >= 0),
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);





-- Stores book categories
CREATE TABLE categories(
category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
category_name VARCHAR(50) NOT NULL UNIQUE
);





-- Stores book details and availability status
CREATE TABLE books(
book_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
title VARCHAR(150) NOT NULL , 
author VARCHAR(100) NOT NULL ,
genre VARCHAR(50) NOT NULL ,
Published_year INT NOT NULL CHECK(published_year > 0 ), 
status VARCHAR(50) NOT NULL DEFAULT 'Available' CHECK(status IN('Available','Borrowed')) ,


category_id INT NOT NULL ,
FOREIGN KEY (category_id) REFERENCES categories(category_id)

);





-- Tracks book loans, due dates and returns
CREATE TABLE loans(
loan_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
loan_date DATE NOT NULL DEFAULT CURRENT_DATE ,
due_date DATE NOT NULL ,
return_date DATE ,

book_id INT NOT NULL ,
member_id INT NOT NULL ,
FOREIGN KEY (book_id) REFERENCES books(book_id) ,
FOREIGN KEY (member_id) REFERENCES members(member_id)
);





-- Records payments associated with book loans
CREATE TABLE payments(
payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
amount DECIMAL(10,2) NOT NULL CHECK(amount >= 0),
payment_method VARCHAR(50) NOT NULL CHECK(payment_method IN('Credit Card','Cash')),

loan_id INT NOT NULL,
FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);





-- Records fines associated with book loans
CREATE TABLE fines(
fine_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
fine_amount DECIMAL(10,2) NOT NULL CHECK(fine_amount > 0),
fine_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

loan_id INT NOT NULL ,
FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);








-- Stores the history of completed book leans
CREATE TABLE loan_history(
history_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
loan_date DATE NOT NULL  ,
return_date DATE NOT NULL,

book_id INT NOT NULL ,
member_id INT NOT NULL ,
FOREIGN KEY(book_id) REFERENCES books(book_id),
FOREIGN KEY(member_id) REFERENCES members(member_id)
);



















