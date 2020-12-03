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
location  varchar(30) NOT NULL,
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
sname char PRIMARY KEY,
category char,
diet char,
hno int NOT NULL,
constraint fk_hno_hanitat_number foreign key (hno) references habitat (habitat_number)
);

create table animal (
animal_id int PRIMARY KEY,
aname varchar(30) NOT NULL,
sex char,
age char,
acqui_way char,
health_cond char,
specie char not null,
constraint fk_specie_sname foreign key (specie) references species (sname)
);

create table cares_for (
emp_id int PRIMARY KEY,
ani_id int NOT NULL,
constraint fk_emp_id_for_animal foreign key (emp_id) references employee (emp_id),
constraint fk_ani_id_animal_id foreign key (ani_id) references animal (animal_id)
);







