--[ hr 계정 ]

--1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. 
   --Zlotkey는 제외하십시오.

--SELECT department_id FROM employees where last_name = 'Zlotkey';

SELECT first_name||' '||last_name Name, HIRE_DATE --, department_id
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = (SELECT department_id FROM employees where last_name = 'Zlotkey')) AND last_name <> 'Zlotkey';


--2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 
   --결과를 급여에 대해 오름차순으로 정렬하십시오.

 --SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES;
 
 SELECT employee_id, first_name||' '||last_name Name,salary
 FROM EMPLOYEES
 WHERE SALARY>(SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES)
 ORDER BY SALARY;


--3. King에게 보고하는 모든 사원의 이름과 급여를 표시하십시오.
-- SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = 'King';

SELECT first_name||' '||last_name Name,salary, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES  WHERE LAST_NAME = 'King') ;




--4. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.

SELECT E.DEPARTMENT_ID, E.first_name||' '||E.last_name Name, E.JOB_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = d.department_id
WHERE D.DEPARTMENT_NAME = 'Executive';


--5. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 
   --모든 사원의 사원 번호, 이름 및 급여를 표시하는 질의를 작성하십시오.

--SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES;

--SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES 
--WHERE  (first_name || last_name) LIKE '%u%' OR  (first_name || last_name) LIKE '%U%' ORDER BY DEPARTMENT_ID;

SELECT employee_id, (first_name || last_name) NAME, SALARY ,department_id
FROM employees
WHERE salary>(SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES) AND department_id in (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES 
WHERE  (first_name || last_name) LIKE '%u%' OR  (first_name || last_name) LIKE '%U%')
ORDER BY department_id,salary;
