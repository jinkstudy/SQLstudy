/*

SELECT  검색할 항목들
FROM    테이블 명
WHERE   조건
ORDER BY 정렬기준; 

*/



-- 모든 사원의 사원명과 급여, 급여와 보너스를 더한 합계 출력.

SELECT ename || ' ' || job AS enamejob , sal, sal+NVL(comm,0) AS Yeonbong  --sal +NVL(comm,0)을 Yeonbong이란 이름으로 가져옴. AS 생략 가능.
FROM emp;

-- 사원테이블에서 부서번호를 출력
SELECT deptno From emp;
SELECT distinct deptno From emp;  --중복 제거


-- 1- 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
SELECT empno,ename,deptno
FROM emp
WHERE deptno=20;

-- 2- 입사일이 81/01/01에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력
SELECT empno,ename,hiredate
FROM emp
WHERE hiredate>='81/01/01' and hiredate<='81/06/09';
--WHERE hiredate BETWEEN '81/01/01' and '81/06/09'; 로도 쓸 수 있음.

-- 3- 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력
SELECT ename,job
FROM emp
WHERE job='SALESMAN' or job= 'CLERK' ; 


-- 4- 업무가 president이고 급여가 1500이상이거나 업무가 salesman인 사원의 정보를 출력
SELECT *
FROM emp
--WHERE job='president' and sal>1500 or job='salesman'; --안의 내용은 대.소문자 구분함
WHERE (job='PRESIDENT' and sal>1500)or job='SALESMAN';
select * from emp;

-- 부서번호 순으로 사원테이블 출력

SELECT *
FROM  emp
ORDER BY deptno ; --default 오름차순 asc.
--ORDER by deptno desc; --내림차순. null이 제일먼저 나옴.

-- 부서번호 정렬된 월급이 높은 순으로 사원테이블 출력
SELECT *
FROM  emp
ORDER BY deptno,sal desc ; --두개의 기준으로 정렬하고 싶은 경우, 우선적으로 정렬할 기준을 먼저 쓴다.


--최근 입사 순으로 사원명, 급여, 일자 출력
SELECT ename,sal,hiredate
from emp
order by hiredate desc;


-- 커미션이 높은 순으로 출력
SELECT *
from emp
order by nvl(comm,0) desc;


-- 6- 커미션(comm)이 없는 사원의 이름, 급여, 커미션을 출력

SELECT ename,sal,comm
from emp
where comm is null  or comm = 0;

-- 8- 이름 A로 시작하는 사원명 출력

SELECT ename
from emp
where ename like 'A%' ;

-- 9- 이름이 두번째 문자가 L인 사원명 출력

SELECT ename
from emp
where ename like '_L%' ;

-- 10- 이름에 L이 두 번 이상 포함된 사원명 출력

SELECT ename
from emp
where ename like '%L%L%' ;

-- 11- 커미션(COMM)이 NULL이 아닌 사원의 모든 정보를 출력
SELECT ename,sal,comm
from emp
where comm is not null ;

-- 12- 보너스가 급여보다 10%가 많은 모든 사원에 대해 이름, 급여, 보너스를 출력

SELECT ename,sal,comm
from emp
where comm > sal*1.1 ;

-- 13- 업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000이 아닌 모든 사원의 정보를 출력
SELECT *
from emp
--where (job = 'CLERK' or job = 'ANALYST') and (sal !=1000 and sal !=3000 and sal !=5000) ; --아래와 같이 코딩 가능. 
where job in ('CLERK','ANALYST') and sal not in(1000,3000,5000);

-- 13-1  업무가 clerk이거나 analyst이고 급여가 1000, 3000, 5000인 모든 사원의 정보를 출력

SELECT *
from emp
--where (job = 'CLERK' or job = 'ANALYST') and (sal =1000 or sal = 3000 or sal = 5000) ; --아래와 같이 코딩 가능. 
where Job in ('CLERK','ANALYST') and sal in (1000,3000,5000);

-- 14- 부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
SELECT *
from emp
where deptno =30 or MGR = 7782 ;


select * from emp;