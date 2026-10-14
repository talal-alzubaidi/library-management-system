-- Library Management System
-- Database: PostgreSQL
-- File: 02_insert_data.sql
-- Description: Inserts sample data into the library tables.


-- Categories
INSERT INTO categories (category_name) VALUES
('Literature'),
('Science'),
('Technology'),
('History'),
('Business'),
('Psychology'),
('Philosophy'),
('Biography'),
('Mathematics'),
('Self-Development');


-- Members
INSERT INTO members
(member_name, email, phone, join_date, membership_type)
VALUES
('Omar Alharbi', 'omar.alharbi@example.com', '0501234501', '2024-01-15', 'Premium'),
('Khalid Alotaibi', 'khalid.alotaibi@example.com', '0501234502', '2024-02-22', 'Regular'),
('Faisal Alqahtani', 'faisal.alqahtani@example.com', '0501234503', '2024-03-08', 'VIP'),
('Abdullah Alghamdi', 'abdullah.alghamdi@example.com', '0501234504', '2024-05-19', 'Regular'),
('Mohammed Alshammari', 'mohammed.alshammari@example.com', '0501234505', '2024-07-02', 'Premium'),
('Yousef Alzahrani', 'yousef.alzahrani@example.com', '0501234506', '2024-09-11', 'Regular'),
('Ahmed Almutairi', 'ahmed.almutairi@example.com', '0501234507', '2025-01-27', 'VIP'),
('Nasser Aldossari', 'nasser.aldossari@example.com', '0501234508', '2025-03-13', 'Regular'),
('Saad Alsubaie', 'saad.alsubaie@example.com', '0501234509', '2025-06-05', 'Premium'),
('Ibrahim Alenezi', 'ibrahim.alenezi@example.com', '0501234510', '2025-08-20', 'Regular'),
('Turki Alrashidi', 'turki.alrashidi@example.com', '0501234511', '2025-11-09', 'Regular'),
('Hassan Alhassan', 'hassan.alhassan@example.com', '0501234512', '2026-01-18', 'Premium'),
('Sara Alharbi', 'sara.alharbi@example.com', '0501234513', '2024-04-16', 'VIP'),
('Noura Alqahtani', 'noura.alqahtani@example.com', '0501234514', '2024-10-24', 'Regular'),
('Reem Alghamdi', 'reem.alghamdi@example.com', '0501234515', '2025-02-14', 'Premium'),
('Huda Alotaibi', 'huda.alotaibi@example.com', '0501234516', '2025-07-29', 'Regular'),
('Maha Alzahrani', 'maha.alzahrani@example.com', '0501234517', '2026-03-10', 'Premium');


-- Employees
INSERT INTO employees
(employee_name, job_position, salary, hire_date)
VALUES
('Abdulrahman Alharbi', 'Manager', 14500.00, '2021-06-01'),
('Majed Alotaibi', 'Librarian', 8900.00, '2022-09-12'),
('Bader Alqahtani', 'Assistant', 5400.00, '2024-02-05'),
('Laila Alghamdi', 'Librarian', 9200.00, '2023-04-17'),
('Sultan Alshammari', 'Assistant', 5700.00, '2025-01-08'),
('Abeer Alzahrani', 'Assistant', 5900.00, '2025-08-24');


-- Books
INSERT INTO books
(title, author, genre, published_year, status, category_id)
VALUES
('1984', 'George Orwell', 'Dystopian Fiction', 1949, 'Available', 1),
('To Kill a Mockingbird', 'Harper Lee', 'Classic Fiction', 1960, 'Available', 1),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Fiction', 1925, 'Borrowed', 1),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 'Available', 1),
('A Brief History of Time', 'Stephen Hawking', 'Cosmology', 1988, 'Available', 2),
('The Selfish Gene', 'Richard Dawkins', 'Evolutionary Biology', 1976, 'Available', 2),
('Cosmos', 'Carl Sagan', 'Astronomy', 1980, 'Available', 2),
('The Gene: An Intimate History', 'Siddhartha Mukherjee', 'Genetics', 2016, 'Available', 2),
('Clean Code', 'Robert C. Martin', 'Software Engineering', 2008, 'Available', 3),
('Designing Data-Intensive Applications', 'Martin Kleppmann', 'Data Engineering', 2017, 'Borrowed', 3),
('The Pragmatic Programmer', 'Andrew Hunt and David Thomas', 'Software Development', 1999, 'Available', 3),
('Introduction to Algorithms', 'Thomas H. Cormen et al.', 'Computer Science', 2009, 'Available', 3),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'World History', 2011, 'Available', 4),
('The Silk Roads', 'Peter Frankopan', 'World History', 2015, 'Borrowed', 4),
('Guns, Germs, and Steel', 'Jared Diamond', 'Historical Geography', 1997, 'Available', 4),
('The Lean Startup', 'Eric Ries', 'Entrepreneurship', 2011, 'Available', 5),
('Good to Great', 'Jim Collins', 'Management', 2001, 'Available', 5),
('Thinking, Fast and Slow', 'Daniel Kahneman', 'Behavioral Psychology', 2011, 'Available', 6),
('Man''s Search for Meaning', 'Viktor E. Frankl', 'Psychology', 1946, 'Available', 6),
('The Republic', 'Plato', 'Political Philosophy', 380, 'Borrowed', 7),
('Meditations', 'Marcus Aurelius', 'Stoic Philosophy', 180, 'Available', 7),
('Steve Jobs', 'Walter Isaacson', 'Biography', 2011, 'Available', 8),
('Long Walk to Freedom', 'Nelson Mandela', 'Autobiography', 1994, 'Available', 8),
('How Not to Be Wrong', 'Jordan Ellenberg', 'Popular Mathematics', 2014, 'Available', 9),
('Fermat''s Enigma', 'Simon Singh', 'Mathematics', 1997, 'Available', 9),
('Atomic Habits', 'James Clear', 'Personal Development', 2018, 'Borrowed', 10),
('Deep Work', 'Cal Newport', 'Productivity', 2016, 'Available', 10),
('The 7 Habits of Highly Effective People', 'Stephen R. Covey', 'Personal Development', 1989, 'Borrowed', 10),
('The Psychology of Money', 'Morgan Housel', 'Personal Finance', 2020, 'Available', 5),
('The Design of Everyday Things', 'Don Norman', 'Design', 1988, 'Available', 3);


