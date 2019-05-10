

-- �����, �޿�, ����(�޿�/12) �� ����ϵ� ������ ����������� �ݿø��Ͽ� ���

SELECT ename,sal,round(sal/12,-2)
From emp;

-- �����, �޿�, ����(�޿��� 3.3%)�� �������� �����ϰ� ���

SELECT ename, sal, trunc(sal*0.033,-1) as TAX
From emp;


--���� ����

select  '-' || trim(' �̼��� ')|| '-' as col1, --���ʰ�������
                       '-'|| ltrim(' �̼��� ') || '-' as col2, --���� ��������
                       '-'|| rtrim(' �̼��� ') || '-' as col3  --������ ��������
from dual; --dual : ���� ���̺�.

select sysdate from dual; --�������̺� �̿��ؼ� ���� ��¥ Ȯ��.

--������ ���ڿ��� '�����̻�����ĥ�ȱ�' ���ڷ� ��ü
SELECT translate(sal, '0123456789','�����̻�����ĥ�ȱ�')
FROM emp;

--������ ���ڿ��� 0�� '$'�� �ٲپ� ���
SELECT replace(sal, 0,'$')
FROM emp;

SELECT '-' || replace('�� �� ��',' ','') || '-' as col
From dual;

SELECT * From emp;
 -- smith�������� �����ȣ, ����, ������(�ҹ���) ���

SELECT empno,ename,lower(job) as job
from emp
where ename = 'SMITH';
          

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ��빮��)�� ���
SELECT empno,INITCAP (ename)as ename ,INITCAP (job) as job
from emp;
          

-- �̸��� ù���ڰ� ��K������ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
SELECT empno,ename, job,sal,deptno
from emp
where SUBSTR (ename, 1, 1) > 'K' AND SUBSTR (ename, 1, 1)<'Y' 
Order by ename;
          

 

-- �̸��� 5���� �̻��λ������ ���

 select * 
 from emp
 where LENGTH(ENAME)>=5;

 

-- �̸��� 15�ڷ� ���߰���ڴ� ���ʿ� �����ʿ��� ��*���� ä���

 select rpad(ename,15,'*') as ename
 from emp;

-- ������ 10�ڷ� ���߰���ڴ� �����ʿ� ���ʿ� ��-���� ä���
select lpad(sal,10,'-') as sal
from emp;

Insert into emp(empno,ename,sal)VALUES (8000,'ȫ�浿',10000);
Insert into emp(empno,ename,sal)VALUES (8001,'ȫ����',6000);

-- ������� �ٹ��� ���� ���� ��� ������ ���
SELECT *
FROM emp
ORDER BY sysdate-nvl(hiredate,sysdate) desc;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select ename,trunc((sysdate - hiredate)/7) as week, ceil(mod((sysdate - hiredate), 7)) as day
--select (sysdate - hiredate)/7 as week, mod((sysdate - hiredate), 7) as day
from emp;


-- 10�� �μ��� ����� ��������� �ٹ� ������ ���
select ename,Trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) as months

from emp
where deptno = 10;
          
-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day(sysdate,'ȭ')from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day(sysdate) from dual;

-- �Ի����ڿ��� �Ի�⵵�� ���
select ename,hiredate, to_char(hiredate,'YYYY') as hireyear
from emp; --�����

select ename,hiredate, to_char(hiredate,'MM') as hireyear
from emp; -- �����
 
select ename,hiredate, to_char(hiredate,'YYYY-MM') as hiremonth
from emp; -- ������  

select ename,hiredate, to_char(hiredate,'DD') as hireday
from emp; -- �����   


-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select ename,
(to_char(hiredate,'YYYY') || '��'||to_char(hiredate,'MM')||'��'|| to_char(hiredate,'DD')|| '��' )as hirdate
from emp;

select ename,
to_char(hiredate,'YYYY"��" MM"��" DD"��"') as hirdate
from emp;
          

-- 1981�⵵�� �Ի��� ��� �˻�

select ename,hiredate
from emp
where to_char(hiredate,'YYYY')='1981';


-- 5���� �Ի��� ��� �˻�
select ename,hiredate
from emp
where to_char(hiredate,'MM')='05';
 

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select ename,('$'|| TO_char(sal, '99,999')) as sal 
from emp;

-- decode ���� �Լ�.

SELECT  decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����')AS  gender  
FROM info;

-- case when then end

SELECT  CASE  substr(jumin, 8, 1)
         WHEN '1' THEN '����'
         WHEN'3' THEN '����'
         ELSE '����'
         END    as gender
FROM   info;

-- �μ���ȣ�� 10�̸鿵����, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
SELECT  ename,decode( deptno, 10, '������', 20, '������',30,'IT','�����')AS  ubmu 
FROM emp;

SELECT  ename, CASE  deptno
         WHEN 10 THEN '������'
         WHEN 20 THEN '������'
         WHEN 30 THEN 'IT'
         ELSE '�����'
         END    as  ubmu 
FROM   emp;
          

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���

SELECT  empno,ename,job,sal,decode( job, 'ANALYST', sal*1.1 , 'CLERK', sal*1.15 ,'MANEGER', sal*1.2) as sal2
FROM emp;

SELECT  empno,ename,job,sal, CASE  job
         WHEN 'ANALYST' THEN sal *1.1
         WHEN 'CLERK' THEN sal*1.15
         WHEN 'MANAGER' THEN sal*1.2
         
         END    as  sal2 
FROM   emp;

