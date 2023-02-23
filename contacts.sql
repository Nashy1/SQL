DROP TABLE my_contacts;
CREATE TABLE my_contacts(
	contact_id BIGSERIAL CONSTRAINT contact_id_key PRIMARY KEY,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	gender VARCHAR(30) NOT NULL,
	phone VARCHAR (10) UNIQUE NOT NULL,
	email VARCHAR(30) UNIQUE NOT NULL,
	zip_code_id BIGINT REFERENCES zip_codes (zip_code_id) ON DELETE CASCADE,	
	status_id BIGINT REFERENCES status (status_id) ON DELETE CASCADE ,
	profession_id BIGINT REFERENCES profession (profession_id) ON DELETE CASCADE,
	seeking1 VARCHAR(30) NOT NULL,
	seeking2 VARCHAR(30) NOT NULL,
	seeking3 VARCHAR(30) NOT NULL,
	interest1 VARCHAR(30) NOT NULL,
	interest2 VARCHAR(30) NOT NULL,
	interest3 VARCHAR(30) NOT NULL
	);
	
SELECT * FROM my_contacts;

INSERT INTO my_contacts (
	last_name,
	first_name, 
	gender, 
	phone, 
	email, 
	zip_code_id,	
	status_id,
	profession_id,
	seeking1, 
	seeking2, 
	seeking3, 
	interest1,
	interest2, 
	interest3
)
VALUES
('Tom','Smith','female','0780615009','tom@gmail.com',1,1,1,'single male','same profession','over 50','hiking','reading','biking'),
    ('Gugu','Ndaba','female','0780615012','gugu@gmail.com',2,2,2,'single male','employed','under 25','hiking','cooking','running'),
    ('Jo','Nala','male','0780615078','jo@gmail.com',1,1,3,'single female','same profession','over 50','hiking','diving','biking'),
    ('Mary','Smith','female','0610615009','mary@gmail.com',2,2,4,'single male','student','under 50','studying','reading','cycling'),
    ('Kyle','Koo','male','0710615009','kyle@gmail.com',1,2,1,'single female','same profession','over 50','art','reading','cycling'),
    ('Sizwe','Nchabe','male','0840615099','sizwe@gmail.com',3,1,3,'single female','same profession','under 25','hiking','reading','biking'),
    ('Liz','Sun','female','0830777009','liz@gmail.com',3,1,2,'single male','retired','over 50','walkimg','reading','cooking');
	
SELECT* 
FROM my_contacts cont
JOIN zip_codes zip
ON cont.zip_code_id = zip.zip_code_id;

SELECT cont.last_name, cont.first_name, cont.status , prof.profession_id
FROM my_contacts cont
JOIN profession prof
ON cont.profession_id = prof.profession_id;
 
 
SELECT cont.last_name, cont.first_name,  sta.status_id
FROM my_contacts cont
JOIN status sta
ON cont.status_id = sta.status_id


DROP TABLE zip_codes;

CREATE TABLE zip_codes(
    zip_code_id BIGSERIAL CONSTRAINT zip_code_id_key PRIMARY KEY,
	zip_code CHAR(11) NOT NULL,
	city VARCHAR(30) NOT NULL,
	state_name VARCHAR(30) NOT NULL,
	state_abbr CHAR(2) NOT NULL
	
);


INSERT INTO zip_codes
(
zip_code,
	city ,
	state_name ,
	state_abbr
)
VALUES
('36013-36191','Mongomery','Alabama','AL'),
('99703-99781','Fairbanks','Alaska','AK'),
('85641-85705','Tuicson','Arizona','AR');

SELECT * FROM zip_codes;

CREATE TABLE profession
(
profession_id BIGSERIAL CONSTRAINT prof_id_key PRIMARY KEY,
	profession VARCHAR(30) NOT NULL
	
);
INSERT INTO profession
(profession)
VALUES
('doctor'),
('teacher'),
('software developer'),
('student');

SELECT * FROM profession;

CREATE TABLE status
(
status_id BIGSERIAL CONSTRAINT status_id_key PRIMARY KEY,
status VARCHAR(30) NOT NULL	
);
 
INSERT INTO status
(status)
VALUES
('single'),
('divorced') ;

SELECT * FROM status;