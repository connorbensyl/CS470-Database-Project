drop database zoo;

Create database zoo;
use zoo;


create table employee (
emp_id int PRIMARY KEY,
first_name varchar(30) NOT NULL,
last_name varchar(30) NOT NULL,
salary int,
sex char,
birth_date date
);

create table habitat (
habitat_number int PRIMARY KEY,
habitat_name varchar(30) NOT NULL,
super_id int not null,
constraint fk_super_id_emp_id foreign key (super_id) references employee (emp_id)
);

create table works_in (
emp_id int PRIMARY KEY,
hno int not null,
constraint fk_emp_id_for_habitat foreign key (emp_id) references employee (emp_id),
constraint fk_hno_habitat_number foreign key (hno) references habitat (habitat_number)
);

create table species (
sname varchar(20) PRIMARY KEY,
category varchar(15),
diet varchar(10),
hno int NOT NULL,
constraint fk_hno_hanitat_number foreign key (hno) references habitat (habitat_number)
);

create table animal (
animal_id int PRIMARY KEY,
aname varchar(10) NOT NULL,
sex char(1),
age int,
acqui_way varchar(20),
health_cond varchar(5),
specie varchar(10) not null,
constraint fk_specie_sname foreign key (specie) references species (sname)
);

create table cares_for (
emp_id int PRIMARY KEY,
ani_id int NOT NULL,
constraint fk_emp_id_for_animal foreign key (emp_id) references employee (emp_id),
constraint fk_ani_id_animal_id foreign key (ani_id) references animal (animal_id)
);



/* DML */

INSERT INTO employee(emp_id, first_name, last_name, salary, sex, birth_date) VALUES
(1, 'John', 'Smith', 50000, 'M', '2001/01/01');

INSERT INTO habitat(habitat_number, habitat_name, super_id) VALUES
(1, 'Jungle', 1);

INSERT INTO works_in(emp_id, hno) VALUES
(1, 1);

INSERT INTO species(sname, category, diet, hno) VALUES
('Gorilla', 'Primate', 'Herbivore', 1);

INSERT INTO animal(animal_id, aname, sex, age, acqui_way, health_cond, specie) VALUES
(1, 'Harambe', 'M', 17, 'born in zoo', NULL, 'Gorilla');

INSERT INTO cares_for(emp_id, ani_id) VALUES
(1, 1);



