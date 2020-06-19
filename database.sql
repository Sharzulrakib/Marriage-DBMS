drop table student;
drop table graph;
drop table dataStructure;
drop table problem;

create table student(
name varchar(10),
roll number(20) not null,
contact_number number(15) ,
rating integer,
institution varchar(25);
primary key(roll_number)
);

insert into student(name,roll,contact_number,rating,intitution) values ('awan',1507055,01517038460,1173,'KUET');
insert into student(name,roll,contact_number,rating,intitution) values ('barat',1507056,01717038460,1174,'KUET');

create table Graphtype(
problem_id integer,
type_id integer,
problem_name varchar(20),
prolem_description varchar(20),
score integer,
primary key(problem_id)
);

insert into Graphtype(problem_id,type_id,problem_name,prolem_description,score) values (12,1,'connected city','******',500);

create table DataStructuretype(
problem_id integer,
type_id integer,
problem_name varchar(20),
prolem_description varchar(20),
score integer,
primary key(problem_id)
);
insert into DataStructuretype(problem_id,type_id,problem_name,prolem_description,score) values (13,2,'||','******',500);

create table Problem(
problem_id integer,
problem_name varchar(20),
problem_typeid integer,
student_id number,
primary key(problem_id),
foreign key(student_id) references student(roll) on delete cascade
foreign key(problem_typeid) references Graphtype(type_id) on delete cascade
foreign key(problem_typeid) references DataStructuretype(type_id) on delete cascade
);
insert into Problem(problem_id,problem_name,problem_typeid,student_id) values (13,'||',2,1507055);














