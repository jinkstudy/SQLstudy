--2. �μ���ȣ�� �Է� �޾� �����ȣ,�̸�, �޿��� ���


ACCEPT p_deptno PROMPT '�μ���ȣ?'

DECLARE
    V_DEPTNO EMP.DEPTNO %TYPE := &P_DEPTNO;
    V_EMPNO EMP.EMPNO %TYPE;
    V_ENAME EMP.ENAME %TYPE;
    V_SAL EMP.SAL %TYPE;
    CURSOR emp_cursor IS select empno,ename,sal from emp where deptno = v_deptno order by ename;
    
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_empno,v_ename,v_sal;
        EXIT WHEN emp_cursor%NOTFOUND; 
        dbms_output.put_line(lpad(v_empno,6) || lpad(v_ename,10) || lpad(v_sal,10));
    END LOOP;
     
    CLOSE emp_cursor;
    

END;



-- [����] ������ �Է� �޾� �� ������ ��ձ޿��� �ּ�/�ִ� �޿��� ���

ACCEPT p_job PROMPT '����?'

DECLARE
        v_job emp.job %type := '&p_job';
        v_avg emp.sal %type; 
        v_min emp.sal %type;
        v_max emp.sal %type;
        
        CURSOR emp_cursor IS 
        SELECT avg(sal) avg , min(sal) min ,max (sal) max 
        INTO v_avg,v_min,v_max
        from emp where job = v_job 
        GROUP BY job ;
        
 
BEGIN

 OPEN emp_cursor;
     dbms_output.put_line(V_job|| ' ��������');
    LOOP
        FETCH emp_cursor INTO v_avg,v_min,v_max;
        EXIT WHEN emp_cursor%NOTFOUND; 
       
        dbms_output.put_line('��� :'|| v_avg ||',' ||'�ִ� :'|| v_max||','  ||'�ּ� :'|| v_min );
    END LOOP;
     
    CLOSE emp_cursor;
END;