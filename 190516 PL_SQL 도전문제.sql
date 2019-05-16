--2.이름을 입력받아 그 사람의 업무가 MANAGER이면 10% , ANALYST이면 20%, SALESMAN이면 30%, PRESIDENT이면 40%, CLERK이면 50% 급여를 증가한다.

SELECT *FROM EMP;
set serveroutput on
ACCEPT P_NAME PROMPT '이름?'
DECLARE
    V_NAME EMP.ENAME%TYPE := UPPER('&P_NAME');
    V_JOB EMP.JOB%TYPE; 
    V_SAL EMP.SAL%TYPE;
    V_EMPNO EMP.EMPNO % TYPE;

BEGIN
--1. 이름으로 검색한 결과를 내부 변수에 저장
        SELECT JOB,SAL,EMPNO 
        INTO V_JOB,V_SAL,V_EMPNO FROM EMP WHERE ENAME = V_NAME;
--2. 업무에 따른 월급 증가 계산
   /*
    IF V_JOB = 'MANAGER' THEN V_SAL := V_SAL *1.1;
    ELSIF V_JOB = 'ANALYST' THEN V_SAL := V_SAL *1.2;
    ELSIF V_JOB = 'SALESMAN' THEN V_SAL := V_SAL *1.3;
    ELSIF V_JOB = 'PRESIDENT' THEN V_SAL := V_SAL *1.4;
    ELSIF V_JOB = 'CLERK' THEN V_SAL := V_SAL *1.5;
    END IF;
    */
    
    CASE V_JOB
    WHEN 'MANAGER' THEN V_SAL := V_SAL *1.1;
    WHEN 'ANALYST' THEN V_SAL := V_SAL *1.2;
    WHEN 'SALESMAN' THEN V_SAL := V_SAL *1.3;
    WHEN 'PRESIDENT' THEN V_SAL := V_SAL *1.4;
    WHEN 'CLERK' THEN V_SAL := V_SAL *1.5;
    
    END CASE;
    
--3. 수정
    UPDATE EMP SET SAL = V_SAL WHERE ENAME = V_NAME;
    dbms_output.put_line(V_NAME || '님 정보 수정'); --글자출력
    COMMIT;
END;