CREATE TABLE natural_key_example (
license_id varchar(10),
first_name varchar(50),
last_name varchar(50),
CONSTRAINT license_key PRIMARY KEY (license_id)
);

INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');

CREATE TABLE natural_key_composite_example (
student_id varchar(10),
school_day date,
present boolean,
CONSTRAINT student_key PRIMARY KEY (student_id, school_day)
);

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '2017/1/22', 'Y');

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '2017/1/23', 'Y');



CREATE TABLE surrogate_key_example (
 order_number bigserial,
product_name varchar(50),
order_date date,
 CONSTRAINT order_key PRIMARY KEY (order_number)
);

INSERT INTO surrogate_key_example (product_name, order_date)
VALUES ('Beachball Polish', '2015-03-17'),
('Wrinkle De-Atomizer', '2017-05-22'),
('Flux Capacitor', '1985-10-26');

SELECT * FROM surrogate_key_example;


CREATE TABLE licenses (
license_id varchar(10),
first_name varchar(50),
last_name varchar(50),
 CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
registration_id varchar(10),
registration_date date,
license_id varchar(10) REFERENCES licenses (license_id) ON DELETE CASCADE,
CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);

INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '2017/3/17', 'T229901');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '2017/3/17', 'T000001');



CREATE TABLE check_constraint_example (
user_id bigserial,
user_role varchar(50),
salary integer,
CONSTRAINT user_id_key PRIMARY KEY (user_id),
CONSTRAINT check_role_in_list CHECK (user_role IN('Admin', 'Staff')),
CONSTRAINT check_salary_not_zero CHECK (salary > 0)
);
INSERT INTO check_constraint_example(user_role, salary)
VALUES('Admin',3333)


CREATE TABLE unique_constraint_example (
contact_id bigserial CONSTRAINT contact_id_key PRIMARY KEY,
first_name varchar(50),
last_name varchar(50),
email varchar(200),
 CONSTRAINT email_unique UNIQUE (email)
);

INSERT INTO unique_constraint_example (first_name, last_name, email)
VALUES ('Samantha', 'Lee', 'slee@example.org');

INSERT INTO unique_constraint_example (first_name, last_name, email)
VALUES ('Betty', 'Diaz', 'bdiaz@example.org');

INSERT INTO unique_constraint_example (first_name, last_name, email)
 VALUES ('Sasha', 'Lee', 'slee@example.org');

CREATE TABLE not_null_example (
student_id bigserial,
first_name varchar(50) ,
last_name varchar(50) NOT NULL,
CONSTRAINT student_id_key PRIMARY KEY (student_id)
);

DROP TABLE not_null_example;

INSERT INTO not_null_example(last_name)
VALUES('SMITH')

SELECT * FROM not_null_example;

ALTER TABLE unique_constraint_example DROP CONSTRAINT email_unique;
SELECT*FROM unique_constraint_example;

ALTER TABLE not_null_example DROP CONSTRAINT student_id_key;
SELECT * FROM not_null_example;

CREATE TABLE new_york_addresses (
longitude numeric(9,6),
latitude numeric(9,6),
street_number varchar(10),
street varchar(32),
unit varchar(7),
postcode varchar(5),
id integer CONSTRAINT new_york_key PRIMARY KEY
);
COPY new_york_addresses
FROM 'C:\Users\ghost\Desktop\postgresSQL\practical-sql-main\Chapter_07\city_of_new_york.csv'
WITH (FORMAT CSV, HEADER);

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'BROADWAY';

DROP INDEX street_idx;



--Try it yourself 

CREATE TABLE albums (
album_id bigserial,
album_catalog_code varchar(100) NOT NULL,
album_title text NOT NULL,
album_artist text NOT NULL,
album_release_date date,
album_genre varchar(40),
album_description text
CONSTRAINT album_key PRIMARY KEY (album_id),
CONSTRAINT album_id_key PRIMARY KEY (album_id),
);
CREATE TABLE songs (
song_id bigserial,
song_title text NOT NULL,
song_artist text NOT NULL,
album_id bigint
CONSTRAINT song_id_key PRIMARY KEY (song_id)
);