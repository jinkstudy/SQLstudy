--<< �������� >> ��������
--1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
--select sal from emp where ename = 'SCOTT';

select empno, ename,job,sal
from emp
where sal > (select sal from emp where ename = 'SCOTT');

--2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
--select min(sal) from emp where deptno = 30;

select deptno, min(sal) min
from emp
group by deptno
having min(sal) >(select min(sal) from emp where deptno = 30);

--3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
--select job,round(avg(sal)) avg from emp  group by job;
--select min( round(avg(sal))) min_avg from emp  group by job;

select job
from (select job,round(avg(sal)) avg from emp  group by job) e1, (select min( round(avg(sal))) min_avg from emp  group by job) e2
where e1.avg = e2.min_avg;


--4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
--select job from emp where empno = 7521;
--select sal from emp where empno = 7934;

select *
from emp
where job =(select job from emp where empno = 7521) and sal>(select sal from emp where empno = 7934);


--5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ���

select e.ename, e.job, d.dname,d.loc 
from emp e inner join dept d 
on e.deptno=d.deptno 
where e.job= 'MANAGER';

select e.ename, e.job, d.dname,d.loc 
from emp e inner join dept d 
on e.deptno=d.deptno 
where e.job= 'MANAGER';


--6. 'WARD'�� �μ��� ������ ���� ��� ��� ���
--select deptno, job from emp where ename = 'WARD';

select *
from emp e1,(select deptno, job from emp where ename = 'WARD') e2
where e1.deptno =e2.deptno and e1.job = e2.job;
