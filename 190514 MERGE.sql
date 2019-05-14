/*
MERGE INTO student s --update �� ���̺��
USING (SELECT '1111' no, '������' name, '����' gender, '�����' addr, '900000-2111111' jumin, 20 deptno from dual) d --��ȸ ��������
ON (s.no = d.no) --1�� 2�� join ����
WHEN MATCHED THEN
UPDATE
SET s.name = d.name, s.gender = d.gender, s.addr = d.addr, s.jumin = d.jumin, s.deptno = d.deptno --update����
WHERE s.no = d.no
WHEN NOT MATCHED THEN 
INSERT VALUES(d.no, d.name, d.gender, d.addr, d.jumin, d.deptno); -- ���� �߰� ����
*/


--[ ���� ]

--1. ������̺� �����ϴ� ����̸� ����� �޿��� 10% �λ��ϰ�,
   --�������� �ʴ� ����̸� ������̺� ������ �Է��Ѵ�.
 
 MERGE INTO emp e1 
USING (SELECT ename,sal from dual) e2
ON (e1.empno = e2.empno)
WHEN MATCHED THEN
UPDATE
SET el.ename = e2.ename, e1.sal = e2.sal * 1.1
WHERE e1.empno = e2.empno
WHEN NOT MATCHED THEN
INSERT VALUES(e2.ename,e2.sal);  
   