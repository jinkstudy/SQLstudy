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

 

  -- ���� ����ϸ� ���� ��������ؾ�

  dbms_output.put_line('��� #' || v_empno);

  dbms_output.put_line('�̸� #' || v_ename);

  dbms_output.put_line('�Ի��� #' || v_hiredate);

END;




SET SERVEROUTPUT ON
ACCEPT p_ename PROMPT '��ȸ�� ��� �̸���?'
DECLARE

  -- EMP ���̺��� �÷���� ���ڵ�Ÿ�� ���� ����
  emp_record  emp%ROWTYPE;
 
  -- �Է��� �̸��� ������ ���� ����
  v_ename     emp.ename%TYPE := '&p_ename';

BEGIN
SELECT *              -- *�� emp%ROWTYPE���� ���ǽ� ����
  INTO emp_record
  FROM emp
  WHERE ename = upper( v_ename );
 
  dbms_output.put_line('�����ȣ : ' || to_char(emp_record.empno) );
  dbms_output.put_line('�� �� �� : ' || emp_record.ename );
  dbms_output.put_line('��    �� : ' || emp_record.job );

 

EXCEPTION

WHEN NO_DATA_FOUND THEN dbms_output.put_line('&p_ename' || '�� �ڷ�� �����ϴ�');
WHEN TOO_MANY_ROWS THEN dbms_output.put_line('&p_ename' || '�ڷᰡ 2�� �̻��Դϴ�.');
WHEN OTHERS THEN dbms_output.put_line('�˻��� ������ �߻��Ͽ����ϴ�.');

END;
*/
--1.�̸�, �޿�, �μ���ȣ�� �Է� �޾� ��� ���̺� �Է½� �μ���ȣ�� 20�̸� �޿���30%�� �߰��ϰ�, ����� �������� �̿��Ѵ�.
ACCEPT p_name PROMPT '�̸�?'
ACCEPT p_sal PROMPT '����?'
ACCEPT p_deptno PROMPT '�μ���ȣ?'

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

 --sqlplus������ �� / ������� ������.

SELECT * FROM EMP;
