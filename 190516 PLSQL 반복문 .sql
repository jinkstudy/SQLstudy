

--PLSQL �ݺ���


ACCEPT p_dan PROMPT  '������ ���� �Է� : '
DECLARE
  v_dan   INTEGER := &p_dan;
cnt     INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        cnt := v_dan * i;
        dbms_output.put_line( v_dan || ' * ' || i || ' = ' || cnt );
    END LOOP;   
END;



--2.1����100������ Ȧ���� �հ� ¦���� ���� ��� (������ ������ : MOD)

DECLARE
  V_SUM_ODD   INTEGER :=0;
  V_SUM_EVEN    INTEGER :=0;
BEGIN
 /*
  IF��
    FOR i IN 1..100 LOOP
    IF i MOD 2 =0 THEN V_SUM_EVEN:= V_SUM_EVEN + i;
    ELSIF i MOD 2 <>0 THEN V_SUM_ODD:= V_SUM_ODD + i;
    END IF;
   END LOOP;
   */  
   
   --CASE��
   
    FOR i IN 1..100 LOOP
    CASE (i MOD 2)
    WHEN 0 THEN V_SUM_EVEN:= V_SUM_EVEN + i;
    ELSE V_SUM_ODD:= V_SUM_ODD + i;
    END CASE;
    
    END LOOP; 
    dbms_output.put_line( '¦���� ��:' || v_sum_even || ',' ||'Ȧ���� ��:' ||v_sum_odd  );
END;

