



-- commit�� rollback�� DML���� ������ ��.
-- commit; --�޸𸮿��� ������ ���� Ȯ���ϴ� ��. ���÷� ������ ����!
-- rollback; --�޸𸮿��� ������ ���� ����ϴ� ��. ���� commit���� ����.

--emp(������̺�)�� 8000����� �̸��� �����̸����� ���� 10000����Ÿ �Է�
Insert INTO emp(empno,ename,sal) VALUES (8000,'������',10000); 
Insert INTO emp(empno,ename,sal) VALUES (7788,'ȫ�浿',9000);  --7788�� �̹� ����. ���Ἲ �������ǿ� ����Ǿ� �߰� �Ұ�.

Insert INTO emp(empno,ename,sal,deptno) VALUES (8001,'ȫ�浿',9000,20);
Insert INTO emp(empno,ename,sal,deptno) VALUES (8002,'ȫ���',9000,60); --deptno�� 60�� ����. ���Ἲ ��������. foriegn key.

select*from emp; -- ����Ȯ��
desc emp;
-- ����Ȯ��

/*
    ���̺�� : info
    
    hakbun  char(4)
    name    varchar2(10)
    jumin   char(14)
    gender  varchar2(10)
    age     number(3) -- -999~999����.
*/

/*
--�й��� 1001�� ȫ�浿 �л� �߰�
--�й��� 1002�� ��浿 �л� �߰�
--�й��� 1002�� �ͱ浿 �л� �߰�
--�ֹι�ȣ�� 801212-1234567�� ȫ�浿 �߰�
--26���� ���� �߰�
*/

CREATE TABLE info(
    hakbun char(4),
    name varchar2(10),
    jumin char(14),
    gender varchar2(10),
    age number(3)
);

Insert INTO info(hakbun,name) VALUES('1001','ȫ�浿');
Insert INTO info(hakbun,name) VALUES('1002','��浿');
Insert INTO info(hakbun,name) VALUES('1002','�ͱ浿');
Insert INTO info(jumin,name) VALUES('801212-1234567','ȫ�浿');
Insert INTO info(gender,age) VALUES('����',26);

select * from info;
Delete from info;
desc info;

--�������� (Primary Ű)

ALTER TABLE info
ADD CONSTRAINT  pk_info_hakbun PRIMARY KEY (hakbun);

Insert INTO info(hakbun,name) VALUES('1001','ȫ�浿');
Insert INTO info(hakbun,name) VALUES('1002','��浿');
Insert INTO info(hakbun,name) VALUES('1002','�ͱ浿'); --�й��� pk�� ���� �� �� �й� �ߺ��Ǹ� ���� ����. ����. 
Insert INTO info(jumin,name) VALUES('801212-1234567','ȫ�浿'); -- pk�� �й��� �������� ������ ����.
Insert INTO info(gender,age) VALUES('����',26);

-- �������� Ȯ��
SELECT  constraint_name, constraint_type
FROM       user_constraints ;


DROP TABLE info;
/*
  -�÷� ���� �������� ���
           CREATE TABEL  table_name
           (
                      column_name  data_type [ CONSTRAINT pk_name ]  PRIMARY KEY
           );
          

    -���̺� ���� �������� ���
           CREATE TABEL  table_name
           (
                       column_nam  data_type,
                       CONSTRAINT  pk_name PRIMARY  KEY  [ column_name ]
           );
*/

CREATE TABLE info(
    hakbun char(4),
    name varchar2(10),
    jumin char(14),
    gender varchar2(10),
    age number(3),
    CONSTRAINT pk_info_hakbun PRIMARY  KEY (hakbun)
 );

DELETE From info;

--table ���� �� not null �����ϱ�.
ALTER TABLE info 
    MODIFY (name varchar2(10) NOT NULL);
    
desc info;

Insert INTO info(hakbun,name) VALUES('1001','ȫ�浿');
Insert INTO info(hakbun,name) VALUES('1002','��浿');
Insert INTO info(hakbun,name) VALUES('1002','�ͱ浿'); --�й��� pk�� ���� �� �� �й� �ߺ��Ǹ� ���� ����. ����. 
Insert INTO info(jumin,name) VALUES('801212-1234567','ȫ�浿2'); -- pk�� �й��� �������� ������ ����.
Insert INTO info(hakbun,gender,age) VALUES('1111','����',26); -- name�� not null������ �ɷ� �����Ƿ�, �̸��� �Է����� �ʾұ� ������ ����.

--UNIQUE �߰�.
ALTER TABLE info
ADD CONSTRAINT uq_info_jumin UNIQUE (jumin);

SELECT *From info;

INSERT INTO info(hakbun,name,jumin) VALUES('1003','�ͱ浿','990101-1234567');
INSERT INTO info(hakbun,name,jumin) VALUES('1004','�ڱ浿','990101-1234567'); --(SCOTT.UQ_INFO_JUMIN)�� ����˴ϴ�. UNIQUE�� ����.

INSERT INTO info(name, jumin) VALUES('�ֱ浿','980101-1234567'); --pk ���Է��̶� ����.
INSERT INTO info(hakbun,name) VALUES('1005','���浿'); --unique�� not null ��� �̹Ƿ�, unique �Է¾��ص� ���� ����.


--check
-- �Էµ����Ϳ� ���� ���������� �ִ� ��. �Էµ����͸� check�ؼ� ���� ������ �Էµ��� �ʵ���.
ALTER TABLE info ADD
CONSTRAINT ck_info_gender CHECK (gender IN ('����','����'));

INSERT INTO info(hakbun,name,gender) VALUES('1006','��浿','����');
INSERT INTO info(hakbun,name,gender) VALUES('1007','���浿','����');
INSERT INTO info(hakbun,name,gender) VALUES('1008','�ȱ浿','����'); --����!! üũ ��������(SCOTT.CK_INFO_GENDER)�� ����Ǿ����ϴ�.


-- Default : ���������� �ƴ����� �������ǰ� ���� ���� ���.

ALTER TABLE info MODIFY( gender char(4) default '����') ; -- ���� �ȵ��´ٸ� �⺻������ ������ �����ϰڴ�.

INSERT INTO info(hakbun,name) VALUES('1009','���浿'); --������ �Է����� �ʾƵ�, �⺻���� ���� �Ǿ� �ֱ� ������ ������ �ڵ��Էµȴ�.


-- foreign Key
DROP table info;

CREATE TABLE info(

    hakbun char(4),
    name varchar2(10) not null,
    jumin char(14),
    gender varchar2(10) default '����',
    age number(3),
    deptno number(2), --�ٸ� table���� �ڷḦ ���������� �� �� �ڷ����� �� ��������Ѵ�.
    CONSTRAINT pk_info_hakbun PRIMARY  KEY (hakbun),
    CONSTRAINT uq_info_jumin UNIQUE(jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno) --dept table�� deptno�� ���� �ϰڴ�.
        
 );
 
 INSERT INTO info ( hakbun,name,gender,deptno) VALUES('9000','������','����',10);
 INSERT INTO info ( hakbun,name,deptno) VALUES('9001','������',50); --����! ���Ἲ ��������(SCOTT.FK_INFO_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�.
 INSERT INTO info ( hakbun,name,deptno) VALUES('9001','������',40);




