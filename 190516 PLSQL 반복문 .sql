

--PLSQL 반복문


ACCEPT p_dan PROMPT  '구구단 단을 입력 : '
DECLARE
  v_dan   INTEGER := &p_dan;
cnt     INTEGER;
BEGIN
    FOR i IN 1..9 LOOP
        cnt := v_dan * i;
        dbms_output.put_line( v_dan || ' * ' || i || ' = ' || cnt );
    END LOOP;   
END;



--2.1부터100까지의 홀수의 합과 짝수의 합을 출력 (나머지 연산자 : MOD)

DECLARE
  V_SUM_ODD   INTEGER :=0;
  V_SUM_EVEN    INTEGER :=0;
BEGIN
 /*
  IF문
    FOR i IN 1..100 LOOP
    IF i MOD 2 =0 THEN V_SUM_EVEN:= V_SUM_EVEN + i;
    ELSIF i MOD 2 <>0 THEN V_SUM_ODD:= V_SUM_ODD + i;
    END IF;
   END LOOP;
   */  
   
   --CASE문
   
    FOR i IN 1..100 LOOP
    CASE (i MOD 2)
    WHEN 0 THEN V_SUM_EVEN:= V_SUM_EVEN + i;
    ELSE V_SUM_ODD:= V_SUM_ODD + i;
    END CASE;
    
    END LOOP; 
    dbms_output.put_line( '짝수의 합:' || v_sum_even || ',' ||'홀수의 합:' ||v_sum_odd  );
END;

