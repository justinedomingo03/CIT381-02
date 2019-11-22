-- Drop and recreate schema/database. Efficient for updating.
drop schema myschedule;
create schema myschedule;

-- Use appropriate schema/database.
use myschedule;

-- Create college table.
drop table if exists college;
create table college (
college_id int not null auto_increment,
name varchar(45) not null,
constraint pk_college primary key (college_id)
);
-- Create department (dept) table.
drop table if exists dept;
create table dept (
dept_id int not null auto_increment,
college_id int not null,
name varchar(45) not null,
constraint pk_dept primary key (dept_id),
constraint fk_dept_college foreign key (college_id) references college (college_id)
);
-- Create course table.
drop table if exists course;
create table course (
course_id int not null auto_increment,
college_id int not null,
dept_id int not null,
name varchar(45) not null,
number varchar(45) not null,
credits int not null,
constraint pk_course primary key (course_id),
constraint fk_course_college foreign key (college_id) references college (college_id),
constraint fk_course_dept foreign key (dept_id) references dept (dept_id)
);
-- Create professor table.
drop table if exists professor;
create table professor (
prof_id int not null auto_increment,
name varchar(45) not null,
dept_id int not null,
constraint pk_prof primary key (prof_id),
constraint fk_prof_dept foreign key (dept_id) references dept (dept_id)
);
-- Create term table.
drop table if exists term;
create table term (
term_id int not null auto_increment,
name varchar(45) not null,
year varchar(45) not null,
constraint pk_term primary key (term_id)
);
-- Create section table.
drop table if exists section;
create table section (
section_id int not null auto_increment,
term_id int not null,
course_id int not null,
number int not null,
prof_id int not null,
constraint pk_section primary key (section_id),
constraint fk_section_term foreign key (term_id) references term (term_id),
constraint fk_section_course foreign key (course_id) references course (course_id),
constraint fk_section_prof foreign key (prof_id) references professor (prof_id)
);
-- Create day table.
drop table if exists day;
create table day (
day_id int not null auto_increment,
day varchar(45) not null,
constraint pk_day primary key (day_id)
);
-- Create schedule table.
drop table if exists schedule;
create table schedule (
sched_id int not null auto_increment,
section_id int not null,
day_id int not null,
constraint pk_sched primary key (sched_id),
constraint fk_sched_section foreign key (section_id) references section (section_id),
constraint fk_sched_day foreign key (day_id) references day (day_id)
);
