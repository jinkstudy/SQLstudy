/*

SELECT  �˻��� �׸��
FROM    ���̺� ��
WHERE   ����
ORDER BY ���ı���; 

*/



-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���.

SELECT ename || ' ' || job AS enamejob , sal, sal+NVL(comm,0) AS Yeonbong  --sal +NVL(comm,0)�� Yeonbong�̶� �̸����� ������. AS ���� ����.
FROM emp;

-- ������̺��� �μ���ȣ�� ���
SELECT deptno From emp;
SELECT distinct deptno From emp;  --�ߺ� ����


-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT empno,ename,deptno
FROM emp
WHERE deptno=20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
SELECT empno,ename,hiredate
FROM emp
WHERE hiredate>='81/01/01' and hiredate<='81/06/09';
--WHERE hiredate BETWEEN '81/01/01' and '81/06/09'; �ε� �� �� ����.

-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���
SELECT ename,job
FROM emp
WHERE job='SALESMAN' or job= 'CLERK' ; 


-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT *
FROM emp
--WHERE job='president' and sal>1500 or job='salesman'; --���� ������ ��.�ҹ��� ������
WHERE (job='PRESIDENT' and sal>1500)or job='SALESMAN';
select * from emp;

-- �μ���ȣ ������ ������̺� ���

SELECT *
FROM  emp
ORDER BY deptno ; --default �������� asc.
--ORDER by deptno desc; --��������. null�� ���ϸ��� ����.

-- �μ���ȣ ���ĵ� ������ ���� ������ ������̺� ���
SELECT *
FROM  emp
ORDER BY deptno,sal desc ; --�ΰ��� �������� �����ϰ� ���� ���, �켱������ ������ ������ ���� ����.


--�ֱ� �Ի� ������ �����, �޿�, ���� ���
SELECT ename,sal,hiredate
from emp
order by hiredate desc;


-- Ŀ�̼��� ���� ������ ���
SELECT *
from emp
order by nvl(comm,0) desc;


-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���

SELECT ename,sal,comm
from emp
where comm is null  or comm = 0;

-- 8- �̸� A�� �����ϴ� ����� ���

SELECT ename
from emp
where ename like 'A%' ;

-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���

SELECT ename
from emp
where ename like '_L%' ;

-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���

SELECT ename
from emp
where ename like '%L%L%' ;

-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT ename,sal,comm
from emp
where comm is not null ;

-- 12- ���ʽ��� �޿����� 10%�� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���

SELECT ename,sal,comm
from emp
where comm > sal*1.1 ;

-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
SELECT *
from emp
--where (job = 'CLERK' or job = 'ANALYST') and (sal !=1000 and sal !=3000 and sal !=5000) ; --�Ʒ��� ���� �ڵ� ����. 
where job in ('CLERK','ANALYST') and sal not in(1000,3000,5000);

-- 13-1  ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� ��� ����� ������ ���

SELECT *
from emp
--where (job = 'CLERK' or job = 'ANALYST') and (sal =1000 or sal = 3000 or sal = 5000) ; --�Ʒ��� ���� �ڵ� ����. 
where Job in ('CLERK','ANALYST') and sal in (1000,3000,5000);

-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT *
from emp
where deptno =30 or MGR = 7782 ;


select * from emp;