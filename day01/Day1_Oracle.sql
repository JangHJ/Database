-- 테이블명 + 항목명 + 항목에 들어가는 데이터타입
CREATE TABLE bbs2(
	id varchar2(100),
	title varchar2(100),
	content varchar2(100),
	writer varchar2(100),

)

CREATE TABLE "HR"."PRODUCT2" 
   (	"ID" VARCHAR2(100), 
	"NAME" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"PRICE" NUMBER(38,0)
   ) 
   
 
   CREATE TABLE "HR"."MEMBER3" 
   (	"ID" VARCHAR2(100), 
	"PW" VARCHAR2(100), 
	"NAME" VARCHAR2(100), 
	"TEL" VARCHAR2(100)
   )

   INSERT INTO MEMBER VALUES ('park', '1234', 'park', '011')

   INSERT INTO MEMBER VALUES ('apple', '1111', 'apple', '011')
   
   INSERT INTO MEMBER VALUES ('ice', '2222', 'ice', '012')

   INSERT INTO MEMBER VALUES ('melon', '3333', 'melon', '013')
   
   SELECT * FROM "MEMBER"
   
   CREATE TABLE "HR"."HOBBY2" 
   (	"HOBBYID" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"LOCATION" VARCHAR2(100)
   )
   
   INSERT INTO HOBBY VALUES (100, 'run', 'seoul');
   INSERT INTO HOBBY VALUES (200, 'book', 'busan');

   SELECT * FROM "HOBBY";
  
   SELECT CONTENT, LOCATION FROM "HOBBY";
   