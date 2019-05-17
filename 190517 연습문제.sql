-- 회원 테이블
create table ex_member(
id varchar2(10), -- 아이디
pass varchar2(10), -- 패스워드
name varchar2(20), -- 이름
tel varchar2(20), -- 전화번호
addr varchar2(100) -- 주소
);

-- 상품 테이블
create table ex_good(
gno varchar2(10), -- 상품번호
gname varchar(30), -- 상품명
gdetail varchar2(300), -- 상세설명
price number);  -- 가격

-- 주문 테이블
create table ex_order (
ono number,  -- 번호
orderno varchar2(20), -- 주문번호
gno varchar2(10), -- 상품번호
id varchar2(10), -- 회원 아이디
count number,  -- 갯수
status varchar2(10) -- 배송상태
);

create sequence seq_order_ono;

-- ######################################################
-- 1. 주문테이블과 회원테이블, 상품테이블의 관계를 맺는다면?
ALTER TABLE EX_ORDER ADD CONSTRAINT PK_EX_ORDER_ONO PRIMARY KEY (ONO);
ALTER TABLE EX_ORDER ADD CONSTRAINT FK_EX_ORDER_GNO FOREIGN KEY (gno) REFERENCES EX_GOOD(GNO);
ALTER TABLE EX_ORDER ADD CONSTRAINT FK_EX_ORDER_ID FOREIGN KEY (ID) REFERENCES EX_MEMBER(ID);
ALTER TABLE EX_MEMBER ADD CONSTRAINT PK_EX_MEMBER_ID PRIMARY KEY (ID);
ALTER TABLE EX_GOOD ADD CONSTRAINT PK_EX_GOOD_GNO PRIMARY KEY (GNO);


-- 회원 테이블 데이타 입력
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '김길동', '02-222-2222','서울 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '박길동', '03-333-3333','인천 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '맹길동', '04-444-4444','경기 멋지구 이쁜동');

commit;

-- 상픔 테이블 데이타 입력
insert into ex_good( gno, gname, gdetail, price )
values('1001', '머리끈', '아주 비싼 머리끈', 200 );


insert into ex_good( gno, gname, gdetail, price )
values('2002', '자전거-A', '비싸지만 빠르게 달리는 자전거', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '자전거-B', '아주 비싸지만 느리고 안전하게 달린다는 자전거', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '핸드폰케이스', '싸고 유행하는 핸드폰 케이스', 1500 );

commit;


create sequence seq_order_ono;

-- 주문 테이블 데이타 입력

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161212', '1001', 'park', 1, '배송완료');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161212', '2010', 'park', 1, '배송중');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161111', '1001', 'kim', 2, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20161111', '3333', 'kim', 3, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '1001', 'park', 3, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '2010', 'park', 1, '배송중');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20163333', '2002', 'park', 2, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( seq_order_ono.nextval, '20165050', '1001', 'meng', 1, '배송중');

commit;


--1. 배송중인 주문 내역과 상품 정보 출력

SELECT o.ORDERNO, g.GNO, g.gdetail,o.status
FROM EX_GOOD g INNER JOIN EX_ORDER o
ON G.GNO = O.GNO
WHERE O.STATUS = '배송중';


--2. 주문 들어온 상품 내역과 고객 정보 출력

SELECT g.GNO,g.gname,o.status,m.*
FROM EX_GOOD g , EX_ORDER o,EX_MEMBER m
WHERE G.GNO = O.GNO AND m.ID = o.ID AND O.STATUS = '주문';

--3. 주문별로 고객 정보(ID만 출력)와 주문한 상품의 총금액을 출력
SELECT o.orderno,o.id, sum(g.price *o.count) total_price 
FROM EX_GOOD g , EX_ORDER o
WHERE g.gno = o.gno
group by o.orderno, o.id;


--4. [과제] 3번에 주문 내역을 한 개의 상품명 외 몇 개로 출력 
-- [예] 20161212   머리끈 외 1개 

SELECT o.orderno, sum(g.price *o.count) total_price,SUM(COUNT), min(o.gno)
FROM EX_GOOD g , EX_ORDER o
WHERE g.gno = o.gno  
group by o.orderno;


SELECT G1.ORDERNO,G1.ID, G1.TOTAL_PRICE ,  
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' 외' || (G1.SUM -1) || '개')) LIST 
FROM EX_GOOD G, 
    (SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
     FROM EX_GOOD g , EX_ORDER o
     WHERE g.gno = o.gno  
     group by o.orderno,o.ID) G1
WHERE G1.GNO = G.GNO; 


SELECT G1.ORDERNO,  
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' 외' || (G1.SUM -1) || '개')) LIST 
FROM EX_GOOD G, 
    (SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
     FROM EX_GOOD g , EX_ORDER o
     WHERE g.gno = o.gno  
     group by o.orderno,o.ID) G1
WHERE G1.GNO = G.GNO; 
       
 -- DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' 외' || (G1.SUM -1) || '개'))    
 

 SELECT G1.ORDERNO, 
DECODE(G1.SUM, 1, G.GNAME, (G.GNAME ||' 외' || (G1.SUM -1) || '개')) LIST 
FROM EX_GOOD G INNER JOIN 
(SELECT o.orderno,O.ID, sum(g.price *o.count) total_price, SUM(COUNT) SUM, min(o.gno) GNO
FROM EX_GOOD g INNER JOIN EX_ORDER o
ON g.gno = o.gno 
group by o.orderno,o.ID) G1
ON G1.GNO = G.GNO
ORDER BY orderno;      



