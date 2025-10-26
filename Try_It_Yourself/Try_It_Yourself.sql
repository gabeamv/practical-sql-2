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