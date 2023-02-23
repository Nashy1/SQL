CREATE DATABASE analysis;


--Try it your self 1!!

CREATE TABLE animal_types (
   animal_type_id bigserial CONSTRAINT animal_types_key PRIMARY KEY,
   common_name varchar(100) NOT NULL,
   scientific_name varchar(100) NOT NULL,
   conservation_status varchar(50) NOT NULL
);

CREATE TABLE menagerie (
   menagerie_id bigserial CONSTRAINT menagerie_key PRIMARY KEY,
   animal_type_id bigint REFERENCES animal_types (animal_type_id),
   date_acquired date NOT NULL,
   gender varchar(1),
   acquired_from varchar(100),
   name varchar(100),
   notes text
);

INSERT INTO animal_types (common_name, scientific_name, conservation_status)
VALUES ('Bengal Tiger', 'Panthera tigris tigris', 'Endangered'),
       ('Arctic Wolf', 'Canis lupus arctos', 'Least Concern');
	   
INSERT INTO menagerie (animal_type_id, date_acquired, gender, acquired_from, name, notes)
VALUES
(1, '1996/12/3', 'F', 'Dhaka Zoo', 'Ariel', 'Healthy coat at last exam.'),
(2, '2000/9/30', 'F', 'National Zoo', 'Freddy', 'Strong appetite.');

INSERT INTO animal_types (common_name, scientific_name, conservation_status)
VALUES ('Javan Rhino', 'Rhinoceros sondaicus', 'Critically Endangered');


SELECT *FROM animal_types;
SELECT *FROM menagerie;