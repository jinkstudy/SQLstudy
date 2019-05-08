----SQL(DDL / DML / DCL)
--- DDL

select * from emp;

CREATE TABLE emp_copy AS 
SELECT * FROM emp;

select *from emp_copy;

--1. 사원번호가 7782인 사원의 부서를 30번으로 변경
--UPDATE  table_name SET column=value WHERE condition;
UPDATE  emp_copy SET deptno=30 WHERE empno=7782;

--2. 사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경
UPDATE  emp_copy SET ename = '홍길숙',sal=3500 WHERE empno=7782;

--3. 모든 부서원의 보너스를 300씩 인상 변경
UPDATE emp_copy SET comm =nvl(comm,0)+300;  
    -- null은 계산안됨. null은 0으로 바꿔줘야함.
    -- nvl(comm,0): comm에 포함된 null 값을 0으로 바꾸겠습니다.
    -- 전체를 바꿀때는 where 안씀. where절 없을 때 신중할 것. 

--4. 사원번호가 7499인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE empno=7499;

--5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE hiredate < '81/06/01';

--6. 입사(사번 : 9999, 사원명 : 본인명, 업무 : IT, 월급 : 6000)
INSERT INTO emp_copy(empno,ename,job,sal) values (9999,'배진경','IT',6000);

--7. data 삭제
DELETE From emp_copy;

--8. table 전체 삭제
DROP TABLE emp_copy;

--9. table 생성
CREATE TABLE student(id char(4),name varchar2(10),kor number(3),math number(3),total number(3),avg number(5,2));

--테이블 구조 확인
DESC student;

-- 데이터(레코드) 확인
SELECT * FROM student;

-- 기존 테이블에 영어점수 추가
ALTER TABLE student ADD(eng number(3));

-- 총점 컬럼 삭제
ALTER TABLE student DROP(total);
-- 평균 컬럼에서 소숫점 한자리로 변경
ALTER TABLE student MODIFY(avg number(4,1));

-- data 입력
INSERT INTO student VALUES('8001','홍길순',100,80,0,50);
INSERT INTO student(id,name,kor,math,eng) VALUES('8088','홍길동',55,66,88);
--전체 table 확인
SELECT * FROM student;

-- 홍길동 학생의 평균값을 입력하세요.

UPDATE student SET avg=(kor+math+eng)/3 where name='홍길동';
