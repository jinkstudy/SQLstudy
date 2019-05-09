--¿À¶óÅ¬ Á¤±Ô½Ä
--https://goalker.tistory.com/71

-- Å×ÀÌºí »ı¼º

CREATE TABLE reg_tab( text varchar2(20) );


-- ·¹ÄÚµå ÀÔ·Â

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
INSERT INTO reg_tab VALUES('°³');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('°í¾çÀÌ');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL');
INSERT INTO reg_tab VALUES('0BATGIRL');
INSERT INTO reg_tab VALUES('¹ÚÁã');

 --Ä¿¹Ô
 commit;
 
 select * from reg_tab;
 -- 1. textÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
 
 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t'); --Á¤±Ô½Ä Ç¥Çö "'^t'--->¼Ò¹®ÀÚ t·Î ½ÃÀÛÇÏ´Â."
 
 

-- 2. text ÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö

 SELECT *
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'t$'); --Á¤±Ô½Ä Ç¥Çö "¼Ò¹®ÀÚ t·Î ³¡³ª´Â --->'t$'
 

-- 3. Ã¹¹øÂ° 't'·Î½ÃÀÛÇÏ¿© 5¹øÂ° 'r'ÀÌ ÀÖ´Â µ¥ÀÌÅÍ °Ë»ö

 SELECT * 
 FROM reg_tab
 WHERE REGEXP_LIKE(text,'^t...r'); --Á¤±Ô½Ä Ç¥Çö "¼Ò¹®ÀÚ t·Î ³¡³ª´Â --->'t$'

 

-- 4. ¼ıÀÚ·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö
Select*
 From reg_tab 
 where regexp_like(text,'[0-9]$');
 

-- 5. ¼ıÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅ¸ °Ë»ö

 Select*
 From reg_tab 
 where regexp_like(text,'^[0-9]');

-- 6. ¼ıÀÚ°¡ ¾Æ´Ñ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö

  Select*
 From reg_tab 
 where regexp_like(text,'^[^0-9]');

-- 7. ´ë¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö

 Select*
 From reg_tab 
 where regexp_like(text,'^[A-Z]');

-- 8. ¼Ò¹®ÀÚ ¿ÜÀÇ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö

   Select*
 From reg_tab 
 where regexp_like(text,'^[^a-z0-9]');

-- 9. ÇÑ±Û·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
Select*
 From reg_tab 
 where regexp_like(text,'^[¤¡-ÆR]');
 

-- 10. µ¥ÀÌÅÍ Áß 'gg'³ª 'GG'°¡ µé¾îÀÖ´Â µ¥ÀÌÅÍ °Ë»ö
 Select*
 From reg_tab 
 where regexp_like(text,'gg|GG');
 