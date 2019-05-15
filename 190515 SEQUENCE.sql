
INSERT INTO emp(empno, ename, sal, deptno) VALUES (8890,'È«È«È«',10000,20);

-- tlznjstm
DROP SEQUENCE seq_emp_empno;
CREATE SEQUENCE seq_emp_empno start with 5000;

-- EMPNOÀÌ ÀÚµ¿À¸·Î ¿Ã¶ó°¨.
INSERT INTO emp(empno, ename, deptno) VALUES(seq_emp_empno.nextval,'È«6',10);

SELECT * FROM EMP;

SELECT seq_emp_empno.currval FROM dual;



