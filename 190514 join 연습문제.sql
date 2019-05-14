--<< ���� ���� >> scott ����

--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���

--1) INNER JOIN
--����
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno = d.deptno;

-- ǥ��ȭ
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

--2)OUTER JOIN 

--2-1)LEFT OUTER JOIN (deptno�� ���� ����� ���ؼ��� ��� �ϰ���� ���)
--����
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno = d.deptno(+);

-- ǥ��ȭ
--����
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e LEFT OUTER JOIN dept d
on e.deptno = d.deptno;

--2-2)RIGHT OUTER JOIN (deptno 40�� �ش��ϴ� ����� ������ ����ϰ� ���� ���)
--����
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno(+) = d.deptno;


-- ǥ��ȭ
--����
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e RIGHT OUTER JOIN dept d
on e.deptno = d.deptno;

--2-3)FULL OUTER JOIN (��� ������ ����ϰ� ���� ���)
-- ǥ��ȭ
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e FULL OUTER JOIN dept d
on e.deptno = d.deptno;


--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���

--����
select e.empno empno, e.ename ename, e.sal sal, d.dname dname, d.loc loc  
from emp e,dept d
WHERE (e.deptno = d.deptno) and e.job = 'SALESMAN';

--ǥ��ȭ

select e.empno empno, e.ename ename, e.sal sal, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno) 
where e.job = 'SALESMAN';

--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
--����
select e.ename ename, d.dname dname, d.loc loc  
from emp e, dept d
WHERE (e.deptno = d.deptno) and nvl(e.comm,0) <> 0;

--ǥ��ȭ
select e.ename ename, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno) 
where nvl(e.comm,0) <> 0;

--4. �μ��� �μ���� �޿� �հ踦 ���

--INNER JOIN (���� ��� �ִ� ��쿡�� ���)
--����
select d.dname dname, sum(sal) sum 
from emp e ,dept d
where (e.deptno = d.deptno)
GROUP BY d.dname;

--ǥ��ȭ
select d.dname dname, sum(sal) sum 
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;

--RIGHT OUTER JOIN (��� �μ��� ���ؼ� �հ踦 ��Ÿ���� ���� ��)
--����
select d.dname dname, sum(sal) sum 
from emp e, dept d
where (e.deptno(+) = d.deptno)
GROUP BY d.dname;

--ǥ��ȭ

select d.dname dname, sum(sal) sum 
from emp e RIGHT OUTER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;

--LEFT OUTER JOIN (�μ��� ���� ����鿡 ���� �հ赵 ��Ÿ���� ���� ��)
--����
select d.dname dname, sum(sal) sum 
from emp e, dept d
where (e.deptno = d.deptno(+))
GROUP BY d.dname;

--ǥ��ȭ

select d.dname dname, sum(sal) sum 
from emp e LEFT OUTER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;


