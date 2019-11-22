-- Show courses per college
select co.name as College, cou.name as Course, concat(cou.number, '-', sec.number) as 'Course Code'
	from college co 
		join course cou on (co.college_id = cou.college_id)
		join section sec on (cou.course_id = sec.course_id);
    
-- Show number of courses per college
select co.name as College, count(cou.name) as Courses
	from college co
		join course cou on (cou.college_id = co.college_id)
	group by co.name;

-- Show number of courses per day
select d.day as 'Day', count(cou.name) as Courses
	from day d
		join schedule sch on (sch.day_id = d.day_id)
		join section sec on (sec.section_id = sch.section_id)
        join course cou on (sec.course_id = cou.course_id)
	group by d.day;

-- Show course schedule per term and day.
select concat(t.name, ' ', t.year) as 'Term',
        d.day as 'Day',
        concat(cou.number, '-', sec.number) as 'Course'
    from
        (((((day d
        join schedule sch on ((d.day_id = sch.day_id)))
        join section sec on ((sch.section_id = sec.section_id)))
        join course cou on ((cou.course_id = sec.course_id)))
        join dept dept on ((dept.dept_id = cou.dept_id)))
        join term t on ((sec.term_id = t.term_id)))
    order by concat(t.name, ' ', t.year) asc,
    (case 
        when (d.day = 'Monday') then 1
        when (d.day = 'Tuesday') then 2
        when (d.day = 'Wednesday') then 3
        when (d.day = 'Thursday') then 4
        when (d.day = 'Friday') then 5
        when (d.day = 'Saturday') then 6
    end) asc;
    
-- Show term, course number and section, course, and professor.
select concat(t.name, ' ', t.year) as 'Term',
		concat(cou.number, '-', sec.number) as 'Course',
        cou.name as 'Course Name',
        p.name as 'Professor'
	from
		course cou
		join section sec on (cou.course_id = sec.course_id)
		join professor p on (p.prof_id = sec.prof_id)
		join term t on (sec.term_id = t.term_id)
	order by concat(t.name, ' ', t.year) asc;