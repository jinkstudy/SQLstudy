
-- <�������� > HR ����
-- �����ȣ, �����, �μ��� ���

--INNER JOIN (���ʸ�� ����)
-- ���� 
select e.employee_id ID, e.first_name || e.last_name NAME,  d.department_name DEPTNAME
from employees e, departments d
WHERE e.department_id = d.department_id;

-- ǥ��ȭ

select e.employee_id ID, e.first_name || e.last_name NAME,  d.department_name DEPTNAME
from employees e INNER JOIN departments d
ON e.department_id = d.department_id;


-- �����ȣ, �����, ������, �μ��� ���

-- ���� 
select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB ,d.department_name DEPTNAME
from employees e, departments d, jobs j
WHERE (e.department_id = d.department_id) and (e.job_id = j.job_id);

-- ǥ��ȭ

select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB , d.department_name DEPTNAME
from employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON (e.job_id = j.job_id);


-- �����ȣ, �����, �μ���, ��ġ ���

-- ���� 
select e.employee_id ID, e.first_name || e.last_name NAME,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e, departments d , locations l
WHERE (e.department_id = d.department_id) and (d.location_id = l.location_id);

-- ǥ��ȭ

select e.employee_id ID, e.first_name || e.last_name NAME,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e INNER JOIN departments d   
ON (e.department_id = d.department_id) 
INNER JOIN locations l
ON (d.location_id = l.location_id) ;

-- �����ȣ, �����, ������, �μ���, ��ġ���

-- ���� 
select e.employee_id ID, e.first_name || e.last_name NAME,  j.job_title JOB,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e, departments d , jobs j,locations l
WHERE (e.department_id = d.department_id) and (d.location_id = l.location_id) and (e.job_id = j.job_id) ;

-- ǥ��ȭ

select e.employee_id ID, e.first_name || e.last_name NAME, j.job_title JOB,d.department_name DEPTNAME,l.country_ID Country,l.city city
from employees e INNER JOIN departments d   
ON (e.department_id = d.department_id) 
INNER JOIN jobs j
ON (e.job_id = j.job_id)
INNER JOIN locations l
ON (d.location_id = l.location_id) ;


-- �Ի�⵵�� �ְ� ������ �޴� ����� �̸��� �μ����� ���
-- ����                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

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



