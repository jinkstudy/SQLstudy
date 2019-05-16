--<< 도전 문제 >>

-- 1. 업무별, 부서별 급여 합계와 인원수를 출력하되, 
   10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
    -- 당연히 grouping 한 column 만 부를 수 있다. 
   
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


--2. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬

 SELECT job, round(avg(sal)) avg,  max(sal) max
 FROM emp
 GROUP BY job
 HAVING round(avg(sal)) >=2000
 ORDER BY avg desc;
 

 
--3. 5개씩 급여합계와 인원수를 출력 (rownum이용)

 SELECT ceil(rownum/5) grp,sum(sal) sum,count(*) cnt
 FROM emp
 group by ceil(rownum/5); -- rownum 을 나누기한 몫을 올림한 숫자로 그룹핑. 즉 1-5 -->1, 6-10 -->2, 11-15--->3 
 
 select rownum, empno, ename from emp;



--4. 같은 입사년도 별로 인원수를 출력

 SELECT to_char(HIREDATE,'YYYY'), count(*) cnt
 FROM emp
 GROUP BY to_char(HIREDATE,'YYYY');
 
 -- 응용
  SELECT to_char(HIREDATE,'YYYY-MM'), count(*) cnt
 FROM emp
 GROUP BY to_char(HIREDATE,'YYYY-MM');


--5. 다음과 같이 출력

--   CLERK     SALESMAN MANAGER       (업무명)
-----------------------------------------------------------------------
--     4           4       3           (인원수)
     
SELECT  sum(decode( job, 'CLERK',1)) as CLERK, 
    sum(decode( job, 'SALESMAN', 1)) as SALESMAN,
    sum(decode( job, 'MANAGER', 1)) as MANAGER
    
FROM emp;

SELECT sum(CASE  job  WHEN 'CLERK' THEN 1  END) as CLERK,
sum(CASE  job  WHEN 'SALESMAN' THEN 1  END) as SALESMAN,
sum(CASE  job  WHEN 'MANAGER' THEN 1  END) as MANAGER
FROM   emp;
 


    

--6. 다음과 같이 출력
/*
업무명  10번부서 20번부서 30번부서 급여합계
----------------------------------------------------------------------------------------
CLERK  1300  1900     950  4150
SALESMAN 0     0    5600   5600
PRESIDENT 5000     0       0  5000
MANAGER    2450  2975    2850  8275
ANALYST     0  6000       0  6000
*/


select job "업무명",
    sum(decode(deptno,10,sal,0)) "10번부서" ,
    sum(decode(deptno,20,sal,0)) "20번부서" ,
    sum(decode(deptno,30,sal,0)) "30번부서" ,
    sum(sal) "급여합계"
from emp
group by job;


SELECT job "업무명",
sum(CASE  deptno  WHEN 10 THEN  sal else 0 END) as "10번부서",
sum(CASE  deptno  WHEN 20 THEN sal else 0 END) as "20번부서",
sum(CASE  deptno  WHEN 30 THEN sal else 0 END) as "30번부서",
sum(sal) "급여합계"
FROM   emp
group by job;



 

