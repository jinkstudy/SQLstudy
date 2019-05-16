 --table 생성 시 파티션생성
 -- 데이터가 많은 경우, 파티션 분리 해서 검색 시 용이하도록.
 
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

Insert into sawon_p VALUES(101,'삼순이','개발',5000);
Insert into sawon_p VALUES(3001,'사순이','디자인',5000);
Insert into sawon_p VALUES(5001,'오순이','디자인',5000);    

--sawon_p2에 포함된 데이터만 불러온다.

select * from sawon_p partition(sawon_p2);


-- 사순이 직업을 개발로 변경
UPDATE SAWON_P SET JOB = '개발' WHERE SANAME = '사순이';

-- 사순이 사번을 1001번으로 변경
UPDATE SAWON_P SET SABUN = 1001 WHERE SANAME = '사순이';   --에러  : 파티션이 나눠지 경우, 데이터 수정시 분할영역이 변경되면 업데이트 되지 않음.

-- 사순이 사번을 2001번으로 변경
UPDATE SAWON_P SET SABUN = 2001 WHERE SANAME = '사순이';   --됨! : 같은 파티션이기 때문에.
