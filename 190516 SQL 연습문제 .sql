--[ scott ���� ]

--1. ������ jones�� ���ų� ������ ford�� ���� �̻��� ����� ������ �̸�, ����, �μ���ȣ, �޿��� ���  
 --��, ������, ������ ���� ������

SELECT job FROM emp WHERE ename = 'JONES';
SELECT sal FROM emp WHERE ename = 'FORD';

SELECT deptno,ename, job,  sal 
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'JONES') OR sal >=(SELECT sal FROM emp WHERE ename = 'FORD')
ORDER BY Job ASC, sal DESC;


--2. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���

SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD');

SELECT ename,job,sal 
FROM emp
WHERE sal = ANY (SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD'));
--WHERE sal in (SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD'));

--3. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���

SELECT DISTINCT e.job FROM emp e INNER JOIN dept d ON e.deptno = d.deptno where loc = 'CHICAGO';

SELECT ename,job 
FROM emp 
WHERE job in(SELECT DISTINCT e.job FROM emp e INNER JOIN dept d ON e.deptno = d.deptno where loc = 'CHICAGO')
ORDER BY job;



--4. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
SELECT deptno,ROUND(avg(SAL)) avg FROM emp GROUP BY deptno;

SELECT e1.deptno, e1.ename, e1.sal
FROM emp e1 INNER JOIN (SELECT deptno, ROUND(avg(SAL)) avg FROM emp GROUP BY deptno) e2
ON e1.deptno = e2.deptno 
where e1.sal > e2.avg ;


--5. ���� ����� ���, �̸�, ����, �μ���ȣ�� ���

SELECT e1.empno, e1.ename, e1.job, e1.deptno,e1.mgr
FROM emp e1
WHERE NOT EXISTS(SELECT*FROM emp e2 WHERE e1.empno=e2.mgr and e2.mgr is not null);


