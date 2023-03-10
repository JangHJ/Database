CREATE TABLE "HR"."BOARD" 
   (	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITEDATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"VIEWCOUNT" NUMBER(38,0)
   )
   
SELECT * FROM BOARD

CREATE TABLE "HR"."NOTICE" 
   (	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITEDATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"VIEWCOUNT" NUMBER(38,0)
   )
​
-- 추천게시판(recommend)
-- re_no 숫자
-- title, content, 
-- writer 문자
   
CREATE TABLE RECOMMEND (
	RE_NO NUMBER(38,0),
	TITLE VARCHAR2(100),
	CONTENT VARCHAR2(100),
	WRITER VARCHAR2(100)
)
   
SELECT * FROM RECOMMEND

DROP TABLE RECOMMEND //테이블 통째로 드롭함

ALTER TABLE HR.RECOMMEND MODIFY TITLE VARCHAR2(300)

ALTER TABLE HR.RECOMMEND ADD VIEWCOUNT NUMBER(38,0)

ALTER TABLE RECOMMEND DROP COLUMN VIEWCOUNT;

ALTER TABLE HR.RECOMMEND ADD TEST VARCHAR2(100);

ALTER TABLE HR.RECOMMEND DROP COLUMN TEST;

ALTER TABLE HR.RECOMMEND DROP COLUMN TEST2;

ALTER TABLE HR.RECOMMEND DROP COLUMN TEST3;

-- BOARD3 TABLE (BOARD의 DDL이용)
CREATE TABLE "HR"."BOARD3" 
(	"BOARDNO" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENTS" VARCHAR2(100), 
	"WRITER" VARCHAR2(100), 
	"WRITEDATE" DATE, 
	"RECOMMEND" NUMBER(38,0), 
	"VIEWCOUNT" NUMBER(38,0)
) 

ALTER TABLE HR.BOARD3 ADD TEST VARCHAR2(100);
ALTER TABLE HR.BOARD3 ADD TEST2 VARCHAR2(100);
ALTER TABLE HR.BOARD3 ADD TEST3 VARCHAR2(100);
ALTER TABLE HR.BOARD3 DROP COLUMN TEST;
ALTER TABLE HR.BOARD3 DROP COLUMN TEST2;
ALTER TABLE HR.BOARD3 DROP COLUMN TEST3;

DROP TABLE BOARD3

-- DCL : DB관리/제어해주는 문법(계정생성, 계정권한부여, 백업, 복구)

CREATE USER APPLE IDENTIFIED BY A1234 -- 계정생성

GRANT CONNECT, resource, dba TO apple -- 권한부여

DROP TABLE MEMBER;

DROP TABLE BBS;

CREATE TABLE "HR"."PRODUCT222" 
(
	"ID" VARCHAR2(100) PRIMARY key, 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"PRICE" NUMBER(38,0)
)
 
CREATE TABLE "HR"."PRODUCT3" 
(
	"ID" VARCHAR2(100) PRIMARY key, 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"PRICE" NUMBER(38,0)
)

CREATE TABLE BBS(
	id varchar2(100),
	title varchar2(100),
	content varchar2(100),
	writer varchar2(100)
)

INSERT INTO MEMBER VALUES ('100', '200', 'park', '011')

INSERT INTO MEMBER VALUES ('200', '200', 'park', '011')

INSERT INTO MEMBER VALUES ('300', '200', 'park', '011')

SELECT * FROM "MEMBER"

SELECT * FROM MEMBER WHERE ID='100' -- ID가 100인 모든 컬럼

SELECT ID, NAME FROM MEMBER WHERE ID = '100' --ID가 100인 ID, NAME컬럼

SELECT NAME, ID FROM MEMBER WHERE ID = '100' --ID가 100인 NAME, ID컬럼

SELECT ID AS 아이디, NAME FROM MEMBER WHERE ID = '100'; --ID가 100인 ID컬럼명을 아이디로 바꿔서 보여줘

SELECT TEL FROM MEMBER WHERE NAME = 'park'

UPDATE MEMBER SET NAME = 'kim' WHERE id = '100'

UPDATE "MEMBER" SET pw = '8888', tel='9999' WHERE id='ice'

DELETE FROM "MEMBER" WHERE id = '100' 

DELETE FROM "MEMBER" WHERE tel = '011'

SELECT * FROM "MEMBER" WHERE id='200' AND tel = '011'

CREATE TABLE product (
	id varchar2(200), 
	name varchar2(200), 
	content varchar2(200), 
	price varchar2(200), 
	company varchar2(200), 
	img varchar2(200)
)



CREATE TABLE "HR"."PRODUCT3" 
   (	"ID" NUMBER(38, 0), 
		"NAME" VARCHAR2(100), 
		"CONTENT" VARCHAR2(100), 
		"PRICE" NUMBER(38,0),
		"COMPANY" VARCHAR2(100),
		"IMG" VARCHAR2(100)
   )

SELECT * FROM PRODUCT3

-- 1. price로 내림차순 정렬하여 전체컬럼 검색
SELECT * FROM PRODUCT3 ORDER BY id DESC

-- 2. company로 오름차순 정렬하여 제품의 이름, 내용, 가격 검색
SELECT name, content, price FROM PRODUCT3 ORDER BY COMPANY

-- 3. id가 100인 제품의 이름과 가격 검색
SELECT name, price FROM PRODUCT3 WHERE id = 100

-- 4. price가 5000인 제품명과 회사명
SELECT company FROM PRODUCT3 WHERE price=5000

-- 5. id가 100이고 가격이 1000인 제품명과 이미지 검색
SELECT name, img FROM PRODUCT3 WHERE id=100 AND price=1000

-- 6. 회사명이 c100인 회사명과 제품명
SELECT company, content FROM PRODUCT3 WHERE company='c100'

-- 7. 회사명이 c100, c200인 제품명과 가격
SELECT content, price FROM PRODUCT3 WHERE COMPANY = 'c100' OR COMPANY = 'c200'

-- 8. price가 5000원인 제품의 content를 품절로 수정
UPDATE PRODUCT3 SET content = '품절' WHERE price = 5000

-- 9. id가 100, 102번 제품의 img를 o.png로, price를 10000으로 수정
UPDATE PRODUCT3 SET price = 10000, img = 'o.png' WHERE id = 100 OR id = 102

-- 10. id가 101번 제품의 company를 apple, name은 appleshoes로 수정
UPDATE PRODUCT3 SET COMPANY = 'apple', name='appleshoes' WHERE id = 101

-- 11. name이 shoes1이거나 id가 107인 제품 삭제
DELETE FROM PRODUCT3 WHERE name = 'shoes1' OR id = 107 

-- 12. 회사명이 c100인 경우 모든 정보 삭제
DELETE FROM PRODUCT3 WHERE COMPANY = 'c100'

-- 13. 테이블의 모든 정보 삭제
DELETE FROM PRODUCT3

-- 14. 테이블 삭제
DROP TABLE PRODUCT3

   