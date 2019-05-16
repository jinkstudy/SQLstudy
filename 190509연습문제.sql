/*1. sawon 테이블을 생성하세요.
           sabun은 6자리 숫자
           sawon_name은최대 한글 5자리
           ubmu는최대 한글 10자리
           weolgub는정수형 8자리와 소수점 2자리
           buseo는숫자 3자리
  */  
  
CREATE TABLE sawon (
    sabun char(6),
    sawon_name varchar2(10),
    ubmu varchar2(20),
    weolgub number(10,2),
    buseo number(3)
);

--2. 위의 테이블에서 sabun을기본키로 설정

ALTER TABLE sawon
ADD CONSTRAINT  pk_sawon_sabun PRIMARY KEY (sabun);

--3. 최대 한글 10자리의 jiyeok 컬럼을 추가하되 NULL 값이 입력되지 않도록 지정

ALTER TABLE sawon
ADD  jiyeok varchar(20) NOT NULL;

--4. weolgub 컬럼은 정수형7자리로 변경
ALTER TABLE sawon
MODIFY  weolgub number(7);

-- 5. ubmu컬럼은 ‘개발’, ‘유지보수’, ‘관리’ 만데이터 값으로 입력되도록 지정
ALTER TABLE sawon
ADD CONSTRAINT ck_sawon_ubmu CHECK(ubmu in ('개발','유지보수','관리'));

--6. ubmu컬럼에 데이터가 입력이 안될 경우 디폴드값으로 ‘개발’을 설정
ALTER TABLE sawon MODIFY( ubmu varchar2(20) default '개발');
 

--7. buseo 테이블을 생성하세요
           --buseo_no는숫자 3자로 이루어진 번호로 기본키
           --buseo_name은최대 한글 10자리
           
CREATE TABLE buseo (
buseo_no number(3),
buseo_name VARCHAR2(20),
CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);


 
--8. sawon 테이블의 buseo컬럼을 buseo 테이블의 buseo_no를참조하는 외래키로 설정

ALTER TABLE sawon 
ADD CONSTRAINT fk_sawon_buseo FOREIGN KEY(buseo)REFERENCES buseo (buseo_no);

-- 9. buseo 테이블에 데이터 입력
/*
 buseo_no    buseo_name

 101         소프트웨어유지보수부
 202         관리부
 303         인적자원부
*/

INSERT INTO buseo(buseo_no,buseo_name) VALUES (101,'소프트웨어유지보수부');
INSERT INTO buseo(buseo_no,buseo_name) VALUES (202,'관리부');
INSERT INTO buseo(buseo_no,buseo_name) VALUES (303,'인적자원부');


--10. sawon 테이블에 데이터 입력 (입력이 안될 경우도 있음)
/*
sabun       sawon_name      ubmu        weolgub     buseo       jiyeok

8001        홍길동이군                   100000          101        부산
8002        홍길자             사무      200000          202         인천
8003        홍길순             개발                      111         대전
8004        홍길석                        12345678                  서울
8005        홍길철             유지보수                    303         판교
*/

INSERT INTO sawon(sabun,sawon_name,weolgub,buseo,jiyeok) VALUES (8001,'홍길동이군',100000,101,'부산');
INSERT INTO sawon(sabun,sawon_name,ubmu,weolgub,buseo,jiyeok) VALUES (8002,'홍길자','사무',200000,201,'인천'); --에러! 사무 들어가지 않음.
INSERT INTO sawon(sabun,sawon_name,buseo,jiyeok) VALUES (8003,'홍길순',111,'대전'); --에러! 부서no가 없음.
INSERT INTO sawon(sabun,sawon_name,weolgub,jiyeok) VALUES (8004,'홍길석',12345678,'서울');  -- ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO sawon(sabun,sawon_name,ubmu,buseo,jiyeok) VALUES (8005,'홍길철','유지보수',303,'판교');

--11. sawon 테이블에서 jiyeok 컬럼을 제거
ALTER TABLE sawon DROP( jiyeok);
 

--12. buseo 테이블에서 buseo 명이 ‘인적자원부’인 행을 삭제
DELETE FROM buseo where buseo_name='인적자원부';  
--ORA-02292: 무결성 제약조건(SCOTT.FK_SAWON_BUSEO)이 위배되었습니다- 자식 레코드가 발견되었습니다
 

--13. sawon 테이블이 모든 내용을 삭제하고 저장공간을 해제
DELETE FROM sawon; 
DROP TABLE sawon;

 

--14. 1~8 단계까지를 하나의CREATE 문으로 작성

CREATE TABLE sawon (
    sabun char(6),
    sawon_name varchar2(10),
    ubmu varchar2(20)default '개발',
    weolgub number(7),
    buseo char(3),
    jiyeok varchar(20) NOT NULL,
    CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_sawon_ubmu CHECK(ubmu in ('개발','유지보수','관리')),
    CONSTRAINT fk_sawon_buseo FOREIGN KEY(buseo)REFERENCES buseo (buseo_no)
    
);








desc buseo;
select*from buseo;
select*from sawon;
desc sawon;
SELECT  constraint_name, constraint_type
FROM       user_constraints ;


           
          