



-- commit과 rollback은 DML에만 영향을 줌.
-- commit; --메모리에서 수정한 것을 확정하는 것. 수시로 누르는 습관!
-- rollback; --메모리에서 수정한 것을 취소하는 것. 직전 commit까지 복구.

--emp(사원테이블)에 8000사번에 이름은 본인이름으로 월급 10000데이타 입력
Insert INTO emp(empno,ename,sal) VALUES (8000,'배진경',10000); 
Insert INTO emp(empno,ename,sal) VALUES (7788,'홍길동',9000);  --7788이 이미 존재. 무결성 제약조건에 위배되어 추가 불가.

Insert INTO emp(empno,ename,sal,deptno) VALUES (8001,'홍길동',9000,20);
Insert INTO emp(empno,ename,sal,deptno) VALUES (8002,'홍길숙',9000,60); --deptno에 60이 없음. 무결성 제약조건. foriegn key.

select*from emp; -- 내용확인
desc emp;
-- 구조확인

/*
    테이블명 : info
    
    hakbun  char(4)
    name    varchar2(10)
    jumin   char(14)
    gender  varchar2(10)
    age     number(3) -- -999~999까지.
*/

/*
--학번이 1001인 홍길동 학생 추가
--학번이 1002인 김길동 학생 추가
--학번이 1002인 맹길동 학생 추가
--주민번호가 801212-1234567인 홍길동 추가
--26세인 남자 추가
*/

CREATE TABLE info(
    hakbun char(4),
    name varchar2(10),
    jumin char(14),
    gender varchar2(10),
    age number(3)
);

Insert INTO info(hakbun,name) VALUES('1001','홍길동');
Insert INTO info(hakbun,name) VALUES('1002','김길동');
Insert INTO info(hakbun,name) VALUES('1002','맹길동');
Insert INTO info(jumin,name) VALUES('801212-1234567','홍길동');
Insert INTO info(gender,age) VALUES('남자',26);

select * from info;
Delete from info;
desc info;

--제약조건 (Primary 키)

ALTER TABLE info
ADD CONSTRAINT  pk_info_hakbun PRIMARY KEY (hakbun);

Insert INTO info(hakbun,name) VALUES('1001','홍길동');
Insert INTO info(hakbun,name) VALUES('1002','김길동');
Insert INTO info(hakbun,name) VALUES('1002','맹길동'); --학번을 pk로 지정 한 후 학번 중복되면 들어가지 않음. 에러. 
Insert INTO info(jumin,name) VALUES('801212-1234567','홍길동'); -- pk인 학번이 지정되지 않으면 에러.
Insert INTO info(gender,age) VALUES('남자',26);

-- 제약조건 확인
SELECT  constraint_name, constraint_type
FROM       user_constraints ;


DROP TABLE info;
/*
  -컬럼 레벨 제약조건 방식
           CREATE TABEL  table_name
           (
                      column_name  data_type [ CONSTRAINT pk_name ]  PRIMARY KEY
           );
          

    -테이블 레벨 제약조건 방식
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

--table 생성 후 not null 지정하기.
ALTER TABLE info 
    MODIFY (name varchar2(10) NOT NULL);
    
desc info;

Insert INTO info(hakbun,name) VALUES('1001','홍길동');
Insert INTO info(hakbun,name) VALUES('1002','김길동');
Insert INTO info(hakbun,name) VALUES('1002','맹길동'); --학번을 pk로 지정 한 후 학번 중복되면 들어가지 않음. 에러. 
Insert INTO info(jumin,name) VALUES('801212-1234567','홍길동2'); -- pk인 학번이 지정되지 않으면 에러.
Insert INTO info(hakbun,gender,age) VALUES('1111','남자',26); -- name에 not null조건이 걸려 있으므로, 이름을 입력하지 않았기 때문에 에러.

--UNIQUE 추가.
ALTER TABLE info
ADD CONSTRAINT uq_info_jumin UNIQUE (jumin);

SELECT *From info;

INSERT INTO info(hakbun,name,jumin) VALUES('1003','맹길동','990101-1234567');
INSERT INTO info(hakbun,name,jumin) VALUES('1004','박길동','990101-1234567'); --(SCOTT.UQ_INFO_JUMIN)에 위배됩니다. UNIQUE에 위배.

INSERT INTO info(name, jumin) VALUES('최길동','980101-1234567'); --pk 미입력이라서 에러.
INSERT INTO info(hakbun,name) VALUES('1005','문길동'); --unique는 not null 허용 이므로, unique 입력안해도 에러 없음.


--check
-- 입력데이터에 대한 제약조건을 주는 것. 입력데이터를 check해서 맞지 않으면 입력되지 않도록.
ALTER TABLE info ADD
CONSTRAINT ck_info_gender CHECK (gender IN ('남성','여성'));

INSERT INTO info(hakbun,name,gender) VALUES('1006','배길동','남성');
INSERT INTO info(hakbun,name,gender) VALUES('1007','전길동','남성');
INSERT INTO info(hakbun,name,gender) VALUES('1008','안길동','남자'); --에러!! 체크 제약조건(SCOTT.CK_INFO_GENDER)이 위배되었습니다.


-- Default : 제약조건은 아니지만 제약조건과 같이 많이 사용.

ALTER TABLE info MODIFY( gender char(4) default '남성') ; -- 값이 안들어온다면 기본값으로 남성을 설정하겠다.

INSERT INTO info(hakbun,name) VALUES('1009','강길동'); --남성을 입력하지 않아도, 기본값이 설정 되어 있기 때문에 남성이 자동입력된다.


-- foreign Key
DROP table info;

CREATE TABLE info(

    hakbun char(4),
    name varchar2(10) not null,
    jumin char(14),
    gender varchar2(10) default '남성',
    age number(3),
    deptno number(2), --다른 table에서 자료를 가져오려고 할 때 자료형을 꼭 맞춰줘야한다.
    CONSTRAINT pk_info_hakbun PRIMARY  KEY (hakbun),
    CONSTRAINT uq_info_jumin UNIQUE(jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ('남성','여성')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno) --dept table의 deptno와 연결 하겠다.
        
 );
 
 INSERT INTO info ( hakbun,name,gender,deptno) VALUES('9000','송혜교','여성',10);
 INSERT INTO info ( hakbun,name,deptno) VALUES('9001','전지현',50); --에러! 무결성 제약조건(SCOTT.FK_INFO_DEPTNO)이 위배되었습니다- 부모 키가 없습니다.
 INSERT INTO info ( hakbun,name,deptno) VALUES('9001','전지현',40);




