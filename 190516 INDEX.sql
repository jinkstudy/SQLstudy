
-- employee_id로 자동추적 시 pk라서 INDEX활용하여 빠른 검색. 

SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE employee_id = 100;

-- salary 자동추적 시  full 검색
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE SALARY = 300;

-- PHONE_NUMBER 자동추적 시  full 검색
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE PHONE_NUMBER = '515.123.4567';

--PHONE_NUMBER에 INDEX부여
CREATE INDEX EMP_PHONE_IX ON EMPLOYEES(PHONE_NUMBER);

-- PHONE_NUMBER INDEX부여 후 다시 자동 추적 할 시, 검색이 빨라짐.
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE PHONE_NUMBER = '515.123.4567';

-- LAST_NAME INDEX 지정해놓아서 FULL스캔하지 않고 빨리 검색됨.
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE LAST_NAME = 'King';

--INDEX 확인
SELECT INDEX_NAME, INDEX_TYPE FROM USER_INDEXES
WHERE TABLE_NAME = 'EMPLOYEES'; 