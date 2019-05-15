--* HR ��������

-- 1. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
SELECT TO_CHAR(HIRE_DATE,'YYYY') YEAR, MIN(SALARY) MIN ,MAX(SALARY) MAX ,SUM(SALARY) SUM, ROUND(AVG(SALARY)) AVG
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
ORDER BY YEAR;

-- 2. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY AVG DESC;

SELECT DEPARTMENT_ID, AVG
FROM (
    SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG 
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID 
    ORDER BY AVG DESC
    ) 
WHERE AVG>=10000;

-- 3. �μ��� �ִ� �޿��� ���Ͻÿ�.  �ش�Ǵ� �μ���ȣ�� 10���� 20����
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT *
FROM (
    SELECT DEPARTMENT_ID,
    MAX(SALARY) 
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
)
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;

--4. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
 SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME
 FROM employees e, departments d
 WHERE e.department_id=d.department_id and e.LAST_NAME ='King';
 
SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE e.LAST_NAME ='King';

--5. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )

SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_TITLE
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
INNER JOIN jobs j
ON e.job_id=j.job_id
WHERE e.LAST_NAME ='King';

--6. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���

SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06';

-- (*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���

SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id=d.department_id
WHERE TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06';


SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e , departments d
WHERE  e.department_id=d.department_id(+) AND( TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06');


--7. 'Executive' �μ����� ����� �ش� ����� ������ �̸��� ���
SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
where e1.manager_id = e2.employee_id  and e1.department_id = d.department_id and d.department_name = 'Executive';

SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1 INNER JOIN EMPLOYEES e2
on e1.manager_id = e2.employee_id
INNER JOIN DEPARTMENTS d
on e1.department_id = d.department_id
where d.department_name = 'Executive';

 --(*) �����ڰ� ���� ����� 'King'�� ��µǷ���
 
SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
where e1.manager_id = e2.employee_id(+)  and e1.department_id = d.department_id and d.department_name = 'Executive';

SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1 LEFT OUTER JOIN EMPLOYEES e2
on e1.manager_id = e2.employee_id
RIGHT OUTER JOIN DEPARTMENTS d
on e1.department_id = d.department_id
where d.department_name = 'Executive';
