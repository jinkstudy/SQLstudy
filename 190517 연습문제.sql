-- ȸ�� ���̺�
create table ex_member(
id varchar2(10), -- ���̵�
pass varchar2(10), -- �н�����
name varchar2(20), -- �̸�
tel varchar2(20), -- ��ȭ��ȣ
addr varchar2(100) -- �ּ�
);

-- ��ǰ ���̺�
create table ex_good(
gno varchar2(10), -- ��ǰ��ȣ
gname varchar(30), -- ��ǰ��
gdetail varchar2(300), -- �󼼼���
price number);  -- ����

-- �ֹ� ���̺�
create table ex_order (
ono number,  -- ��ȣ
orderno varchar2(20), -- �ֹ���ȣ
gno varchar2(10), -- ��ǰ��ȣ
id varchar2(10), -- ȸ�� ���̵�
count number,  -- ����
status varchar2(10) -- ��ۻ���
);

create sequence seq_order_ono;

-- ######################################################
-- 1. �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?
ALTER TABLE EX_ORDER ADD CONSTRAINT PK_EX_ORDER_ONO PRIMARY KEY (ONO);
ALTER TABLE EX_ORDER ADD CONSTRAINT FK_EX_ORDER_GNO FOREIGN KEY (gno) REFERENCES EX_GOOD(GNO);
ALTER TABLE EX_ORDER ADD CONSTRAINT FK_EX_ORDER_ID FOREIGN KEY (ID) REFERENCES EX_MEMBER(ID);
ALTER TABLE EX_MEMBER ADD CONSTRAINT PK_EX_MEMBER_ID PRIMARY KEY (ID);
ALTER TABLE EX_GOOD ADD CONSTRAINT PK_EX_GOOD_GNO PRIMARY KEY (GNO);


-- ȸ�� ���̺� ����Ÿ �Է�
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

commit;

-- ���� ���̺� ����Ÿ �Է�
insert into ex_good( gno, gname, gdetail, price )
values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );


insert into ex_good( gno, gname, gdetail, price )
values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

commit;


create sequence seq_order_ono;

-- �ֹ� ���̺� ����Ÿ �Է�

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161212', '1001', 'park', 1, '��ۿϷ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161212', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161111', '1001', 'kim', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161111', '3333', 'kim', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '1001', 'park', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '2002', 'park', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20165050', '1001', 'meng', 1, '�����');

commit;


--1. ������� �ֹ� ������ ��ǰ ���� ���

SELECT o.ORDERNO, g.GNO, g.gdetail,o.status
FROM EX_GOOD g INNER JOIN EX_ORDER o
ON G.GNO = O.GNO
WHERE O.STATUS = '�����';


--2. �ֹ� ���� ��ǰ ������ �� ���� ���

SELECT g.GNO,g.gname,o.status,m.*
FROM EX_GOOD g , EX_ORDER o,EX_MEMBER m
WHERE G.GNO = O.GNO AND m.ID = o.ID AND O.STATUS = '�ֹ�';

--3. �ֹ����� �� ����(ID�� ���)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
SELECT o.orderno,o.id, sum(g.price *o.count) total_price 
FROM EX_GOOD g , EX_ORDER o
WHERE g.gno = o.gno
group by o.orderno, o.id;


--4. [����] 3���� �ֹ� ������ �� ���� ��ǰ�� �� �� ���� ��� 
-- [��] 20161212   �Ӹ��� �� 1�� 

SELECT o.orderno, sum(g.price *o.count) total_price,SUM(COUNT), min(o.gno)
FROM EX_GOOD g , EX_ORDER o
WHERE g.gno = o.gno  
group by o.orderno;


SELECT G1.ORDERNO,G1.ID, G1.TOTAL_PRICE ,  
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' ��' || (G1.SUM -1) || '��')) LIST 
FROM EX_GOOD G, 
    (SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
     FROM EX_GOOD g , EX_ORDER o
     WHERE g.gno = o.gno  
     group by o.orderno,o.ID) G1
WHERE G1.GNO = G.GNO; 


SELECT G1.ORDERNO,  
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' ��' || (G1.SUM -1) || '��')) LIST 
FROM EX_GOOD G, 
    (SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
     FROM EX_GOOD g , EX_ORDER o
     WHERE g.gno = o.gno  
     group by o.orderno,o.ID) G1
WHERE G1.GNO = G.GNO; 
       
 -- DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' ��' || (G1.SUM -1) || '��'))    
 

 SELECT G1.ORDERNO, 
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' ��' || (G1.SUM -1) || '��')) LIST 
FROM EX_GOOD G INNER JOIN 
(SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
FROM EX_GOOD g INNER JOIN EX_ORDER o
ON g.gno = o.gno 
group by o.orderno,o.ID) G1
ON G1.GNO = G.GNO
ORDER BY orderno;      



