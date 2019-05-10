--# HR 계정에서 ( employees 테이블 )

--1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력

SELECT EMPLOYEE_ID,FIRST_NAME || LAST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '03%';


--2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력

SELECT *
FROM EMPLOYEES
--WHERE JOB_ID = 'FI_ACCOUNT' OR JOB_ID = 'FI_MGR' OR JOB_ID = 'SA_MAN' OR JOB_ID = 'SA_REP';
WHERE JOB_ID IN('FI_ACCOUNT','FI_MGR','SA_MAN','SA_REP');

--3. 커미션을 받는 사원들의 명단을 출력

SELECT FIRST_NAME || LAST_NAME AS NAME,COMMISSION_PCT
FROM EMPLOYEES
WHERE NVL(COMMISSION_PCT,0) != 0;

--4.업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력

SELECT  FIRST_NAME || LAST_NAME AS NAME,decode( JOB_ID, 'SA_MAN' ,'판매부서','SA_REP' ,'판매부서','그 외 부서')AS  JOB_ID 
FROM EMPLOYEES;

-- case when then end

SELECT  FIRST_NAME || LAST_NAME AS NAME, CASE  JOB_ID
         WHEN 'SA_MAN' THEN '판매부서'
         WHEN 'SA_REP' THEN '판매부서'
         ELSE '그 외 부서'
         END    as JOB_ID
FROM  EMPLOYEES
ORDER BY JOB_ID DESC;
