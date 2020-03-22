create schema school;

create table school.teachers(
teacher_id int not null primary key,
teacher_name varchar(30),
teacher_email varchar(30),
teacher_salary double
);

create table school.students(
student_id int not null primary key,
student_name varchar(30),
student_enrollment_date date
);

create table school.disciplines(
discipline_id int not null primary key,
discipline_name varchar(30)
);

insert into school.teachers 
(teacher_id, teacher_name, teacher_email, teacher_salary)
values (1, "Peter Ivanov", "pivanov@gmail.com", 1921.50);

insert into school.teachers 
(teacher_id, teacher_name, teacher_email, teacher_salary)
values (2, "Georgi Stoimenov", "stoimenov@gmail.com", 1787.25);

insert into school.teachers 
(teacher_id, teacher_name, teacher_email, teacher_salary)
values (3, "Nataliya Yordanova", "nyyoo@abv.bg", 1888.21);

insert into school.teachers 
(teacher_id, teacher_name, teacher_email, teacher_salary)
values (4, "Simeon Prodanov", "sprod@yahoo.com", 1341.60);

insert into school.students 
(student_id, student_name, student_enrollment_date)
values (1, "Georgi Georgiev", '2000-10-22');

insert into school.students 
(student_id, student_name, student_enrollment_date)
values (2, "Stoyan Ivanov", '2010-11-18');

insert into school.students 
(student_id, student_name, student_enrollment_date)
values (3, "Mariya Grozdanova", '2008-05-27');

insert into school.students 
(student_id, student_name, student_enrollment_date)
values (4, "Stefaniya Petkova", '2007-01-12');

insert into school.disciplines 
(discipline_id, discipline_name)
values (1, "Mathematics");

insert into school.disciplines 
(discipline_id, discipline_name)
values (2, "Geography");

insert into school.disciplines 
(discipline_id, discipline_name)
values (3, "Physics");

insert into school.disciplines 
(discipline_id, discipline_name)
values (4, "Informatics");

create table school.addresses(
address_id int not null primary key,
address_country varchar(20),
address_city varchar(20),
address_street varchar(30),
address_number varchar(10),
address_floor int,
address_apartment_no int
);

alter table school.students
add address_id int unique,
add foreign key (address_id) references school.addresses(address_id);

alter table school.teachers
add address_id int unique,
add foreign key (address_id) references school.addresses(address_id);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (1, "Bulgaria", "Sofia", "Levski", "41", 1,  41);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (2, "Bulgaria", "Pleven", "Botev", "42", 2,  42);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (3, "Bulgaria", "Varna", "Rakovski", "43", 3,  43);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (4, "Bulgaria", "Burgas", "Dunav", "44", 4,  44);

update school.students
set address_id=1
where student_id=1;

update school.students
set address_id=2
where student_id=2;

update school.students
set address_id=3
where student_id=3;

update school.students
set address_id=4
where student_id=4;

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (5, "Bulgaria", "Ruse", "Levski", "45", 5,  45);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (6, "Bulgaria", "Razgrad", "Botev", "46", 6,  46);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (7, "Bulgaria", "Shumen", "Radev", "47", 7,  47);

insert into school.addresses 
(address_id, address_country, 
address_city,
address_street,
address_number,
address_floor,
address_apartment_no)
values (8, "Bulgaria", "Montana", "Vratnica", "48", 8,  48);

update school.teachers
set address_id=5
where teacher_id=1;

update school.teachers
set address_id=6
where teacher_id=2;

update school.teachers
set address_id=7
where teacher_id=3;

update school.teachers
set address_id=8
where teacher_id=4;