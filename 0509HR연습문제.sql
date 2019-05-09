/*
<< �������� >>
- �λ���� ( hr ���� )���� EMPLOYEES ���̺���
*/
select * from EMPLOYEES;
--1. EMPLOYEES ���̺��� ��� �̸��� first_name�� last_name�� ���� full_name���� ���

SELECT first_name || last_name AS full_name
from EMPLOYEES;


--2. �μ���ȣ�� 30(���źμ�)�̰� �޿� 10000�̸��� ����� full_name�� ����,�μ���ȣ�� ���
 SELECT first_name || last_name AS full_name,salary,Department_id
from EMPLOYEES
where department_id = 30 and salary < 10000;

--3. �μ���ȣ�� 30�̰� �޿��� 10000�޷� ���ϸ� �޴� 2006�⵵ ���� �Ի��� ����� full_name�� ���

SELECT first_name || last_name AS full_name
from EMPLOYEES
where department_id = 30 and salary <= 10000 and HIRE_DATE < '06/01/01';

--4. �μ���ȣ�� 30(���źμ�)�̰� �޿��� 10000������ ����� �μ���ȣ�� 60(IT�μ�)���� �޿��� 5000�̻��� ����� ��ȸ
SELECT *
from EMPLOYEES
where (department_id = 30 and salary <= 10000) or (department_id = 60 and salary >= 5000);

--5. �����ȣ�� 110������ 120���� ��� �� �޿��� 5000���� 10000������ �������� ��ȸ
SELECT first_name || last_name AS full_name
from EMPLOYEES
where (Employee_id between 110 and 120) and (salary between 5000 and 10000); --���ԾȵǾ� �ϸ� between ���� �ȵ�.

--6. �����ȣ�� 110������ 120���� �ƴ� ����� ��ȸ

SELECT *
from EMPLOYEES
where (Employee_id not between 110 and 120);

 
--7. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�)�� ���� ����� ��ȸ
SELECT *
from EMPLOYEES
where department_id in (30,60,90);
 
--8. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�) ���� �μ��� ���� ����� ��ȸ
 SELECT *
from EMPLOYEES
where department_id not in (30,60,90);

--9. ��ȭ��ȣ���� 590���� �����ϴ� ������ ��ȭ��ȣ�� ��ȸ

SELECT first_name || last_name AS full_name,phone_number
from EMPLOYEES
where phone_number like '590%';
