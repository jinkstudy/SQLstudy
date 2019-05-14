 --������̺�(emp)�� ������ �μ����̺�(dept)�� �� ����� �μ����� ���
 
 SELECT ename, dname
 From emp, dept;  --Cartesian Product
 
 --�������� : ���̺� �����Ͱ� �´� ��쿡��, �����ϴ� ��.
 
 -- �ϳ��̻��� ���̺��� �ڷḦ �ҷ��ö� : JOIN. --foriegn Ű �ƴϾ �ҷ��� �� �ִ�.
 Select emp.ename, dept. dname , emp.deptno   --deptno�� emp�� dept �α����� �� ��������Ƿ�, ��Ȯ�� ��� ���̺��� �ڷ����� ��Ȯ�� �������!
 from emp ,dept
 where emp.deptno = dept.deptno; --�����̺��� �����!
 
 --table �� ��Ī �ο�, �ο��� ��Ī ������ ���� ����
 
 Select e.ename ename, d. dname dname , e.deptno deptno  --deptno�� emp�� dept �α����� �� ��������Ƿ�, ��Ȯ�� ��� ���̺��� �ڷ����� ��Ȯ�� �������!
 from emp e,dept d  --table �� ��Ī �ο�
 where e.deptno = d.deptno; 
 
 -- �ܺ����� : ���ڵ� ��ġ ���� �ʴ��� ��� �������ο� (+) �߰�. 
 
 --dept ���̺��� ���� ��쿡�� ������ ���Ҷ�. �� emp�� 40�� �ִµ�, dept�� 40�� ���°�� ��� -- �ٽ�Ȯ��
  Select emp.ename, dept. dname , emp.deptno   --deptno�� emp�� dept �α����� �� ��������Ƿ�, ��Ȯ�� ��� ���̺��� �ڷ����� ��Ȯ�� �������!
 from emp ,dept
 where emp.deptno = dept.deptno(+);  
 
 -- emp ���̺��� ���� ��쿡�� ������ ���Ҷ�.  �� dept�� 40�� �ִµ�, emp�� 40�� ���°�� ��� -- �ٽ�Ȯ��
   Select emp.ename, dept. dname , emp.deptno   --deptno�� emp�� dept �α����� �� ��������Ƿ�, ��Ȯ�� ��� ���̺��� �ڷ����� ��Ȯ�� �������!
 from emp ,dept
 where emp.deptno(+) = dept.deptno; 
 
 -- ANSI ����(ǥ��ȭ)
 
 --��������.
 -- ������ ���� ������ WHERE ��� ON����.
 
 --���� �ڵ�
 Select e.ename ename, d. dname dname , e.deptno deptno 
 from emp e,dept d  
 where e.deptno = d.deptno;
 
 -- ǥ��ȭ�� �ڵ� (������ up)
 select e.ename, d.dname, d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

--�ܺ�����

 --���� �ڵ�
Select emp.ename, dept. dname , emp.deptno   --deptno�� emp�� dept �α����� �� ��������Ƿ�, ��Ȯ�� ��� ���̺��� �ڷ����� ��Ȯ�� �������!
from emp ,dept
where emp.deptno = dept.deptno(+);  

 -- ǥ��ȭ�� �ڵ�  left outer join
select e.ename, d.dname, d.deptno
from emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

 --���� �ڵ�
Select emp.ename, dept. dname , emp.deptno   
 from emp ,dept
 where emp.deptno(+) = dept.deptno; 
 
 -- ǥ��ȭ�� �ڵ�  rignt outer join
select e.ename, d.dname, d.deptno
from emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;


--FULL outer join

--�����ڵ�
Select emp.ename, dept. dname , emp.deptno   
 from emp ,dept
 where emp.deptno(+) = dept.deptno(+);  ---����! �Ұ�

 -- ǥ��ȭ�� �ڵ� FULL outer join
 select e.ename, d.dname, d.deptno
from emp e FULL OUTER JOIN dept d
ON e.deptno = d.deptno;

 -- self join (���� ���̺��� ������ ������Ѽ� �˻��ϰ� �� �� ��)
 -- �� ����� �Ŵ����� �˻� 
 --emp ���̺��� �ΰ� ��� ����. 
 
 --��������
 
 --�����ڵ�
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- �ΰ��� ���̺� �� ��� ������ ���� �� �� ��Ȯ�� ǥ��������Ѵ�.
from emp e1,emp e2 
WHERE e1.mgr = e2.empno;
 --ǥ��
 
 select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  
from emp e1 inner join emp e2 
on e1.mgr = e2.empno;
 
 
 --�ܺ�����
 -- ���� mgr�� �������� ���� ����� ������ �ϰ� �ʹ�. e2�� (+) �߰�.
 
 --����
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- �ΰ��� ���̺� �� ��� ������ ���� �� �� ��Ȯ�� ǥ��������Ѵ�.
from emp e1,emp e2 
WHERE e1.mgr = e2.empno(+); 

--ǥ��ȭ
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- �ΰ��� ���̺� �� ��� ������ ���� �� �� ��Ȯ�� ǥ��������Ѵ�.
from emp e1 LEFT OUTER JOIN emp e2 
ON e1.mgr = e2.empno; 


/*
union ������ (������ �ѹ� ����)
union all ������ (������ ���� x)
Intersect ������
minus ������
*/

--������ clerk�� ����� ���, �����, ����, �μ���ȣ

select empno, ename, job,deptno 
from emp
where job = 'CLERK';

-- 10�� �μ��� ���, �����, ����, �μ���ȣ 

select empno, ename, job,deptno 
from emp
where deptno =10;

-- union column���� �¾ƾ� �� �� ����.
select empno, ename, job,deptno 
from emp
where job = 'CLERK'
union
select empno, ename, job,deptno 
from emp
where deptno =10;

-- union all 
select empno, ename, job,deptno 
from emp
where job = 'CLERK'
union all
select empno, ename, job,deptno 
from emp
where deptno =10;

--INTERSECT

select empno, ename, job,deptno 
from emp
where job = 'CLERK'
intersect
select empno, ename, job,deptno 
from emp
where deptno =10;




