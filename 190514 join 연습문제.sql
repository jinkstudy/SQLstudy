--<< 기초 문제 >> scott 계정

--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력

--1) INNER JOIN
--기존
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno = d.deptno;

-- 표준화
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

--2)OUTER JOIN 

--2-1)LEFT OUTER JOIN (deptno이 없는 사원에 대해서도 출력 하고싶은 경우)
--기존
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno = d.deptno(+);

-- 표준화
--기존
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e LEFT OUTER JOIN dept d
on e.deptno = d.deptno;

--2-2)RIGHT OUTER JOIN (deptno 40에 해당하는 사원이 없더라도 출력하고 싶은 경우)
--기존
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e,dept d
WHERE e.deptno(+) = d.deptno;


-- 표준화
--기존
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e RIGHT OUTER JOIN dept d
on e.deptno = d.deptno;

--2-3)FULL OUTER JOIN (모든 데이터 출력하고 싶은 경우)
-- 표준화
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, d.loc loc  
from emp e FULL OUTER JOIN dept d
on e.deptno = d.deptno;


--2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력

--기존
select e.empno empno, e.ename ename, e.sal sal, d.dname dname, d.loc loc  
from emp e,dept d
WHERE (e.deptno = d.deptno) and e.job = 'SALESMAN';

--표준화

select e.empno empno, e.ename ename, e.sal sal, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno) 
where e.job = 'SALESMAN';

--3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
--기존
select e.ename ename, d.dname dname, d.loc loc  
from emp e, dept d
WHERE (e.deptno = d.deptno) and nvl(e.comm,0) <> 0;

--표준화
select e.ename ename, d.dname dname, d.loc loc  
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno) 
where nvl(e.comm,0) <> 0;

--4. 부서별 부서명과 급여 합계를 출력

--INNER JOIN (양쪽 모두 있는 경우에만 출력)
--기존
select d.dname dname, sum(sal) sum 
from emp e ,dept d
where (e.deptno = d.deptno)
GROUP BY d.dname;

--표준화
select d.dname dname, sum(sal) sum 
from emp e INNER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;

--RIGHT OUTER JOIN (모든 부서명에 대해서 합계를 나타내고 싶을 때)
--기존
select d.dname dname, sum(sal) sum 
from emp e, dept d
where (e.deptno(+) = d.deptno)
GROUP BY d.dname;

--표준화

select d.dname dname, sum(sal) sum 
from emp e RIGHT OUTER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;

--LEFT OUTER JOIN (부서가 없는 사원들에 대한 합계도 나타내고 싶을 때)
--기존
select d.dname dname, sum(sal) sum 
from emp e, dept d
where (e.deptno = d.deptno(+))
GROUP BY d.dname;

--표준화

select d.dname dname, sum(sal) sum 
from emp e LEFT OUTER JOIN dept d
ON (e.deptno = d.deptno)
GROUP BY d.dname;


