/*
MERGE INTO student s --update 할 테이블명
USING (SELECT '1111' no, '김태희' name, '여자' gender, '서울시' addr, '900000-2111111' jumin, 20 deptno from dual) d --조회 서브쿼리
ON (s.no = d.no) --1과 2의 join 조건
WHEN MATCHED THEN
UPDATE
SET s.name = d.name, s.gender = d.gender, s.addr = d.addr, s.jumin = d.jumin, s.deptno = d.deptno --update조건
WHERE s.no = d.no
WHEN NOT MATCHED THEN 
INSERT VALUES(d.no, d.name, d.gender, d.addr, d.jumin, d.deptno); -- 새로 추가 조건
*/


--[ 문제 ]

--1. 사원테이블에 존재하는 사원이면 사원의 급여를 10% 인상하고,
   --존재하지 않는 사원이면 사원테이블에 정보를 입력한다.
 
 MERGE INTO emp e1 
USING (SELECT ename,sal from dual) e2
ON (e1.empno = e2.empno)
WHEN MATCHED THEN
UPDATE
SET el.ename = e2.ename, e1.sal = e2.sal * 1.1
WHERE e1.empno = e2.empno
WHEN NOT MATCHED THEN
INSERT VALUES(e2.ename,e2.sal);  
   