--<< 연습문제 >> 서브쿼리
--1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
--select sal from emp where ename = 'SCOTT';

select empno, ename,job,sal
from emp
where sal > (select sal from emp where ename = 'SCOTT');

--2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력
--select min(sal) from emp where deptno = 30;

select deptno, min(sal) min
from emp
group by deptno
having min(sal) >(select min(sal) from emp where deptno = 30);

--3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력
--select job,round(avg(sal)) avg from emp  group by job;
--select min( round(avg(sal))) min_avg from emp  group by job;

select job
from (select job,round(avg(sal)) avg from emp  group by job) e1, (select min( round(avg(sal))) min_avg from emp  group by job) e2
where e1.avg = e2.min_avg;


--4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력
--select job from emp where empno = 7521;
--select sal from emp where empno = 7934;

select *
from emp
where job =(select job from emp where empno = 7521) and sal>(select sal from emp where empno = 7934);


--5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력

select e.ename, e.job, d.dname,d.loc 
from emp e inner join dept d 
on e.deptno=d.deptno 
where e.job= 'MANAGER';

select e.ename, e.job, d.dname,d.loc 
from emp e inner join dept d 
on e.deptno=d.deptno 
where e.job= 'MANAGER';


--6. 'WARD'와 부서와 업무가 같은 사원 명단 출력
--select deptno, job from emp where ename = 'WARD';

select *
from emp e1,(select deptno, job from emp where ename = 'WARD') e2
where e1.deptno =e2.deptno and e1.job = e2.job;
