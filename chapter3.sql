CREATE TABLE char_data_types (
 varchar_column varchar(10),
char_column char(10),
text_column text
);

INSERT INTO char_data_types
VALUES
('abc', 'abc', 'abc'),
('defghi', 'defghi', 'defghi');
 COPY char_data_types TO 'C:\Users\ghost\Desktop\postgresSQL\typetest.txt'
 WITH (FORMAT CSV, HEADER, DELIMITER '|');
 
 
 CREATE TABLE number_data_types(
 numeric_column numeric(20,5),
 real_column real,
 double_column double precision
 );
 
 INSERT INTO number_data_types
VALUES
(.7, .7, .7),
(2.13579, 2.13579, 2.13579),
(2.1357987654, 2.1357987654, 2.1357987654);

SELECT
numeric_column * 10000000 AS "Fixed",
real_column * 10000000 AS "Float",
double_column * 10000000 AS "Double"
FROM number_data_types
 WHERE numeric_column = .7;
 
 CREATE TABLE date_time_types (
timestamp_column timestamp with time zone,
interval_column interval
);

INSERT INTO date_time_types
VALUES
('2018-12-31 01:00 EST','2 days'),
('2018-12-31 01:00 -8','1 month'),
('2018-12-31 01:00 Australia/Melbourne','1 century'),
 (now(),'1 week');
 SELECT * FROM date_time_types;
 
 SELECT
timestamp_column,
interval_column,
timestamp_column - interval_column AS new_date
FROM date_time_types;

SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT numeric_column,
CAST(numeric_column AS integer),
CAST(numeric_column AS varchar(6))
FROM number_data_types;

SELECT DISTINCT numeric_column,
CAST(numeric_column AS integer)
FROM number_data_types;

---try it self 1 !!
SELECT CAST numeric(4,1)
FROM number_data_types;
---try it self 2 !!
varchar(50)
---try it self 3 !!
SELECT CAST ('4//2017' AS timestamp);
--ERROR:  invalid input syntax for type timestamp: "4//2017"
--LINE 1: SELECT CAST ('4//2017' AS timestamp);                    ^
--SQL state: 22007
--Character: 14

SELECT CAST ('2017/7/7' AS timestamp );

