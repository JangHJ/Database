CREATE TABLE subject(
	강좌이름 varchar2(100),
	강의실 varchar2(100),
	CONSTRAINT "SUBJECT_PK" PRIMARY KEY (강좌이름)
)

CREATE TABLE department(
	학과 varchar2(100),
	학과사무실 varchar2(100),
	CONSTRAINT "DEPARTMENT_PK" PRIMARY KEY (학과)
)

CREATE TABLE record(
	학생번호 NUMBER(38, 0),
	강좌이름 varchar2(100),
	성적 number(38, 0),
	CONSTRAINT FK_강좌이름 FOREIGN KEY (강좌이름)
	  REFERENCES HR.SUBJECT (강좌이름)
)

ALTER TABLE HR.RECORD MODIFY 성적 FLOAT --성적 소수점 표기하기 위해서 NUMBER 에서 float로 변경

ALTER TABLE HR.RECORD ADD CONSTRAINT FK_학생번호 FOREIGN KEY (학생번호) REFERENCES HR.STUDENT_INFO(학생번호)

CREATE TABLE student_info(
	학생번호 number(38,0),
	학생이름 varchar2(100),
	주소 varchar2(100),
	학과 varchar2(100),
	CONSTRAINT "STDINFO_PK" PRIMARY KEY (학생번호),
	CONSTRAINT FK_학과 FOREIGN KEY (학과)
	  REFERENCES HR.DEPARTMENT (학과)
)





-- 각 테이블에 insert/delete/update를 각 2개이상씩 해보고, 이상현상이 발생하는지 확인할 것.
--  =============================== subject 테이블
SELECT * FROM subject

INSERT INTO SUBJECT
VALUES ('데이터베이스', '공학관101')

INSERT INTO SUBJECT
VALUES ('자료구조', '공학관102')

INSERT INTO SUBJECT
VALUES ('스포츠사회학', '체육관101')

UPDATE SUBJECT
SET (강의실) = '공학관110'
WHERE (강좌이름) = '자료구조'

UPDATE SUBJECT
SET (강의실) = '공학관111'
WHERE (강좌이름) = '데이터베이스'

DELETE FROM SUBJECT WHERE (강좌이름) = '데이터베이스'

DELETE FROM SUBJECT WHERE (강의실) = '공학관110'

-- =============================== department 테이블
SELECT * FROM DEPARTMENT

INSERT INTO DEPARTMENT
VALUES ('컴퓨터공학과', '공학관101')

INSERT INTO DEPARTMENT
VALUES ('체육교육과', '체육관101')

UPDATE DEPARTMENT
SET (학과) = '컴퓨터디자인과'
WHERE (학과) = '컴퓨터공학과'

UPDATE DEPARTMENT
SET (학과) = '교육심리학과'
WHERE (학과) = '체육교육과'

DELETE FROM DEPARTMENT WHERE (학과) = '컴퓨터디자인과'

DELETE FROM DEPARTMENT WHERE (학과) = '교육심리학과'

-- =============================== student_info 테이블
SELECT * FROM STUDENT_INFO

INSERT INTO STUDENT_INFO
VALUES (401, '김연아', '서울', '컴퓨터공학과') -- depart에 아직 학과컬럼을 안만들어놓으면 오류발생

INSERT INTO STUDENT_INFO
VALUES (501, '장미란', '경기도', '체육교육과')

UPDATE STUDENT_INFO
SET (학과) = '체육교육과'
WHERE (학생번호) = 401

UPDATE STUDENT_INFO
SET (주소) = '강원도'
WHERE (학생번호) = 501

DELETE FROM STUDENT_INFO WHERE (학생번호) = 401

DELETE FROM STUDENT_INFO WHERE (학생번호) = 501

-- =============================== record 테이블
SELECT * FROM RECORD

INSERT INTO RECORD
VALUES (401, '데이터베이스', 4.0) -- 아직 student_info에 학생번호가 없으면 오류발생 / 과목이름이 다르다면 오류발생

INSERT INTO RECORD
VALUES (501, '스포츠사회학', 3.0)

INSERT INTO RECORD
VALUES (401, '자료구조', 4.5)

UPDATE RECORD
SET (성적) = 4.5
WHERE (학생번호) = 401 AND (강좌이름) = '데이터베이스'

UPDATE RECORD
SET (성적) = 3.5
WHERE (학생번호) = 501 AND (강좌이름) = '스포츠사회학'

DELETE FROM RECORD WHERE (학생번호) = 401 AND (강좌이름) = '데이터베이스'

DELETE FROM RECORD WHERE (학생번호) = '501'

-- join 2개 해보기

SELECT r.학생번호, s.강좌이름, s.강의실
FROM SUBJECT s, RECORD r 
WHERE s.강좌이름 = r.강좌이름
ORDER BY 학생번호

SELECT si.학생번호, si.학생이름, si.학과, r.강좌이름, r.성적
FROM STUDENT_INFO si, RECORD r 
WHERE si.학생번호 = r.학생번호
ORDER BY 학생번호

SELECT si.학생번호, si.학생이름, si.학과, d.학과사무실
FROM STUDENT_INFO si, DEPARTMENT d
WHERE d.학과 = si.학과
ORDER BY 학생번호

-- 삽입시, 많은 Null을 발생시키지 않는지 확인

-- 삭제시, 의도치 않은 컬럼까지 삭제하지는 않는지 확인

-- 갱신시, 정보가 불일치하지는 않는지 확인

-- 각 테이블이 1NF, 2NF, 3NF를 따르는지 확인


-- 검색 정보 여러개
SELECT * FROM HR.STUDENT_INFO WHERE 학생번호 IN
	(SELECT 학생번호 FROM HR.RECORD WHERE 성적 = 3.5)
	
SELECT * FROM HR.RECORD WHERE 강좌이름 =
	(SELECT 강좌이름 FROM HR.SUBJECT WHERE 강의실 = '공학관110')