--> varchar2, char의 차이
--> varchar2 : var(변하다, variable) + char(문자)
-->			2글자면 2글자 들어갈 만큼만 저장공간 사용
-->			100글자면 100글자 들어갈 만큼만 저장공간 사용
-->	char(100) : 저장공간이 고정, 주민번호, 전화번호, 우편번호, 사번

--> 저장공간은 남겨두고 데이터만 지움
--> 데이터를 복구/취소(rollback, 롤백) 가능
--> truncate로 지우면 저장공간까지 지워짐. 복구/취소 불가능

-- 문자 함수
SELECT * FROM PRODUCT 

SELECT * FROM PRODUCT2

SELECT * FROM emp

SELECT upper(ename) FROM EMP

SELECT LENGTH(ename) FROM EMP

SELECT SUBSTR(ename, 2) FROM EMP

SELECT replace(ename, 'L', 'N') FROM EMP --비파괴

SELECT LPAD(ename, 6, '#') FROM EMP 

SELECT RPAD(ename, 6, '#') FROM EMP 

SELECT CONCAT(empno, ename) FROM EMP

SELECT empno || ':' || ename FROM EMP -- 2개 이상 결합

SELECT * FROM EMP

SELECT TRIM(BOTH 'A' FROM ename) FROM EMP --양쪽 끝에 A를 제거 비파괴

SELECT TRIM(LEADING 'A' FROM ename) FROM EMP --앞쪽에 A를 제거

SELECT TRIM(TRAILING 'A' FROM ename) FROM EMP --뒤쪽에 A를 제거

SELECT TRIM(' hong ') FROM EMP --비파괴



UPDATE EMP
SET comm = null
WHERE comm = 0

SELECT *
FROM EMP

