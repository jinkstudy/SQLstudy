

-- 사원명, 급여, 월급(급여/12) 를 출력하되 월급은 ㅅ비단위에서 반올림하여 출력

SELECT ename,sal,round(sal/12,-2)
From emp;

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위로 절삭하고 출력

SELECT ename, sal, trunc(sal*0.033,-1) as TAX
From emp;


--공백 제거

select  '-' || trim(' 이순신 ')|| '-' as col1, --양쪽공백제거
                       '-'|| ltrim(' 이순신 ') || '-' as col2, --왼쪽 공백제거
                       '-'|| rtrim(' 이순신 ') || '-' as col3  --오른쪽 공백제거
from dual; --dual : 가상 테이블.

select sysdate from dual; --가상테이블 이용해서 현재 날짜 확인.

--월급을 숫자에서 '영일이삼사오육칠팔구' 글자로 대체
SELECT translate(sal, '0123456789','영일이삼사오육칠팔구')
FROM emp;

--월급의 숫자에서 0을 '$'로 바꾸어 출력
SELECT replace(sal, 0,'$')
FROM emp;

SELECT '-' || replace('이 순 신',' ','') || '-' as col
From dual;

SELECT * From emp;
 -- smith의정보를 사원번호, 성명, 담당업무(소문자) 출력

SELECT empno,ename,lower(job) as job
from emp
where ename = 'SMITH';
          

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만대문자)로 출력
SELECT empno,INITCAP (ename)as ename ,INITCAP (job) as job
from emp;
          

-- 이름의 첫글자가 ‘K’보다크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
SELECT empno,ename, job,sal,deptno
from emp
where SUBSTR (ename, 1, 1) > 'K' AND SUBSTR (ename, 1, 1)<'Y' 
Order by ename;
          

 

-- 이름이 5글자 이상인사원들을 출력

 select * 
 from emp
 where LENGTH(ENAME)>=5;

 

-- 이름을 15자로 맞추고글자는 왼쪽에 오른쪽에는 ‘*’로 채운다

 select rpad(ename,15,'*') as ename
 from emp;

-- 월급은 10자로 맞추고숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
select lpad(sal,10,'-') as sal
from emp;

Insert into emp(empno,ename,sal)VALUES (8000,'홍길동',10000);
Insert into emp(empno,ename,sal)VALUES (8001,'홍길자',6000);

-- 현재까지 근무일 수가 많은 사람 순으로 출력
SELECT *
FROM emp
ORDER BY sysdate-nvl(hiredate,sysdate) desc;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
select ename,trunc((sysdate - hiredate)/7) as week, ceil(mod((sysdate - hiredate), 7)) as day
--select (sysdate - hiredate)/7 as week, mod((sysdate - hiredate), 7) as day
from emp;


-- 10번 부서의 사원의 현재까지의 근무 월수를 계산
select ename,Trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) as months

from emp
where deptno = 10;
          
-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
select next_day(sysdate,'화')from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day(sysdate) from dual;

-- 입사일자에서 입사년도를 출력
select ename,hiredate, to_char(hiredate,'YYYY') as hireyear
from emp; --년출력

select ename,hiredate, to_char(hiredate,'MM') as hireyear
from emp; -- 월출력
 
select ename,hiredate, to_char(hiredate,'YYYY-MM') as hiremonth
from emp; -- 년월출력  

select ename,hiredate, to_char(hiredate,'DD') as hireday
from emp; -- 일출력   


-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
select ename,
(to_char(hiredate,'YYYY') || '년'||to_char(hiredate,'MM')||'월'|| to_char(hiredate,'DD')|| '일' )as hirdate
from emp;

select ename,
to_char(hiredate,'YYYY"년" MM"월" DD"일"') as hirdate
from emp;
          

-- 1981년도에 입사한 사원 검색

select ename,hiredate
from emp
where to_char(hiredate,'YYYY')='1981';


-- 5월에 입사한 사원 검색
select ename,hiredate
from emp
where to_char(hiredate,'MM')='05';
 

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
select ename,('$'|| TO_char(sal, '99,999')) as sal 
from emp;

-- decode 조건 함수.

SELECT  decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자')AS  gender  
FROM info;

-- case when then end

SELECT  CASE  substr(jumin, 8, 1)
         WHEN '1' THEN '남자'
         WHEN'3' THEN '남자'
         ELSE '여자'
         END    as gender
FROM   info;

-- 부서번호가 10이면영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
SELECT  ename,decode( deptno, 10, '영업부', 20, '관리부',30,'IT','기술부')AS  ubmu 
FROM emp;

SELECT  ename, CASE  deptno
         WHEN 10 THEN '영업부'
         WHEN 20 THEN '관리부'
         WHEN 30 THEN 'IT'
         ELSE '기술부'
         END    as  ubmu 
FROM   emp;
          

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력

SELECT  empno,ename,job,sal,decode( job, 'ANALYST', sal*1.1 , 'CLERK', sal*1.15 ,'MANEGER', sal*1.2) as sal2
FROM emp;

SELECT  empno,ename,job,sal, CASE  job
         WHEN 'ANALYST' THEN sal *1.1
         WHEN 'CLERK' THEN sal*1.15
         WHEN 'MANAGER' THEN sal*1.2
         
         END    as  sal2 
FROM   emp;

