--오라클 정규식
--https://goalker.tistory.com/71

-- 테이블 생성

CREATE TABLE reg_tab( text varchar2(20) );


-- 레코드 입력

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
INSERT INTO reg_tab VALUES('개');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('고양이');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL');
INSERT INTO reg_tab VALUES('0BATGIRL');
INSERT INTO reg_tab VALUES('박쥐');

 --커밋
 commit;
 
 select * from reg_tab;
 -- 1. text컬럼의 문자열에서 't'로 시작하는 데이터 검색
 
 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t'); --정규식 표현 "'^t'--->소문자 t로 시작하는."
 
 

-- 2. text 컬럼의 문자열에서 't'로 끝나는 데이터 검색

 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'t$'); --정규식 표현 "소문자 t로 끝나는 --->'t$'
 

-- 3. 첫번째 't'로시작하여 5번째 'r'이 있는 데이터 검색

 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t...r'); --정규식 표현 "소문자 t로 끝나는 --->'t$'

 

-- 4. 숫자로 끝나는 데이터 검색
Select*
 From reg_tab 
 where regexp_like(text,'[0-9]$');
 

-- 5. 숫자로 시작하는 데이타 검색

 Select*
 From reg_tab 
 where regexp_like(text,'^[0-9]');

-- 6. 숫자가 아닌 문자로 시작하는 데이터 검색

  Select*
 From reg_tab 
 where regexp_like(text,'^[^0-9]');

-- 7. 대문자로 시작하는 데이터 검색

 Select*
 From reg_tab 
 where regexp_like(text,'^[A-Z]');

-- 8. 소문자 외의 문자로 시작하는 데이터 검색

   Select*
 From reg_tab 
 where regexp_like(text,'^[^a-z0-9]');

-- 9. 한글로 시작하는 데이터 검색
Select*
 From reg_tab 
 where regexp_like(text,'^[ㄱ-힣]');
 

-- 10. 데이터 중 'gg'나 'GG'가 들어있는 데이터 검색
 Select*
 From reg_tab 
 where regexp_like(text,'gg|GG');
 