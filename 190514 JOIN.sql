 --사원테이블(emp)에 사원명과 부서테이블(dept)에 그 사원의 부서명을 출력
 
 SELECT ename, dname
 From emp, dept;  --Cartesian Product
 
 --내부조인 : 테이블간 데이터가 맞는 경우에만, 조인하는 것.
 
 -- 하나이상의 테이블에서 자료를 불러올때 : JOIN. --foriegn 키 아니어도 불러올 수 있다.
 Select emp.ename, dept. dname , emp.deptno   --deptno은 emp와 dept 두군데에 다 들어있으므로, 정확히 어느 테이블의 자료인지 명확히 해줘야함!
 from emp ,dept
 where emp.deptno = dept.deptno; --두테이블의 연결고리!
 
 --table 명 별칭 부여, 부여한 별칭 명으로 접근 가능
 
 Select e.ename ename, d. dname dname , e.deptno deptno  --deptno은 emp와 dept 두군데에 다 들어있으므로, 정확히 어느 테이블의 자료인지 명확히 해줘야함!
 from emp e,dept d  --table 명 별칭 부여
 where e.deptno = d.deptno; 
 
 -- 외부조인 : 레코드 일치 하지 않더라도 출력 내부조인에 (+) 추가. 
 
 --dept 테이블이 없는 경우에도 나오길 원할때. 즉 emp에 40이 있는데, dept에 40이 없는경우 출력 -- 다시확인
  Select emp.ename, dept. dname , emp.deptno   --deptno은 emp와 dept 두군데에 다 들어있으므로, 정확히 어느 테이블의 자료인지 명확히 해줘야함!
 from emp ,dept
 where emp.deptno = dept.deptno(+);  
 
 -- emp 테이블이 없는 경우에도 나오길 원할때.  즉 dept에 40이 있는데, emp에 40이 없는경우 출력 -- 다시확인
   Select emp.ename, dept. dname , emp.deptno   --deptno은 emp와 dept 두군데에 다 들어있으므로, 정확히 어느 테이블의 자료인지 명확히 해줘야함!
 from emp ,dept
 where emp.deptno(+) = dept.deptno; 
 
 -- ANSI 조인(표준화)
 
 --내부조인.
 -- 조인을 위한 조건은 WHERE 대신 ON으로.
 
 --기존 코드
 Select e.ename ename, d. dname dname , e.deptno deptno 
 from emp e,dept d  
 where e.deptno = d.deptno;
 
 -- 표준화된 코드 (가독성 up)
 select e.ename, d.dname, d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno;

--외부조인

 --기존 코드
Select emp.ename, dept. dname , emp.deptno   --deptno은 emp와 dept 두군데에 다 들어있으므로, 정확히 어느 테이블의 자료인지 명확히 해줘야함!
from emp ,dept
where emp.deptno = dept.deptno(+);  

 -- 표준화된 코드  left outer join
select e.ename, d.dname, d.deptno
from emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

 --기존 코드
Select emp.ename, dept. dname , emp.deptno   
 from emp ,dept
 where emp.deptno(+) = dept.deptno; 
 
 -- 표준화된 코드  rignt outer join
select e.ename, d.dname, d.deptno
from emp e RIGHT OUTER JOIN dept d
ON e.deptno = d.deptno;


--FULL outer join

--기존코드
Select emp.ename, dept. dname , emp.deptno   
 from emp ,dept
 where emp.deptno(+) = dept.deptno(+);  ---에러! 불가

 -- 표준화된 코드 FULL outer join
 select e.ename, d.dname, d.deptno
from emp e FULL OUTER JOIN dept d
ON e.deptno = d.deptno;

 -- self join (같은 테이블에서 정보를 연결시켜서 검색하고 자 할 때)
 -- 각 사원의 매니저를 검색 
 --emp 테이블이 두개 라고 가정. 
 
 --내부조인
 
 --기존코드
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- 두개의 테이블 중 어디서 정보를 가져 올 지 명확히 표시해줘야한다.
from emp e1,emp e2 
WHERE e1.mgr = e2.empno;
 --표준
 
 select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  
from emp e1 inner join emp e2 
on e1.mgr = e2.empno;
 
 
 --외부조인
 -- 아직 mgr가 배정되지 않은 사원도 나오게 하고 싶다. e2에 (+) 추가.
 
 --기존
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- 두개의 테이블 중 어디서 정보를 가져 올 지 명확히 표시해줘야한다.
from emp e1,emp e2 
WHERE e1.mgr = e2.empno(+); 

--표준화
select e1.empno, e1.ename EMPLOYEE, e1.mgr, e2.ename MANAGER  -- 두개의 테이블 중 어디서 정보를 가져 올 지 명확히 표시해줘야한다.
from emp e1 LEFT OUTER JOIN emp e2 
ON e1.mgr = e2.empno; 


/*
union 합집합 (교집합 한번 빠짐)
union all 합집합 (교집합 제외 x)
Intersect 교집합
minus 차집합
*/

--업무가 clerk인 사원의 사번, 사원명, 업무, 부서번호

select empno, ename, job,deptno 
from emp
where job = 'CLERK';

-- 10번 부서의 사번, 사원명, 업무, 부서번호 

select empno, ename, job,deptno 
from emp
where deptno =10;

-- union column명이 맞아야 쓸 수 있음.
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