-- Loans
INSERT INTO loans
(member_id, book_id, loan_date, due_date, return_date)
VALUES
(1, 10, '2025-01-12', '2025-01-26', '2025-01-24'),
(3, 5, '2025-02-03', '2025-02-17', '2025-02-20'),
(13, 4, '2025-03-11', '2025-03-25', '2025-03-22'),
(2, 9, '2025-04-07', '2025-04-21', '2025-04-21'),
(7, 18, '2025-05-15', '2025-05-29', '2025-06-04'),
(5, 13, '2025-06-02', '2025-06-16', '2025-06-14'),
(15, 26, '2025-07-09', '2025-07-23', '2025-07-28'),
(4, 1, '2025-08-18', '2025-09-01', '2025-08-30'),
(9, 22, '2025-09-04', '2025-09-18', '2025-09-24'),
(6, 16, '2025-10-20', '2025-11-03', '2025-11-01'),
(14, 19, '2025-11-06', '2025-11-20', '2025-11-19'),
(8, 11, '2025-12-01', '2025-12-15', '2025-12-21'),
(10, 24, '2026-01-08', '2026-01-22', '2026-01-20'),
(11, 27, '2026-02-10', '2026-02-24', '2026-03-01'),
(16, 2, '2026-03-17', '2026-03-31', '2026-03-29'),
(12, 30, '2026-04-13', '2026-04-27', '2026-04-26'),
(17, 7, '2026-05-06', '2026-05-20', '2026-05-23'),
(1, 29, '2026-06-09', '2026-06-23', '2026-06-22'),
(3, 12, '2026-07-14', '2026-07-28', '2026-08-02'),
(13, 23, '2026-08-03', '2026-08-17', '2026-08-15'),
(5, 8, '2026-09-07', '2026-09-21', '2026-09-19'),
(7, 17, '2026-09-12', '2026-09-26', '2026-10-01'),
(2, 6, '2026-09-19', '2026-10-03', '2026-10-03'),
(15, 25, '2026-09-23', '2026-10-07', '2026-10-06'),
(4, 10, '2026-10-05', '2026-10-19', NULL),
(6, 26, '2026-10-06', '2026-10-20', NULL),
(9, 14, '2026-10-07', '2026-10-21', NULL),
(11, 3, '2026-10-08', '2026-10-22', NULL),
(14, 20, '2026-10-09', '2026-10-23', NULL),
(17, 28, '2026-10-10', '2026-10-24', NULL);


-- Fines
INSERT INTO fines (loan_id, fine_amount, fine_date) VALUES
(2, 6.00, '2025-02-20 11:20:00'),
(5, 12.00, '2025-06-04 15:10:00'),
(7, 10.00, '2025-07-28 12:40:00'),
(9, 12.00, '2025-09-24 17:05:00'),
(12, 12.00, '2025-12-21 13:30:00'),
(14, 10.00, '2026-03-01 10:45:00'),
(17, 6.00, '2026-05-23 16:15:00'),
(19, 10.00, '2026-08-02 14:00:00'),
(22, 10.00, '2026-10-01 11:35:00');


-- Payments
INSERT INTO payments
(loan_id, payment_date, amount, payment_method)
VALUES
(2, '2025-02-20 11:25:00', 6.00, 'Cash'),
(5, '2025-06-04 15:15:00', 12.00, 'Credit Card'),
(7, '2025-07-29 09:10:00', 10.00, 'Credit Card'),
(9, '2025-09-24 17:15:00', 12.00, 'Cash'),
(12, '2025-12-22 10:20:00', 12.00, 'Credit Card'),
(14, '2026-03-02 13:05:00', 10.00, 'Cash'),
(17, '2026-05-23 16:20:00', 6.00, 'Credit Card');


-- Loan History
-- Store only completed loans
INSERT INTO loan_history
(member_id, book_id, loan_date, return_date)
SELECT
    member_id,
    book_id,
    loan_date,
    return_date
FROM loans
WHERE return_date IS NOT NULL;