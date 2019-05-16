--[ hr ���� ]

--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�. 
   --Zlotkey�� �����Ͻʽÿ�.

--SELECT department_id FROM employees where last_name = 'Zlotkey';

SELECT first_name||' '||last_name Name, HIRE_DATE --, department_id
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = (SELECT department_id FROM employees where last_name = 'Zlotkey')) AND last_name <> 'Zlotkey';


--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� 
   --����� �޿��� ���� ������������ �����Ͻʽÿ�.

 --SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES;
 
 SELECT employee_id, first_name||' '||last_name Name,salary
 FROM EMPLOYEES
 WHERE SALARY>(SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES)
 ORDER BY SALARY;


--3. King���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���Ͻʽÿ�.
-- SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = 'King';

SELECT first_name||' '||last_name Name,salary, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES  WHERE LAST_NAME = 'King') ;




--4. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻʽÿ�.

SELECT E.DEPARTMENT_ID, E.first_name||' '||E.last_name Name, E.JOB_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = d.department_id
WHERE D.DEPARTMENT_NAME = 'Executive';


--5. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� 
   --��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.

--SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES;

--SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES 
--WHERE  (first_name || last_name) LIKE '%u%' OR  (first_name || last_name) LIKE '%U%' ORDER BY DEPARTMENT_ID;

SELECT employee_id, (first_name || last_name) NAME, SALARY ,department_id
FROM employees
WHERE salary>(SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES) AND department_id in (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES 
WHERE  (first_name || last_name) LIKE '%u%' OR  (first_name || last_name) LIKE '%U%')
ORDER BY department_id,salary;
