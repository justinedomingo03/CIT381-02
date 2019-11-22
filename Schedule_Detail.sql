-- Use appropriate schema.
use myschedule;

-- Insert values into tables.
-- Insert values into college table.
insert into college
values (default, 'Agriculture and Life Sciences');
insert into college
values (default, 'Education and Human Development');
insert into college
values (default, 'General Studies');
insert into college
values (default, 'Physical Sciences and Engineering');

-- Insert values into dept table.
insert into dept
values (default, 
		(select college_id from college where name = 'Agriculture and Life Sciences'), 
		'Biology');
insert into dept
values (default, 
		(select college_id from college where name = 'Education and Human Development'), 
		'Religious Education');
insert into dept
values (default, 
		(select college_id from college where name = 'General Studies'), 
		'General Studies');
insert into dept
values (default, 
		(select college_id from college where name = 'Physical Sciences and Engineering'), 
		'CIT');
insert into dept
values (default, 
		(select college_id from college where name = 'Physical Sciences and Engineering'), 
		'Geology');
insert into dept
values (default, 
		(select college_id from college where name = 'Physical Sciences and Engineering'), 
		'Mathematics');

-- Insert values into course table.
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
	(select dept_id from dept where name = 'CIT'),
    'Operating Systems II', 'CIT353', '3');
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
	(select dept_id from dept where name = 'CIT'),
    'Business Intel and Analytics', 'CIT381', '3');
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
    (select dept_id from dept where name = 'Geology'),
    'Natural Disasters', 'FDSCI201', '3');
insert into course
values (default,
	(select college_id from college where name = 'General Studies'),
    (select dept_id from dept where name = 'General Studies'),
    'Study and Life Skills', 'GS105', '2');
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
    (select dept_id from dept where name = 'CIT'),
    'Mobile Application Development', 'CIT261', '3');
insert into course
values (default,
	(select college_id from college where name = 'Agriculture and Life Sciences'),
	(select dept_id from dept where name = 'Biology'),
    'Environmental Stewardship', 'FDSCI203', '3');
insert into course
values (default,
	(select college_id from college where name = 'General Studies'),
    (select dept_id from dept where name = 'General Studies'),
    'Personal Achievement', 'GS101', '2');
insert into course
values (default,
	(select college_id from college where name = 'General Studies'),
    (select dept_id from dept where name = 'General Studies'),
    'Decision Making and Leadership', 'GS294', '3');
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
    (select dept_id from dept where name = 'Mathematics'),
    'Beginning Algebra', 'MAT100', '2');
insert into course
values (default,
	(select college_id from college where name = 'Education and Human Development'),
    (select dept_id from dept where name = 'Religious Education'),
    'New Testament', 'REL212', '2');
insert into course
values (default,
	(select college_id from college where name = 'Physical Sciences and Engineering'),
    (select dept_id from dept where name = 'CIT'),
    'Senior Practicum', 'CIT495', '1');

-- Insert values into professor table.
insert into professor
values (default,
	'Bradshaw',
    (select dept_id from dept where name = 'CIT'));
insert into professor
values (default,
	'Carver',
    (select dept_id from dept where name = 'CIT'));
insert into professor
values (default,
	'Ashley',
    (select dept_id from dept where name = 'Geology'));
insert into professor
values (default,
	'Whetten',
    (select dept_id from dept where name = 'General Studies'));
insert into professor
values (default,
	'Thayne',
    (select dept_id from dept where name = 'CIT'));
insert into professor
values (default,
	'Taylor',
    (select dept_id from dept where name = 'Biology'));
insert into professor
values (default,
	'Winn',
    (select dept_id from dept where name = 'General Studies'));
insert into professor
values (default,
	'Fluckiger',
    (select dept_id from dept where name = 'General Studies'));
insert into professor
values (default,
	'Ockler',
    (select dept_id from dept where name = 'Mathematics'));
insert into professor
values (default,
	'Anderson',
    (select dept_id from dept where name = 'Religious Education'));
insert into professor
values (default,
	'Okuda',
    (select dept_id from dept where name = 'CIT'));

-- Insert values into term table.
insert into term
values (default, 'Fall', '2019');
insert into term
values (default, 'Winter', '2020');

-- Insert values into section table.
insert into section
values (default,
		(select term_id from term where name = 'Fall'),
		(select course_id from course where number = 'CIT353'),
        '02',
        (select prof_id from professor where name = 'Bradshaw'));
insert into section
values (default,
		(select term_id from term where name = 'Fall'),
		(select course_id from course where number = 'CIT381'),
        '02',
        (select prof_id from professor where name = 'Carver'));
insert into section
values (default,
		(select term_id from term where name = 'Fall'),
		(select course_id from course where number = 'FDSCI201'),
        '11',
        (select prof_id from professor where name = 'Ashley'));
insert into section
values (default,
		(select term_id from term where name = 'Fall'),
		(select course_id from course where number = 'GS105'),
        '11',
        (select prof_id from professor where name = 'Whetten'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'CIT261'),
        '03',
        (select prof_id from professor where name = 'Thayne'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'FDSCI203'),
        '06',
        (select prof_id from professor where name = 'Taylor'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'GS101'),
        '01',
        (select prof_id from professor where name = 'Winn'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'GS294'),
        '02',
        (select prof_id from professor where name = 'Fluckiger'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'MAT100'),
        '25',
        (select prof_id from professor where name = 'Ockler'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'REL212'),
        '07',
        (select prof_id from professor where name = 'Anderson'));
insert into section
values (default,
		(select term_id from term where name = 'Winter'),
		(select course_id from course where number = 'CIT495'),
        '01',
        (select prof_id from professor where name = 'Okuda'));

-- Insert values into day table.
insert into day
values (default, 'Monday');
insert into day
values (default, 'Tuesday');
insert into day
values (default, 'Wednesday');
insert into day
values (default, 'Thursday');
insert into day
values (default, 'Friday');
insert into day
values (default, 'Saturday');

-- Insert values into schedule table.
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'CIT353'),
        (select day_id from day where day = 'Saturday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'CIT381'),
        (select day_id from day where day = 'Friday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'FDSCI201'),
        (select day_id from day where day = 'Thursday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'GS105'),
        (select day_id from day where day = 'Wednesday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'CIT261'),
        (select day_id from day where day = 'Monday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'FDSCI203'),
        (select day_id from day where day = 'Thursday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'GS101'),
        (select day_id from day where day = 'Wednesday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'GS294'),
        (select day_id from day where day = 'Tuesday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'MAT100'),
        (select day_id from day where day = 'Tuesday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'REL212'),
        (select day_id from day where day = 'Wednesday'));
insert into schedule
values (default, 
		(select s.section_id from section s join course c on (s.section_id = c.course_id) where c.number = 'CIT495'),
        (select day_id from day where day = 'Friday'));