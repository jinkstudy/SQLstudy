
-- <도전문제 > HR 계정
-- 사원번호, 사원명, 부서명 출력

--INNER JOIN (양쪽모두 존재)
-- 기존 
select e.employee_id ID, e.first_name || e.last_name NAME,  d.department_name DEPTNAME
from employees e, departments d
WHERE e.department_id = d.department_id;

-- 표준화

select e.employee_id ID, e.first_name || e.last_name NAME,  d.department_name DEPTNAME
from employees e INNER JOIN departments d
ON e.department_id = d.department_id;


-- 사원번호, 사원명, 업무명, 부서명 출력

-- 기존 
select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB ,d.department_name DEPTNAME
from employees e, departments d, jobs j
WHERE (e.department_id = d.department_id) and (e.job_id = j.job_id);

-- 표준화

select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB , d.department_name DEPTNAME
from employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON (e.job_id = j.job_id);


-- 사원번호, 사원명, 부서명, 위치 출력

-- 기존 
select e.employee_id ID, e.first_name || e.last_name NAME,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e, departments d , locations l
WHERE (e.department_id = d.department_id) and (d.location_id = l.location_id);

-- 표준화

select e.employee_id ID, e.first_name || e.last_name NAME,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e INNER JOIN departments d   
ON (e.department_id = d.department_id) 
INNER JOIN locations l
ON (d.location_id = l.location_id) ;

-- 사원번호, 사원명, 업무명, 부서명, 위치출력

-- 기존 
select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e, departments d , jobs j,locations l
WHERE (e.department_id = d.department_id) and (d.location_id = l.location_id) and (e.job_id = j.job_id) ;

-- 표준화

select e.employee_id ID, e.first_name || e.last_name NAME, j.job_title JOB,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e INNER JOIN departments d   
ON (e.department_id = d.department_id) 
INNER JOIN jobs j
ON (e.job_id = j.job_id)
INNER JOIN locations l
ON (d.location_id = l.location_id) ;


-- 입사년도별 최고 월급을 받는 사원의 이름과 부서명을 출력
-- 기존                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

SELECT e1.FIRST_NAME, to_char(e1.HIRE_DATE,'yyyy'), e1.SALARY, d.DEPARTMENT_NAME
FROM EMPLOYEES e1
INNER JOIN (
SELECT TO_CHAR(HIRE_DATE, 'YYYY') year, MAX(SALARY) maxsal
FROM EMPLOYEES e2
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY year
) e2
ON TO_CHAR(e1.HIRE_DATE, 'YYYY') = e2.year
AND e1.SALARY = e2.maxsal
LEFT JOIN DEPARTMENTS d ON e1.DEPARTMENT_ID = d.DEPARTMENT_ID
ORDER BY HIRE_DATE;



