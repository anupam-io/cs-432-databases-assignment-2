# Schema for e-commerce platform

## Tables
 - Retailers
 - Products
 - Users
 - Addresses
 - Reviews
 - Views
 - Cart
 - Purchase

## Type of queries
 - Delete a user
 - Product recommendation mechanism
   - Location based
   - Search history based
   - Other users based

## How to run?
    Open the mysql shell first, using `sudo mysql`
 - `source reset.sql`: resetting the current database
 - `source schema.sql`: setting up the required schema
 - `source Q[No.].sql`: running a certain query

 - `source main.sql;`: for reset, schema, all questions.

 - `sudo mysqldump X > database_image_X.sql;`: exporting the database