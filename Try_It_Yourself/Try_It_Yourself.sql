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

-- Chapter 5

--1. 
COPY actors
FROM 'path\.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#');

--2.
COPY (
	SELECT county_name, state_name, births_2019
	FROM us_counties_pop_est_2019
	ORDER BY births_2019 DESC
	LIMIT 20
)
TO 'C:\Users\gamvr\Desktop\Programming\Repos\practical-sql-2\Chapter_05\us_counties_births_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

county_name|state_name|births_2019
Los Angeles County|California|112963
Harris County|Texas|66937
Cook County|Illinois|61822
Maricopa County|Arizona|52722
San Diego County|California|40603
Dallas County|Texas|38374
Kings County|New York|37786
Orange County|California|36406
Miami-Dade County|Florida|30789
Riverside County|California|29482
San Bernardino County|California|29341
Tarrant County|Texas|27512
Queens County|New York|27453
Clark County|Nevada|27048
Bexar County|Texas|26736
King County|Washington|25188
Wayne County|Michigan|22766
Broward County|Florida|21829
Santa Clara County|California|21713
Philadelphia County|Pennsylvania|20924

--3. Will numeric(3,8) work for 17519.668, etc.
-- No, because 3 is the max number for digits and 8 is the allocated digits for decimal.
-- the given number is too big. Precision must be larger than scale.
-- numeric(8,3) should be used instead of what was given.