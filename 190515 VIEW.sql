
CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
 select * from v_emp; --가상테이블 (View)
 select * from emp; --진짜 테이블
 
 
 -- 가상테이블에 수정해도 원래 테이블 자료도 수정됨.
INSERT INTO v_emp(empno,ename,deptno) Values(8888,'맹심이',30);
INSERT INTO v_emp(empno,ename,deptno) Values(8888,'콩심이',30); --진짜테이블 PK 위배
INSERT INTO v_emp(empno,ename,deptno) Values(7777,'박심이',60); --진짜테이블 FK 위배

-- 읽기 전용 뷰 생성
CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
          with read only ;
          
INSERT INTO v_emp(empno,ename,deptno) Values(7777,'박심이',60);    -- 읽기 전용뷰로 만들면 DML작업 불가.


--사원번호,사원명,부서명 --> v_emp_info 

CREATE OR REPLACE VIEW v_emp_info  AS
           select e.empno empno, e.ename ename, d.dname dname from emp e,dept d where e.deptno = d.deptno ;
          --with read only ;

select * from v_emp_info; 

INSERT INTO v_emp_info(empno,ename,dname) Values(8899,'옹심이','RESEARCH'); --조인 뷰에는  입력안됨.

-- [ 연습 ] 부서별로 부서명, 최소급여, 최대급여, 부서의 평균 급여를 포함하는 DEPT_SUM 뷰를생성하여라.

CREATE OR REPLACE VIEW DEPT_SUM AS
        SELECT d.dname dname, min(e.sal) min ,max(e.sal) max , avg(e.sal) avg 
        FROM emp e inner join dept d
        on e.deptno=d.deptno 
        group by d.dname;
        
SELECT * FROM dept_sum;        
--원본테이블 수정시 view도 자동 업데이트 됨.
INSERT INTO emp(empno,ename,sal,deptno) Values(8890,'홍홍홍',10000,20);       

          