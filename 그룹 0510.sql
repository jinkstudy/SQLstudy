--rownum 가상 컬럼.
SELECT rownum,empno,ename FROM emp  
where rownum<=5;


-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기

 SELECT avg(sal)as avg, sum(sal) as sum, min(sal) as min, max(sal) max
 FROM   emp
 WHERE job = 'SALESMAN';

-- 집계 함수는 null 값도 알아서 처리해줌. 
 INSERT INTO emp(empno, ename, job) VALUES (9988,'홍홍이','SALESMAN');

 --커미션(COMM)을 받는 사람들의 수는
 SELECT count(empno) as count  --SELECT count(*) as count
 FROM   emp
whERE comm is not null and comm !=0;
--where nvl(comm,0)<>0;
 
 /*
 SELECT columns
 FROM table_name
 WHERE condition
 GROUP BY group_by_expression
 HAVING condition
 ORDER By column;
 */
 
 
 --부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
SELECT deptno, count(*) cnt, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
 FROM emp

 GROUP BY deptno; -- 당연히 grouping 한 column 만 부를 수 있다. 
 
  --부서별,job별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
 SELECT deptno,job, count(*) cnt, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
 FROM emp
 GROUP BY deptno,job; -- 당연히 grouping 한 column 만 부를 수 있다. 
 
 
-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 (부서별 급여의 합이 높은 순으로

SELECT deptno, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum 
 FROM emp
 GROUP BY deptno
 ORDER By sum desc; 
          

 -- 부서별업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
 
SELECT deptno,job, count(*) cnt, round(avg(sal)) avg, sum(sal) sum
 FROM emp

 GROUP BY deptno,job;
          

-- 급여가 최대 2900 이상인부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
SELECT deptno, round(avg(sal)) avg,  sum(sal) sum 
 FROM emp
  GROUP BY deptno
 HAVING max(sal) >=2900; 

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력

SELECT job, round(avg(sal)) avg,   sum(sal) sum 
 FROM emp
 GROUP BY job 
 HAVING round(avg(sal)) >=3000;

-- 전체 합계 급여가 5000를초과하는 각 업무에 대해서 업무와 급여 합계를 출력
--단, SALESMAN은제외하고 급여 합계가 높은 순으로 정렬

SELECT job, sum(sal) sum 
 FROM emp
 where job !='SALESMAN' 
 GROUP BY job 
 HAVING  sum(sal) >5000
 ORDER BY sum desc;
 

--  업무별최고 급여와 최소 급여의 차이를 구하라

SELECT job, max(sal)-min(sal) Diff
 FROM emp
 GROUP BY job ;

 

-- 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력

 SELECT deptno,count(*),sum(sal) sum 
 FROM emp
 GROUP BY deptno 
 HAVING  count(*)>4;

 
 
 
 
