 --table ���� �� ��Ƽ�ǻ���
 -- �����Ͱ� ���� ���, ��Ƽ�� �и� �ؼ� �˻� �� �����ϵ���.
 
CREATE TABLE sawon_p
( sabun number(4),
    SANAME VARCHAR2(20),
    job varchar2(20),
    sal number
)

partition by range(sabun)
(
    partition sawon_p1 values less than (2000) tablespace p1,
    partition sawon_p2 values less than (4000) tablespace p2,
    partition sawon_p3 values less than (8000) tablespace p3
    
);

Insert into sawon_p VALUES(101,'�����','����',5000);
Insert into sawon_p VALUES(3001,'�����','������',5000);
Insert into sawon_p VALUES(5001,'������','������',5000);    

--sawon_p2�� ���Ե� �����͸� �ҷ��´�.

select * from sawon_p partition(sawon_p2);


-- ����� ������ ���߷� ����
UPDATE SAWON_P SET JOB = '����' WHERE SANAME = '�����';

-- ����� ����� 1001������ ����
UPDATE SAWON_P SET SABUN = 1001 WHERE SANAME = '�����';   --����  : ��Ƽ���� ������ ���, ������ ������ ���ҿ����� ����Ǹ� ������Ʈ ���� ����.

-- ����� ����� 2001������ ����
UPDATE SAWON_P SET SABUN = 2001 WHERE SANAME = '�����';   --��! : ���� ��Ƽ���̱� ������.
