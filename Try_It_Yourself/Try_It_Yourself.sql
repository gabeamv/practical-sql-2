----------------------------------------------------------------------------
-- Chapter 2: Creating Your First Database and Table
----------------------------------------------------------------------------

-- 1. Imagine you're building a database to catalog all the animals at your
-- local zoo. You want one table to track the kinds of animals in the
-- collection and another table to track the specifics on each animal. Write
-- CREATE TABLE statements for each table that include some of the columns
-- you need. Why did you include the columns you chose?

CREATE TABLE animals (
    breed text,
    scientific_name text,
)

CREATE TABLE animal_info (
    nickname text,
    lbs numeric,
    date_acquired date,
    gender text,
    age numeric
)

-- 2. Now create INSERT statements to load sample data into the tables.
-- How can you view the data via the pgAdmin tool?
-- 2b. Create an additional INSERT statement for one of your tables. On purpose,
-- leave out one of the required commas separating the entries in the VALUES
-- clause of the query. What is the error message? Does it help you find the
-- error in the code?

--Right click and table and view the data.
-- ERROR:  syntax error at or near "("LINE 5: ('Bob', 30, '2001-12-12', 'M', 4); ^ SQL state: 42601 Character: 104
-- Helps find the error code.

INSERT INTO animal_info
VALUES
('Steven', 50, '1999-10-10', 'F', 7),
('Bobby', 40, '1998-5-5', 'M', 9),
('Bob', 30, '2001-12-12', 'M', 4);

-- Chapter 3

-- 1. The school district superintendent asks for a list of teachers in each
-- school. Write a query that lists the schools in alphabetical order along
-- with teachers ordered by last name A-Z.

SELECT school, last_name, first_name
FROM teachers
ORDER BY school, last_name;

-- 2. Write a query that finds the one teacher whose first name starts
-- with the letter 'S' and who earns more than $40,000.

SELECT last_name, first_name, school, salary
FROM teachers
WHERE first_name LIKE 'S%' AND salary > 40000
ORDER BY last_name;

-- 3. Rank teachers hired since Jan. 1, 2010, ordered by highest paid to lowest.

SELECT last_name, first_name, school, hire_date, salary
FROM teachers
WHERE hire_date >= '2010-1-1'
ORDER BY salary DESC;

-- Chapter 4

--1. Decimal(4, 1). 999 is the max, so that is 3 digits at most for the
-- for the whole numbers, then we allocate one digit with a precision of 1
-- to calculate the tens place.

-- 2. Text is appropriate for first and last names. It's a good idea
-- to separate first and last names into two columns because you have
-- more options in how to query the data, i.e. order by last name,
-- order by first name.

--3. An error will occur trying to convert '4//2021' to timestamp.