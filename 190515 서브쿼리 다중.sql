--업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름,담당업무, 급여를 출력

 --(1) 업무별로 최소 급여
 
 SELECT MIN(sal) min FROM emp GROUP BY job;
 
 SELECT empno,ename,job,sal
 FROM emp
 WHERE sal IN (SELECT MIN(sal) min FROM emp GROUP BY job) ;  --잘못된 쿼리 ,업무에 대한 조건이 없어지므로.
 
 SELECT empno,ename,job,sal
 FROM emp
 WHERE (job,sal) IN (SELECT job,MIN(sal) min FROM emp GROUP BY job) ;  --업무에 대한 조건 추가.
 
 -- 10번 부서사원들의 업무와 동일한 직원들 검색
 
 SELECT job from emp where deptno = 10;
 
 -- 하나라도 맞는 경우. any or IN
 
 SELECT *
 FROM EMP
 WHERE job IN (SELECT job from emp where deptno = 10);
  
 SELECT *
 FROM EMP
 WHERE job = ANY (SELECT job from emp where deptno = 10);
 
 
 --  부서별의 최소급여를 받는 사원보다 많은 급여를 받는 사원의 정보 출력
 
 SELECT min(sal) min FROM emp group by deptno;
 
 SELECT *
 FROM emp
 WHERE sal >  (SELECT min(sal) min FROM emp  group by deptno);
 
 
   --적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
   
  select * from emp e2, emp e where e2.mgr =e.empno; 
  
  SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE exists ( select * from emp e2 where e2.mgr =e.empno); 
  
  
  -- 부하직원이 없는 사원들을 검색
 select * from emp e2, emp e where e2.mgr =e.empno;
 
   select * from  emp e where e2.mgr =e.empno; 
   
  SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE not exists ( select * from emp e2 where e2.mgr =e.empno); 
  
  
  select * from  emp e where e.mgr =e.empno;
  
    SELECT e.empno, e.ename, e.job
  FROM emp e
  WHERE  not exists ( select * from emp e where e.mgr =e.empno); 
  
  
  -- (1) 부서별 급여통계 테이블 생성
  
  create table stat_salary (
           stat_date   date  not  null,        -- 날짜
           dept_no   number,                    --부서
           emp_count number,      --사원수
           tot_salary number,        --급여총액
           avg_salary number );     -- 급여평균
           
 --(2) 날짜와 부서번호 입력 
 Insert into stat_salary(stat_date,dept_no)
    select sysdate, deptno From dept;
  
  
 select * from stat_salary;
 
 --(3) 사원수, 급여총액, 평균급여 입력
 
 update stat_salary s
 set (s.emp_count, s.tot_salary,s.avg_salary ) 
 
 = (
 select count(*), sum(sal), avg(sal) from emp e where e.deptno = s.dept_no group by deptno
 );
 
 create table emp_copy as select * from emp;
 
 select * from emp_copy;
 
 --1. scott의 업무와 급여로 jones의 업무와 급여를 수정
 
 select job,sal from emp_copy where ename = 'SCOTT';
 
 update emp_copy e1
 set (e1.job, e1.sal )  = (
 select job,sal from emp_copy where ename = 'SCOTT'
 )
 where e1.ename = 'JONES';
 
 
  --2. 부서명이 sales 인 사원의 정보를 삭제
   
   select deptno from dept where dname = 'SALES';
   
   DELETE FROM emp_copy e1
   WHERE e1.deptno = (select deptno from dept where dname = 'SALES');
   
   
  -- 3.  King에게 보고하는 모든 사원의 이름과 급여를 출력
 SELECT EMPNO FROM EMP WHERE ENAME = 'KING';
 
SELECT ename, sal, mgr
FROM EMP 
WHERE mgr = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');


-- 4. 월급이 30번 부서의 최저 월급보다 많은 사원들을 출력

SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;

SELECT *
FROM EMP
WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);


-- 5. 10번 부서의 직원들 중 30번 부서의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력
 
 SELECT job FROM EMP WHERE deptno = 30;
   
   
   