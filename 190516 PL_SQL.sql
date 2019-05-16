/*
set serveroutput on;
DECLARE
  v_empno number;
  v_ename varchar2(30);
  v_hiredate date;

BEGIN

SELECT empno, ename, hiredate
INTO v_empno, v_ename, v_hiredate
FROM emp
WHERE ename=upper('SCOTT');

 

  -- “” 사용하면 에러 ‘’사용해야

  dbms_output.put_line('사번 #' || v_empno);

  dbms_output.put_line('이름 #' || v_ename);

  dbms_output.put_line('입사일 #' || v_hiredate);

END;




SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '조회할 사원 이름은?'
DECLARE

  -- EMP 테이블의 컬럼들로 레코드타입 변수 선언
  emp_record  emp%ROWTYPE;
 
  -- 입력한 이름을 저장할 변수 선언
  v_ename     emp.ename%TYPE := '&p_ename';

BEGIN
SELECT *              -- *는 emp%ROWTYPE으로 정의시 가능
  INTO emp_record
  FROM emp
  WHERE ename = upper( v_ename );
 
  dbms_output.put_line('사원번호 : ' || to_char(emp_record.empno) );
  dbms_output.put_line('사 원 명 : ' || emp_record.ename );
  dbms_output.put_line('업    무 : ' || emp_record.job );

 

EXCEPTION

WHEN NO_DATA_FOUND THEN dbms_output.put_line('&p_ename' || '의 자료는 없습니다');
WHEN TOO_MANY_ROWS THEN dbms_output.put_line('&p_ename' || '자료가 2건 이상입니다.');
WHEN OTHERS THEN dbms_output.put_line('검색시 오류가 발생하였습니다.');

END;
*/
--1.이름, 급여, 부서번호를 입력 받아 사원 테이블에 입력시 부서번호가 20이면 급여의30%를 추가하고, 사번은 시퀀스를 이용한다.
ACCEPT p_name PROMPT '이름?'
ACCEPT p_sal PROMPT '월급?'
ACCEPT p_deptno PROMPT '부서번호?'

DECLARE 
 V_NAME EMP.ENAME%TYPE := '&p_name';
 V_SAL EMP.SAL%TYPE := &p_sal;
 V_DEPTNO EMP.DEPTNO%TYPE := &p_deptno;

BEGIN

    IF v_deptno = 20 THEN v_sal :=v_sal *1.3;
    END IF;
    INSERT INTO emp(empno,ename,sal,deptno)
    values(seq_emp_empno.nextval,v_name,v_sal,v_deptno);
    COMMIT;
END;

 --sqlplus에서는 꼭 / 해줘야함 실행명령.

SELECT * FROM EMP;
