/*1. sawon ���̺��� �����ϼ���.
           sabun�� 6�ڸ� ����
           sawon_name���ִ� �ѱ� 5�ڸ�
           ubmu���ִ� �ѱ� 10�ڸ�
           weolgub�������� 8�ڸ��� �Ҽ��� 2�ڸ�
           buseo�¼��� 3�ڸ�
  */  
  
CREATE TABLE sawon (
    sabun char(6),
    sawon_name varchar2(10),
    ubmu varchar2(20),
    weolgub number(10,2),
    buseo number(3)
);

--2. ���� ���̺��� sabun���⺻Ű�� ����

ALTER TABLE sawon
ADD CONSTRAINT  pk_sawon_sabun PRIMARY KEY (sabun);

--3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL ���� �Էµ��� �ʵ��� ����

ALTER TABLE sawon
ADD  jiyeok varchar(20) NOT NULL;

--4. weolgub �÷��� ������7�ڸ��� ����
ALTER TABLE sawon
MODIFY  weolgub number(7);

-- 5. ubmu�÷��� �����ߡ�, ������������, �������� �������� ������ �Էµǵ��� ����
ALTER TABLE sawon
ADD CONSTRAINT ck_sawon_ubmu CHECK(ubmu in ('����','��������','����'));

--6. ubmu�÷��� �����Ͱ� �Է��� �ȵ� ��� �����尪���� �����ߡ��� ����
ALTER TABLE sawon MODIFY( ubmu varchar2(20) default '����');
 

--7. buseo ���̺��� �����ϼ���
           --buseo_no�¼��� 3�ڷ� �̷���� ��ȣ�� �⺻Ű
           --buseo_name���ִ� �ѱ� 10�ڸ�
           
CREATE TABLE buseo (
buseo_no number(3),
buseo_name VARCHAR2(20),
CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);


 
--8. sawon ���̺��� buseo�÷��� buseo ���̺��� buseo_no�������ϴ� �ܷ�Ű�� ����

ALTER TABLE sawon 
ADD CONSTRAINT fk_sawon_buseo FOREIGN KEY(buseo)REFERENCES buseo (buseo_no);

-- 9. buseo ���̺� ������ �Է�
/*
 buseo_no    buseo_name

 101         ����Ʈ��������������
 202         ������
 303         �����ڿ���
*/

INSERT INTO buseo(buseo_no,buseo_name) VALUES (101,'����Ʈ��������������');
INSERT INTO buseo(buseo_no,buseo_name) VALUES (202,'������');
INSERT INTO buseo(buseo_no,buseo_name) VALUES (303,'�����ڿ���');


--10. sawon ���̺� ������ �Է� (�Է��� �ȵ� ��쵵 ����)
/*
sabun       sawon_name      ubmu        weolgub     buseo       jiyeok

8001        ȫ�浿�̱�                   100000          101        �λ�
8002        ȫ����             �繫      200000          202         ��õ
8003        ȫ���             ����                      111         ����
8004        ȫ�漮                        12345678                  ����
8005        ȫ��ö             ��������                    303         �Ǳ�
*/

INSERT INTO sawon(sabun,sawon_name,weolgub,buseo,jiyeok) VALUES (8001,'ȫ�浿�̱�',100000,101,'�λ�');
INSERT INTO sawon(sabun,sawon_name,ubmu,weolgub,buseo,jiyeok) VALUES (8002,'ȫ����','�繫',200000,201,'��õ'); --����! �繫 ���� ����.
INSERT INTO sawon(sabun,sawon_name,buseo,jiyeok) VALUES (8003,'ȫ���',111,'����'); --����! �μ�no�� ����.
INSERT INTO sawon(sabun,sawon_name,weolgub,jiyeok) VALUES (8004,'ȫ�漮',12345678,'����');  -- ORA-01438: �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok) VALUES (8005,'ȫ��ö','��������',303,'�Ǳ�');

--11. sawon ���̺��� jiyeok �÷��� ����
ALTER TABLE sawon DROP( jiyeok);
 

--12. buseo ���̺��� buseo ���� �������ڿ��Ρ��� ���� ����
DELETE FROM buseo where buseo_name='�����ڿ���';  
--ORA-02292: ���Ἲ ��������(SCOTT.FK_SAWON_BUSEO)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
 

--13. sawon ���̺��� ��� ������ �����ϰ� ��������� ����
DELETE FROM sawon; 
DROP TABLE sawon;

 

--14. 1~8 �ܰ������ �ϳ���CREATE ������ �ۼ�

CREATE TABLE sawon (
    sabun char(6),
    sawon_name varchar2(10),
    ubmu varchar2(20)default '����',
    weolgub number(7),
    buseo char(3),
    jiyeok varchar(20) NOT NULL,
    CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_sawon_ubmu CHECK(ubmu in ('����','��������','����')),
    CONSTRAINT fk_sawon_buseo FOREIGN KEY(buseo)REFERENCES buseo (buseo_no)
    
);








desc buseo;
select*from buseo;
select*from sawon;
desc sawon;
SELECT  constraint_name, constraint_type
FROM       user_constraints ;


           
          