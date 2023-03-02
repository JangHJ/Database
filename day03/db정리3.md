## ✨Oracle sql문 정리✨
### ⭐핵심정리⭐
```
- DML, CRUD
- Create : sysdate, default, sequence, unique
- Read : where, distinct, order by, and, or, not, in
- Update : where, cell단위(칸)
- Delete : where, record단위(행), commit/rollback 대상(취소가능, truncate와 비교-취소불가능) 
```
### ✔️ depart 테이블 생성 - id(pk), name, instructor
```
CREATE TABLE depart (
	id VARCHAR2(100),
	name varchar2(100),
	instuctor varchar2(100),
	CONSTRAINT "DEPART_PK" PRIMARY KEY (id)
)
```
### ✔️ student 테이블 생성 후 pk, fk 추가
```
CREATE TABLE student (
	id VARCHAR2(100),
	name varchar2(100) NOT NULL,
	tel varchar2(100),
	depart_id varchar2(100)
)

ALTER TABLE HR.STUDENT ADD CONSTRAINT STUDENT_PK PRIMARY KEY (ID)

ALTER TABLE HR.STUDENT ADD CONSTRAINT FK_DEPART FOREIGN KEY (DEPART_ID) REFERENCES HR.DEPART(ID);
```

*개체 무결성 : pk설정과 관련! <br>
자동으로 작업을 할때마다  not null, unique자동체크*<br>

### ✔️ 제약조건을 넣어 테이블 생성
```
CREATE TABLE "HR"."TABLENAME" (
  ID VARCHAR2(100) PRIMARY KEY, 
	PW VARCHAR2(100), 
	NAME VARCHAR2(100), 
	TEL VARCHAR2(100), 
	TEAM DATE, -- 나중에 sysdate를 넣을 항목
	COMPANY VARCHAR2(100) DEFAULT 'multi' NOT NULL, 
	LOCATION VARCHAR2(100) UNIQUE
)
```

### ✔️ Read(select) - 행단위, 열단위
```
emp테이블을 이용
행단위 검색: selection
열단위 검색: projection
select  *  from emp;
select  deptno  from  emp; 특정컬럼
select  distinct  deptno    from emp;  중복제거 
select  ename, sal * 12   as  “yearsal”  from  emp; as(alias, 별칭) 
select  *  from  emp order by sal;  sal컬럼의 값 순서대로 정렬(오름차순)
select  *  from  emp order by sal  desc;  sal컬럼의 값 순서대로 정렬(내림차순)
```
### ✔️ Read(select) - where 조건검색
```
select * from emp where deptno = 30;
select * from emp where not deptno = 30;
select * from emp where deptno = 30  and  job = ‘salesman’;
select * from emp where deptno = 30  or  job = ‘salesman’;
select * from emp where sal >= 3000;
select * from emp where sal != 3000;
select * from emp where job in (‘MANAGER’, ‘SALESMAN’, ‘CLERK’); or연산, 포함
select * from emp where job not in (‘MANAGER’, ‘SALESMAN’, ‘CLERK’);
select * from emp where sal between 2000 and 3000; 사이값
select * from emp where sal not between 2000 and 3000;
```

### ✔️ Read(select) - where(조건검색, %(0~무한대) _(한글자))
```
select * from emp where ename like ‘_L%’;  L앞에는 한글자, 뒤에는 0~무한대
select * from emp where ename like ‘%AM%’;   AM이 앞에오거나, 가운데 오거나, 맨뒤에 와도 됨
select * from emp where ename not like ‘%AM%’; 
select * from emp where comm is null;
select * from emp where comm is not null;
```


