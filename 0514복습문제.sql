--<< ���� ���� >>

-- 1. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
   10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
    -- �翬�� grouping �� column �� �θ� �� �ִ�. 
   
 SELECT deptno,job,sum(sal) sum,count(*) cnt
 FROM emp
 WHERE deptno <> 10
 GROUP BY job,deptno
 HAVING  job = 'SALESMAN' or job = 'MANAGER';
 
 SELECT deptno,job,sum(sal) sum,count(*) cnt
 FROM emp
 GROUP BY job,deptno
 HAVING  (job = 'SALESMAN' or job = 'MANAGER') and deptno != 10;
 
  
 SELECT deptno,job,sum(sal) sum,count(*) cnt
 FROM emp
 where job in ('SALESMAN', 'MANAGER') and deptno <> 10
 GROUP BY job,deptno;


--2. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����

 SELECT job, round(avg(sal)) avg,  max(sal) max
 FROM emp
 GROUP BY job
 HAVING round(avg(sal)) >=2000
 ORDER BY avg desc;
 

 
--3. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)

 SELECT ceil(rownum/5) grp,sum(sal) sum,count(*) cnt
 FROM emp
 group by ceil(rownum/5); -- rownum �� �������� ���� �ø��� ���ڷ� �׷���. �� 1-5 -->1, 6-10 -->2, 11-15--->3 
 
 select rownum, empno, ename from emp;



--4. ���� �Ի�⵵ ���� �ο����� ���

 SELECT to_char(HIREDATE,'YYYY'), count(*) cnt
 FROM emp
 GROUP BY to_char(HIREDATE,'YYYY');
 
 -- ����
  SELECT to_char(HIREDATE,'YYYY-MM'), count(*) cnt
 FROM emp
 GROUP BY to_char(HIREDATE,'YYYY-MM');


--5. ������ ���� ���

--   CLERK     SALESMAN MANAGER       (������)
-----------------------------------------------------------------------
--     4           4       3           (�ο���)
     
SELECT  sum(decode( job, 'CLERK',1)) as CLERK, 
    sum(decode( job, 'SALESMAN', 1)) as SALESMAN,
    sum(decode( job, 'MANAGER', 1)) as MANAGER
    
FROM emp;

SELECT sum(CASE  job  WHEN 'CLERK' THEN 1  END) as CLERK,
sum(CASE  job  WHEN 'SALESMAN' THEN 1  END) as SALESMAN,
sum(CASE  job  WHEN 'MANAGER' THEN 1  END) as MANAGER
FROM   emp;
 


    

--6. ������ ���� ���
/*
������  10���μ� 20���μ� 30���μ� �޿��հ�
----------------------------------------------------------------------------------------
CLERK  1300  1900     950  4150
SALESMAN 0     0    5600   5600
PRESIDENT 5000     0       0  5000
MANAGER    2450  2975    2850  8275
ANALYST     0  6000       0  6000
*/


select job "������",
    sum(decode(deptno,10,sal,0)) "10���μ�" ,
    sum(decode(deptno,20,sal,0)) "20���μ�" ,
    sum(decode(deptno,30,sal,0)) "30���μ�" ,
    sum(sal) "�޿��հ�"
from emp
group by job;


SELECT job "������",
sum(CASE  deptno  WHEN 10 THEN  sal else 0 END) as "10���μ�",
sum(CASE  deptno  WHEN 20 THEN sal else 0 END) as "20���μ�",
sum(CASE  deptno  WHEN 30 THEN sal else 0 END) as "30���μ�",
sum(sal) "�޿��հ�"
FROM   emp
group by job;



 

