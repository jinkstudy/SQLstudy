--[ scott 계정 ]

--1. 업무가 jones와 같거나 월급이 ford의 월급 이상인 사원의 정보를 이름, 업무, 부서번호, 급여를 출력  
 --단, 업무별, 월급이 많은 순으로

SELECT job FROM emp WHERE ename = 'JONES';
SELECT sal FROM emp WHERE ename = 'FORD';

SELECT deptno,ename, job,  sal 
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'JONES') OR sal >=(SELECT sal FROM emp WHERE ename = 'FORD')
ORDER BY Job ASC, sal DESC;


--2. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력

SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD');

SELECT ename,job,sal 
FROM emp
WHERE sal = ANY (SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD'));
--WHERE sal in (SELECT sal FROM emp WHERE ename in( 'SCOTT','WARD'));

--3. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력

SELECT DISTINCT e.job FROM emp e INNER JOIN dept d ON e.deptno = d.deptno where loc = 'CHICAGO';

SELECT ename,job 
FROM emp 
WHERE job in(SELECT DISTINCT e.job FROM emp e INNER JOIN dept d ON e.deptno = d.deptno where loc = 'CHICAGO')
ORDER BY job;



--4. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
SELECT deptno,ROUND(avg(SAL)) avg FROM emp GROUP BY deptno;

SELECT e1.deptno, e1.ename, e1.sal
FROM emp e1 INNER JOIN (SELECT deptno, ROUND(avg(SAL)) avg FROM emp GROUP BY deptno) e2
ON e1.deptno = e2.deptno 
where e1.sal > e2.avg ;


--5. 말단 사원의 사번, 이름, 업무, 부서번호를 출력

SELECT e1.empno, e1.ename, e1.job, e1.deptno,e1.mgr
FROM emp e1
WHERE NOT EXISTS(SELECT*FROM emp e2 WHERE e1.empno=e2.mgr and e2.mgr is not null);


