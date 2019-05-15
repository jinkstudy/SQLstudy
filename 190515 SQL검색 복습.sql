--* HR 계정에서

-- 1. 연도별로 입사자들의 최소급여, 최대 급여, 급여의 총합 그리고 평균 급여를 구하시오
SELECT TO_CHAR(HIRE_DATE,'YYYY') YEAR, MIN(SALARY) MIN ,MAX(SALARY) MAX ,SUM(SALARY) SUM, ROUND(AVG(SALARY)) AVG
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
ORDER BY YEAR;

-- 2. 부서별 평균 급여가 $10,000 이상인 부서만 구하시오. ( 평균급여가 높은 순으로 )
SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY AVG DESC;

SELECT DEPARTMENT_ID, AVG
FROM (
    SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG 
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID 
    ORDER BY AVG DESC
    ) 
WHERE AVG>=10000;

-- 3. 부서별 최대 급여를 구하시오.  해당되는 부서번호는 10번과 20번임
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

SELECT *
FROM (
    SELECT DEPARTMENT_ID,
    MAX(SALARY) 
    FROM EMPLOYEES 
    GROUP BY DEPARTMENT_ID
)
WHERE DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;

--4. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )
 SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME
 FROM employees e, departments d
 WHERE e.department_id=d.department_id and e.LAST_NAME ='King';
 
SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE e.LAST_NAME ='King';

--5. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )

SELECT e.first_name||' '||e.last_name NAME, e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_TITLE
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
INNER JOIN jobs j
ON e.job_id=j.job_id
WHERE e.LAST_NAME ='King';

--6. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력

SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e INNER JOIN departments d
ON e.department_id=d.department_id
WHERE TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06';

-- (*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면

SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id=d.department_id
WHERE TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06';


SELECT EMPLOYEE_ID,e.first_name||' '||e.last_name NAME,E.HIRE_DATE,d.DEPARTMENT_NAME
FROM employees e , departments d
WHERE  e.department_id=d.department_id(+) AND( TO_CHAR(HIRE_DATE,'YYYY-MM') BETWEEN '2007-01' AND '2007-06');


--7. 'Executive' 부서에서 사원과 해당 사원의 관리자 이름을 출력
SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
where e1.manager_id = e2.employee_id  and e1.department_id = d.department_id and d.department_name = 'Executive';

SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1 INNER JOIN EMPLOYEES e2
on e1.manager_id = e2.employee_id
INNER JOIN DEPARTMENTS d
on e1.department_id = d.department_id
where d.department_name = 'Executive';

 --(*) 관리자가 없는 사원인 'King'이 출력되려면
 
SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1, EMPLOYEES e2, DEPARTMENTS d
where e1.manager_id = e2.employee_id(+)  and e1.department_id = d.department_id and d.department_name = 'Executive';

SELECT e1.EMPLOYEE_ID, e1.first_name||' '||e1.last_name NAME,e1.MANAGER_ID, e2.first_name||' '||e2.last_name MNG_NAME
FROM EMPLOYEES e1 LEFT OUTER JOIN EMPLOYEES e2
on e1.manager_id = e2.employee_id
RIGHT OUTER JOIN DEPARTMENTS d
on e1.department_id = d.department_id
where d.department_name = 'Executive';