SELECT sal + comm AS total
FROM EMP
--숫자 함수/날씨 함수/자료형 변환 함수
-- ROUND(1234.567, 1) → 1234.6, ROUND(1234.567, -1) → 1230 반올림
-- TRUNC(1234.567, 1) → 1234.5 //소수점1번째자리 뒤를 버림
-- CEIL(1234.56) → 1235 올림
-- FLOOR(1234.56) → 1234 내림
-- ADD_MONTHS(SYSDATE, 3) → 3개월이후 날짜, 10년 이후 날짜(120)
-- MONTHS_BETWEEN(입사날짜, 현재날짜) → 재직일수(소수점일 수 있음)
-- TRUNC(MONTHS_BETWEEN(입사날짜, 현재날짜))
-- NEXT_DAY(SYSDATE, ‘월요일') → 2022-11-01기준, 2022-11-07
-- LAST_DAY(SYSDATE) → 2022-11-30
-- select TO_CHAR(SYSDATE, ‘YYYY/MM/DD HH24:MI:SS’) from DUAL;
-- (mysql에서는 date_format(now(), ‘%Y%m%d%H%i%s’)
-- select TO_DATE(‘2018-07-14’, ‘YYYY-MM-DD’) from DUAL;

SELECT ROUND(1234.567, 1) FROM EMP

SELECT ROUND(1234.567, -1) FROM EMP -- 반올림

SELECT TRUNC(1234.567, 1) FROM emp -- 버림

SELECT CEIL(1234.567) FROM emp -- 올림

SELECT FLOOR(1234.567) FROM emp -- 내림

SELECT ADD_MONTHS(SYSDATE, 3) FROM EMP -- 3개월 이후 날짜

SELECT * FROM emp

-- 문자함수, 숫자함수 정리 문제
-- 1. ENAME의 글자수 검색
SELECT LENGTH(ename) FROM emp

-- 2. JOB이 MANAGER인 사람의 ENAME 글자수 검색
SELECT LENGTH(ename) FROM emp WHERE job = 'MANAGER'

-- 3. COMM이 null인 사람의 ENAME, JOB 검색
SELECT ename, job FROM emp WHERE COMM IS NULL

-- 4. COMM이 null이 아닌 사람의 HIREDATE 검색
SELECT HIREDATE FROM emp WHERE COMM IS NOT NULL

-- 5. ENAME의 2번째글자부터 끝까지 검색
SELECT SUBSTR(ename, 2)  FROM emp

-- 6. JOB의 1번째 글자부터 3번째 글자까지 검색
SELECT SUBSTR(job, 1, 3)  FROM emp

-- 7. ENAME의 글자 중 K를 P으로 변경하여 검색
SELECT replace(ename, 'k', 'p') FROM emp

-- 8. ENAME과 ENPNO을 이용하여 ‘7369번은 SMITH입니다'로 출력
SELECT empno || '번은 ' || ENAME || '입니다' FROM EMP 

-- 9. HIREDATE 이용하여 입사한 월과 요일을 출력
SELECT ename, TO_CHAR(HIREDATE, 'MONTH' ) AS MONTH,
		TO_CHAR(HIREDATE, 'DAY' ) AS DAY
		FROM emp

-- 10. JOB이 MANAGER이면 level1, SALESMAN이면 level2,
--		기타이면 level3라고 LEVEL_RESULT컬럼에 출력
SELECT empno, ename, job, sal,
	CASE job
		WHEN 'MANAGER' THEN 'level1'
		WHEN 'SALESMAN' THEN 'level2'
		ELSE 'level3'
		END AS level_result
		FROM emp

SELECT * FROM EMP

-- 집계/그룹함수
SELECT count(sal)
FROM EMP

SELECT count(sal), sum(sal), avg(sal), min(sal), max(sal)
FROM EMP
WHERE job = 'SALESMAN'

SELECT JOB, count(sal), sum(sal), avg(sal), min(sal), max(sal)
FROM EMP
GROUP BY JOB
HAVING count(sal) >= 4 --그룹을 지어서 검색 후, 필터링을 하고자 하는 경우
ORDER BY job DESC -- 이미 모든 검색이 다 끝난 후, 그 결과를 정렬하고자 하는 경우, 맨 끝


SELECT avg(sal) FROM EMP
GROUP BY deptno -- deptno별로 sal평균

SELECT avg(sal) FROM EMP
GROUP BY DEPTNO
ORDER BY deptno DESC

SELECT avg(sal) FROM emp
GROUP BY DEPTNO 
HAVING AVG(SAL) >= 2000 -- 조건은 HAVING으로 써야함.!
ORDER BY DEPTNO desc;  -- deptno별로 sal평균을 내되 평균이 2000이상인 값만 내림차순으로 출력

SELECT * FROM EMP

-- 1. 전체 직원수 출력
SELECT count(empno) FROM emp

-- 2. DEPTNO가 20이거나 MGR이 7700이하인 직원수 출력
SELECT count(empno) FROM emp WHERE deptno = 20 OR mgr <= 7700

-- 3. DEPTNO가 10 또는 20인 직원의 SAL최저 출력
SELECT min(sal) FROM emp WHERE deptno = 10 OR DEPTNO = 20

-- 4. 직원의 SAL 최저, 최고, 합계 출력
SELECT min(sal), max(sal), sum(sal) FROM emp

-- 5. DEPTNO별  SAL 평균 출력
SELECT deptno, avg(sal)
FROM EMP
GROUP BY deptno

-- 6. DEPTNO별  SAL 합계를 DEPTNO 오름차순으로 출력
SELECT deptno, sum(sal)
FROM EMP
GROUP BY deptno
ORDER BY DEPTNO 

-- 7. DEPTNO별  SAL 평균이 2000이상인 SAL평균을 DEPTNO역순으로 출력
SELECT deptno, avg(sal)
FROM EMP
GROUP BY deptno
HAVING avg(sal) >= 2000
ORDER BY DEPTNO desc

-- 8. JOB이 MANAGER인 직원의 전체 수, 월급의 평균 검색
SELECT count(empno), avg(sal)
FROM EMP
WHERE job = 'MANAGER'

-- 9. ENAME에 S를 포함하는 직원의 전체 수를 검색
SELECT count(*)
FROM EMP
WHERE ename LIKE '%S%'

-- 10. SAL이 3000이상이고,  COMM이 null이 아닌 직원의 전체 수 검색, SAL의 역순으로 출력
SELECT * FROM emp
WHERE sal >= 3000 AND comm IS NOT NULL
ORDER BY sal desc



