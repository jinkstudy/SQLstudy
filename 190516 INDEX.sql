
-- employee_id�� �ڵ����� �� pk�� INDEXȰ���Ͽ� ���� �˻�. 

SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE employee_id = 100;

-- salary �ڵ����� ��  full �˻�
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE SALARY = 300;

-- PHONE_NUMBER �ڵ����� ��  full �˻�
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE PHONE_NUMBER = '515.123.4567';

--PHONE_NUMBER�� INDEX�ο�
CREATE INDEX EMP_PHONE_IX ON EMPLOYEES(PHONE_NUMBER);

-- PHONE_NUMBER INDEX�ο� �� �ٽ� �ڵ� ���� �� ��, �˻��� ������.
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE PHONE_NUMBER = '515.123.4567';

-- LAST_NAME INDEX �����س��Ƽ� FULL��ĵ���� �ʰ� ���� �˻���.
SELECT employee_id, first_name, last_name,phone_number FROM employees
WHERE LAST_NAME = 'King';

--INDEX Ȯ��
SELECT INDEX_NAME, INDEX_TYPE FROM USER_INDEXES
WHERE TABLE_NAME = 'EMPLOYEES'; 