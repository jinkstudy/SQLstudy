--����Ŭ ���Խ�
--https://goalker.tistory.com/71

-- ���̺� ����

CREATE TABLE reg_tab( text varchar2(20) );


-- ���ڵ� �Է�

INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('��');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('�����');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL');
INSERT INTO reg_tab VALUES('0BATGIRL');
INSERT INTO reg_tab VALUES('����');

 --Ŀ��
 commit;
 
 select * from reg_tab;
 -- 1. text�÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�
 
 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t'); --���Խ� ǥ�� "'^t'--->�ҹ��� t�� �����ϴ�."
 
 

-- 2. text �÷��� ���ڿ����� 't'�� ������ ������ �˻�

 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'t$'); --���Խ� ǥ�� "�ҹ��� t�� ������ --->'t$'
 

-- 3. ù��° 't'�ν����Ͽ� 5��° 'r'�� �ִ� ������ �˻�

 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t...r'); --���Խ� ǥ�� "�ҹ��� t�� ������ --->'t$'

 

-- 4. ���ڷ� ������ ������ �˻�
Select*
 From reg_tab 
 where regexp_like(text,'[0-9]$');
 

-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�

 Select*
 From reg_tab 
 where regexp_like(text,'^[0-9]');

-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�

  Select*
 From reg_tab 
 where regexp_like(text,'^[^0-9]');

-- 7. �빮�ڷ� �����ϴ� ������ �˻�

 Select*
 From reg_tab 
 where regexp_like(text,'^[A-Z]');

-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�

   Select*
 From reg_tab 
 where regexp_like(text,'^[^a-z0-9]');

-- 9. �ѱ۷� �����ϴ� ������ �˻�
Select*
 From reg_tab 
 where regexp_like(text,'^[��-�R]');
 

-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
 Select*
 From reg_tab 
 where regexp_like(text,'gg|GG');
 