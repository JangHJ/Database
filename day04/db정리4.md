## 테이블을 합해서 검색하는 방법 3가지


- 집합
- 조인
- 서브쿼리


<br>

## 집합 📝
|종류|내용|
|:---:|:---:|
|UNION|중복제거 합집합|
|UNION ALL|제거없이 모두 출력|
|MINUS|차집합|
|INTERSECT|교집합|

<br>

## 조인 <img width="91" alt="star3" src="https://user-images.githubusercontent.com/78655692/151471989-9e21d7a8-a7b6-44b0-b598-2bb204b56b00.png">

검색할 내용이 여러 테이블을 합해서 해야하는 경우에 사용한다. <br>
비슷한 예로 집합이 있지만 공통된 요소가 존재할 때는 두 개의 테이블을 합치기 위해 join을 사용한다.

```
- Inner join : join 조건이 공통적인 값만 추출
- Right outer join : 오른쪽 테이블의 모든 값 + 왼쪽 테이블은 기준에 맞는 값만
- Left outer join : 왼쪽 테이블의 모든 값 + 오른쪽 테이블은 기준에 맞는 값만
```
<br>

## delete, update차이 ❓

    delete -> row 삭제
    update -> column단위 삭제
    
<br>

## 정리문제 🌠

### Q1. SQL을 3가지로 구분, 각각을 간단 설명, 예를 들어보세요.


|용어|역할|
|:---:|:---:|
|DDL|데이터 항목 정의|
|DML|데이터 조작/관리|
|DCL|DBMS 제어|

<br>

### Q2. DML로 할 수 있는 조작 4가지를 부르는 말

```
CRUD
```

### Q3. DML의 조작 4가지에 해당하는 각 SQL문

```
C - insert, R - select, U - update, D - delete
```

### Q4. 정형데이터 베이스란?

```
데이터(항목)를 정해서 저장하는 db
```

### Q5. 스키마란?

```
데이터 베이스를 구성하는 데이터 개체, 속성 관계등을 정의한 것
데이터를 저장하기 위한 틀(뼈대) : db명, 테이블명, 컬럼명, 제약조건
```

### Q6. 제약조건이란? 예 1개 이상

```
Not null, pk, fk, unique
```

### Q7. primary key를 왜 설정하는가?

```
개체 무결성 / not null, unique 자동체크
- 데이터 일관성
- 데이터의 중복 방지
```

### Q8. foreign key를 왜 설정하는가?

```
문제가 있는 데이터가 들어가지 않도록 자동체크해줌
참조 무결성
참조하고 있는 테이블의 기본키 외 다른 값을 가질 수 없도록 외래키 컬럼에 저장되어지는
데이터를 제어하게 된다. -> 참조하는 테이블의 무결성을 높여주게 된다
```

### Q9. 저장할 대상을 부르는 말? 한글/영어

```
개체 Entity
```

### Q10. varchar2와 char의 차이

```
char는 저장공간이 고정되어있다.
varchar2는 글자가 들어간 만큼만 저장공간을 사용한다
```

### Q11. join의 3가지 종류 비교 

```
inner join : 조인조건이 공통적인 것만 검색
left outer join : 왼쪽 테이블 모두 + 오른쪽 테이블(기준에 맞는거만)
right outer join : 오른쪽 테이블 모두 + 왼쪽 테이블(기준에 맞는거만)
```

