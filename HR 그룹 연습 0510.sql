--# HR �������� ( employees ���̺� )

--1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���

SELECT EMPLOYEE_ID,FIRST_NAME || LAST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '03%';


--2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���

SELECT *
FROM EMPLOYEES
--WHERE JOB_ID = 'FI_ACCOUNT' OR JOB_ID = 'FI_MGR' OR JOB_ID = 'SA_MAN' OR JOB_ID = 'SA_REP';
WHERE JOB_ID IN('FI_ACCOUNT','FI_MGR','SA_MAN','SA_REP');

--3. Ŀ�̼��� �޴� ������� ����� ���

SELECT FIRST_NAME || LAST_NAME AS NAME,COMMISSION_PCT
FROM EMPLOYEES
WHERE NVL(COMMISSION_PCT,0) != 0;

--4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���

SELECT  FIRST_NAME || LAST_NAME AS NAME,decode( JOB_ID, 'SA_MAN' ,'�Ǹźμ�','SA_REP' ,'�Ǹźμ�','�� �� �μ�')AS  JOB_ID 
FROM EMPLOYEES;

-- case when then end

SELECT  FIRST_NAME || LAST_NAME AS NAME, CASE  JOB_ID
         WHEN 'SA_MAN' THEN '�Ǹźμ�'
         WHEN 'SA_REP' THEN '�Ǹźμ�'
         ELSE '�� �� �μ�'
         END    as JOB_ID
FROM  EMPLOYEES
ORDER BY JOB_ID DESC;
