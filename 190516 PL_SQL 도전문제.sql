--2.�̸��� �Է¹޾� �� ����� ������ MANAGER�̸� 10% , ANALYST�̸� 20%, SALESMAN�̸� 30%, PRESIDENT�̸� 40%, CLERK�̸� 50% �޿��� �����Ѵ�.

SELECT *FROM EMP;
set serveroutput on
ACCEPT P_NAME PROMPT '�̸�?'
DECLARE
    V_NAME EMP.ENAME%TYPE := UPPER('&P_NAME');
    V_JOB EMP.JOB%TYPE; 
    V_SAL EMP.SAL%TYPE;
    V_EMPNO EMP.EMPNO % TYPE;

BEGIN
--1. �̸����� �˻��� ����� ���� ������ ����
        SELECT JOB,SAL,EMPNO 
        INTO V_JOB,V_SAL,V_EMPNO FROM EMP WHERE ENAME = V_NAME;
--2. ������ ���� ���� ���� ���
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
    
--3. ����
    UPDATE EMP SET SAL = V_SAL WHERE ENAME = V_NAME;
    dbms_output.put_line(V_NAME || '�� ���� ����'); --�������
    COMMIT;
END;