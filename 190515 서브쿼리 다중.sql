--�������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�,������, �޿��� ���

 --(1) �������� �ּ� �޿�
 
 SELECT MIN(sal) min FROM emp GROUP BY job;
 
 SELECT empno,ename,job,sal
 FROM emp
 WHERE sal IN (SELECT MIN(sal) min FROM emp GROUP BY job) ;  --�߸��� ���� ,������ ���� ������ �������Ƿ�.
 
 SELECT empno,ename,job,sal
 FROM emp
 WHERE (job,sal) IN (SELECT job,MIN(sal) min FROM emp GROUP BY job) ;  --������ ���� ���� �߰�.
 
 -- 10�� �μ�������� ������ ������ ������ �˻�
 
 SELECT job from emp where deptno = 10;
 
 -- �ϳ��� �´� ���. any or IN
 
 SELECT *
 FROM EMP
 WHERE job IN (SELECT job from emp where deptno = 10);
  
 SELECT *
 FROM EMP
 WHERE job = ANY (SELECT job from emp where deptno = 10);
 
 
 --  �μ����� �ּұ޿��� �޴� ������� ���� �޿��� �޴� ����� ���� ���
 
 SELECT min(sal) min FROM emp group by deptno;
 
 SELECT *
 FROM emp
 WHERE sal >  (SELECT min(sal) min FROM emp  group by deptno);
 
 
   --��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
   
  select * from emp e2, emp e where e2.mgr =e.empno; 
  
  SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE exists ( select * from emp e2 where e2.mgr =e.empno); 
  
  
  -- ���������� ���� ������� �˻�
 select * from emp e2, emp e where e2.mgr =e.empno;
 
   select * from  emp e where e2.mgr =e.empno; 
   
  SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE not exists ( select * from emp e2 where e2.mgr =e.empno); 
  
  
  select * from  emp e where e.mgr =e.empno;
  
    SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE  not exists ( select * from emp e where e.mgr =e.empno); 
  
  
  -- (1) �μ��� �޿���� ���̺� ����
  
  create table stat_salary (
           stat_date   date  not  null,        -- ��¥
           dept_no   number,                    --�μ�
           emp_count number,      --�����
           tot_salary number,        --�޿��Ѿ�
           avg_salary number );     -- �޿����
           
 --(2) ��¥�� �μ���ȣ �Է� 
 Insert into stat_salary(stat_date,dept_no)
    select sysdate, deptno From dept;
  
  
 select * from stat_salary;
 
 --(3) �����, �޿��Ѿ�, ��ձ޿� �Է�
 
 update stat_salary s
 set (s.emp_count, s.tot_salary,s.avg_salary ) 
 
 = (
 select count(*), sum(sal), avg(sal) from emp e where e.deptno = s.dept_no group by deptno
 );
 
 create table emp_copy as select * from emp;
 
 select * from emp_copy;
 
 --1. scott�� ������ �޿��� jones�� ������ �޿��� ����
 
 select job,sal from emp_copy where ename = 'SCOTT';
 
 update emp_copy e1
 set (e1.job, e1.sal )  = (
 select job,sal from emp_copy where ename = 'SCOTT'
 )
 where e1.ename = 'JONES';
 
 
  --2. �μ����� sales �� ����� ������ ����
   
   select deptno from dept where dname = 'SALES';
   
   DELETE FROM emp_copy e1
   WHERE e1.deptno = (select deptno from dept where dname = 'SALES');
   
   
  -- 3.  King���� �����ϴ� ��� ����� �̸��� �޿��� ���
 SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
 
SELECT ename, sal, mgr
FROM EMP 
WHERE mgr = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');


-- 4. ������ 30�� �μ��� ���� ���޺��� ���� ������� ���

SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;

SELECT *
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);


-- 5. 10�� �μ��� ������ �� 30�� �μ��� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ���
 
 SELECT job FROM EMP WHERE deptno = 30;
   
   
   