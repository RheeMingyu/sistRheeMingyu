--복습문제
--Q1. emp에서 job종류별로 직업군을 한번씩만 출력
select DISTINCT job 직업군 from emp;
--Q2.emp테이블에서 사원명이 A나 S로 시작하는 사람만 출력(사원번호, 사원명)
select empno 사원번호,ename 사원명 from emp where ename like 'A%' or ename like 'S%';
--Q3.emp에서 deptno가 10인부서만 출력(사원명 부서번호)
select ename 사원명, deptno 부서번호 from emp where deptno=10;
--Q4.emp에서 급여(pay)가 평균보다 더 높은사원만 사원명 급여를 출력
select ename 사원명,sal 급여 from emp where sal>(select avg(sal) from emp);
--Q5.SCOTT의 급여와 동일하거나 더많이 받는 사람의 사원명과 급여를 출력
select ename 사원명,sal 급여 from emp where sal>=(select sal from emp where ename='SCOTT');
--Q6.emp에서 hiredate에서 월이 5월인 사람만 사원명 입사일자 출력(to_char사용)
select ename 사원명,hiredate 입사일자 from emp where to_char(hiredate,'mm')='05';

--7월1일
--1.테이블 생성
--primary key는 기본키를 의미 not null+unique를 의미한다

--test테이블
create table test(num number(5) primary key,
name varchar2(20),score number(6,2),birth date);

desc test;--구조 보기
select * from test;

--test에 전체데이터 insert
insert into test values(1,'손석구',67.2,'1993-12-03');
--test에 일부데이터 insert
insert into test (num,name) values (2,'강호동');

--insert 에러
--무결성 제약 조건(RHEEMINGYU.SYS_C008353)에 위배
insert into test values(4,'이영애',68.72,'1998-12-12');

--sysdate현재날짜 의미
insert into test values(5,'이효리',72.32,sysdate);

--alter
--나이를 저장할 컬럼 추가,무조건 null로 추가
--ALTER TABLE 테이블명 ADD 추가할컬럼명 데이터타입;

alter table test add age number(5);

--주소를 저장할 컬럼을 추가하는데 초기값을 강남구 라고 지정
alter table test add addr varchar2(30) default '강남구';

--insert into test values(4,'이영애',68.72,'1998-12-12',22,'republic of korea seoul city 123450998661234689');
--주소 저장컬럼 30=>50
--ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입;
alter table test modify addr varchar2(50);

--age 타입을 문자열(10)으로 변경하고 초기값을 20으로 설정
--기존 null은 그대로 있고 새로 insert하는것 부터 초기값 들어감
alter table test modify age varchar2(10) default '20';

insert into test (num,name) values (10,'강호동');

--num의 오름차순 출력
select * from test order by num;
--이름의 내림차순 검색
select * from test order by name desc;

--drop
--ALTER TABLE 테이블명 DROP COLUMN 삭제할컬럼명
--age라는 컬럼을 삭제
alter table test drop column age;
--addr 삭제
alter table test drop column addr;

--컬럼명 변경
--ALTER TABLE 테이블명 RENAME COLUMN OLD컬럼명 TO NEW컬럼명;
--score==>jumsu
alter table test rename column score to jumsu;
--birth==>birthday
alter table test rename column birth to birthday;

--테이블 삭제 test
drop table test;


--시퀀스 생성
--시퀀스 기본으로 생성,1부터 1씩 증가하는 시퀀스 생성됨
create sequence seq1;

--전체시퀀스 확인
select * from seq;

--다음 시퀀스값을 발생 콘솔에 출력
select seq1.nextval from dual;

--현재 마지막 발생한 시퀀스값
select seq1.currval from dual;

--seq1삭제
drop sequence seq1;

--10부터 5씩 증가하는 시퀀스생성-cache값 없애기
create sequence seq2 start with 10 increment by 5 nocache;

--시퀀스 발생
select seq2.nextval from dual;

--시퀀스2 삭제
drop sequence seq2;

--seq1 시작값:5 증가값:2 끝값:30 캐시:no cycle:yes
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 시작값 1 증가값 1 cache no
create sequence seq2 nocache;
--seq3 시작값 1 증가값 2 cache no
create sequence seq3 start with 1 increment by 2 nocache;

--출력
select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--전체삭제
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

--------------------시퀀스1개생성,테이블 생성
create sequence seq_start nocache;

create table personinfo(num number(5) primary key,
name varchar2(20),
job varchar2(30),
gender varchar2(20),
age number(5),
hp varchar2(20),
birthday date);

--birthday==>ipsaday
alter table personinfo rename column birthday to ipsaday;

--insert
insert into personinfo values(seq_start.nextval,'이민규','programmer','m',29,'010-8250-9354','2023-06-15');
insert into personinfo values(seq_start.nextval,'karen','designer','f',29,'010-1233-5423','2020-08-14');
insert into personinfo values(seq_start.nextval,'이성신','programmer','m',26,'010-5434-1254','2013-12-11');
insert into personinfo values(seq_start.nextval,'최성현','programmer','m',27,'010-1230-9323','2021-04-23');
insert into personinfo values(seq_start.nextval,'홍성경','jobless','f',13,'010-7656-9344','2001-02-01');
insert into personinfo values(seq_start.nextval,'임형준','programmer','m',29,'010-8460-6745','2023-06-30');
insert into personinfo values(seq_start.nextval,'배유나','student','f',29,'010-8324-9254','2019-05-15');
insert into personinfo values(seq_start.nextval,'유재석','designer','m',40,'010-3240-9954','2014-12-12');
insert into personinfo values(seq_start.nextval,'강호동','jobless','m',29,'010-1250-9314','2023-01-15');
insert into personinfo values(seq_start.nextval,'강재석','student','f',21,'010-1344-9314','2023-01-15');
commit;

--최종인원확인
select count(*) from personinfo;
--조회연습
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5; --컬럼번호도 가능

select * from personinfo order by gender,age desc;
select * from personinfo order by gender,name;

select job from personinfo;
select distinct job from personinfo;

--성이 강씨만
select * from personinfo where name like '강%';
--이름이 두번째글자가 재 인사람
select * from personinfo where name like '_재%';

--핸드폰 마지막 자리가 33인 사람
select * from personinfo where hp like '%54';

--입사일자가 3원인사람
select * from personinfo where to_char(ipsaday,'mm')='05';

--입사일자가 2023년 인사람
select * from personinfo where to_char(ipsaday,'yyyy')='2023';

--나이가 20~30사이
select * from personinfo where age between 20 and 30;
--직업이 무직이거나 프로그래머인사람
select * from personinfo where job in('programmer','jobless');
--직업이 무직이거나 프로그래머가 아닌 사람
select * from personinfo where job not in('programmer','jobless');

--평균나이, 소수점 한자리로 구하기
select round(avg(age),1) from personinfo;

--내용수정(update)
--UPDATE 테이블명 SET 컬럼1='변경할데이터' WHERE 컬럼2='데이터값';
--2번 직업 나이 수정하기,조건이없으면 모든 데이터가 수정된다 조건필수
update personinfo set job='teacher',age=12;
--잘못수정한데이터 원래대로 돌리기
rollback;

update personinfo set job='teacher',age=12 where num=2;

--임씨이면서 프로그래머인사람의 젠더를 여자로 수정하기
update personinfo set gender='f' where name like '임%' and job='programmer';

--num이 5번인 사람의 직업을 교사로 입사일을 2000/12/25 로 수정
update personinfo set job='teacher',ipsaday='2000/12/25' where num=5;

commit;

--삭제
--DELETE FROM 테이블명;
--5번만 삭제
delete from personinfo where num=5;

--여자중에서 나이가 25세이상만 모두 삭제
delete from personinfo where gender='f' and age>=25;

--핸드폰은 ***-****-****수정
update personinfo set hp='***-****-****';

rollback;

desc personinfo;
select * from personinfo;

--테이블삭제
--시퀀스 삭제
drop table personinfo;
drop sequence seq_start;

--dept에서 30번 부서를 시애틀로 변경
update dept set dname='SEATTLE' where deptno=30;
--emp테이블 TotalSal열을 하나 더 추가(number(20)으로 줄것)
alter table emp add TotalSal number(20);
--emp테이블 TotSal에 sal과 comm을 더한가격을 출력
update emp set TotalSal=sal+nvl(comm,0);
--emp에서 WARD삭제
delete from emp where ename='WARD';
--product테이블에서 100번을 초코파이로 수정
update product set p_name='초코파이' where p_code=100;

--Group by
--professor에서 학과별로 교수들의 평균급여를 출력
select deptno 학과,avg(pay) "평균 급여"
from professor
group by deptno;

--select절에 사용된 그룹함수 이외의 컬럼이나 표현식은 반드시 group by에 사용되어야함
--professor에서 직급별 평균보너스 출력
select position 직급,avg(nvl(bonus,0)) 평균보너스 from professor group by position;

--학과별 직급별로 교수들의 평균급여
select deptno,position,avg(pay) 평균급여
from professor
group by deptno,position;

--student에서 학년별 최고키와 최고몸무게 출력
select grade 학년,max(height) 최고키,max(weight) 최고몸무게 from student group by grade;

--교수의 직급별 총급여와 최고보너스
select position 직급,sum(pay) 총급여,max(bonus) 최고보너스 from professor group by position;

--emp에서 동일한 직업끼리의 사원수
select job 직업,count(ename) 사원수 from emp group by job;

--Having절_조건주고 검색하기_반드시 group by뒤에...
--평균급여가 2000이상인 부서의 부서번호와 평균급여
--where절은 그룹함수의 비교조건으로 쓸수없다
select deptno,avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

--professor에서 평균급여가 300이상인 학과의 학과번호와 평균급여
select deptno 학과번호,avg(pay) 평균급여
from professor
where deptno not in(101)
group by deptno
having avg(pay)>=300
order by deptno desc;

--emp에서 job별로 sal의 평균급여를 구하시오
select job,round(avg(sal),2) from emp group by job;
--professor에서 직급별 총급여를 구하시오
select position,sum(pay) from professor group by position;

--emp에서 직업별 인원수 최대급여,최소급여 출력(job의 오름차순)
select job 직업,count(ename) 인원수,max(sal) 최대급여,min(sal) 최소급여
from emp
group by job
order by job;
--입사년도 그룹별로 출력(입사년도,인원수,급여평균(소수점없이) _입사년도의 오름차순)
select to_char(hiredate,'yyyy') 입사년도,count(ename) 인원수,round(avg(sal),0) 급여평균
from emp
group by to_char(hiredate,'yyyy')
order by to_char(hiredate,'yyyy');

--Rollup함수
--자동으로 소계/합계 구해주는 함수
--group by절에 주어진 조건으로 소계값을 구해준다
select deptno 학과번호,position 직위,sum(pay) 총급여
from professor
group by position,rollup(deptno);

select deptno 학과번호,position 직위,sum(pay) 총급여
from professor
group by deptno,rollup(position);

--count
select position,count(*),sum(pay)
from professor
group by rollup(position);

select deptno,count(*),sum(pay)
from professor
group by rollup(deptno);

--cube합수
--rollup처럼 각소계에 전체총계까지 구해준다
select deptno,position,count(*),sum(pay)
from professor
group by cube(deptno,position);

--오늘의 총복습
--Q1.emp에서 평균연봉이 2000이상인 부서의 부서번호와 평균급여를 구하시오
select avg(sal*12) 평균연봉,deptno 부서번호,avg(sal) 평균급여
from emp
group by deptno
having avg(sal*12)>=2000;
--Q2.emp에서 deptno별 인원수는?
select deptno,count(ename) 인원수
from emp
group by deptno;
--Q3.emp에서 job별 인원수를 구하시오(단 인원이 2명보다 많은곳만 구할것)
select job,count(ename)
from emp
group by job
having count(ename)>2;
--Q4.emp에서 job별 급여합계를 구하는데(president는 제외할것) 급여합계가 5000이상만 구하시고 급여합계가 높은것부터 출력
select job,sum(sal) 급여합계
from emp
where job not in('PRESIDENT')--PRESIDENT제외
group by job -- job 그룹별로
having sum(sal)>=5000 --급여합계가 5000이상
order by sum(sal) desc;--급여합계 내림차순


--제약조건
--테이블생성
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar2(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('홍보부','인사부','교육부')),
pay number(10) default 2000000);

--시퀀스생성
create sequence seq_sawon nocache;

--데이터 insert
--체크 제약조건(RHEEMINGYU.SAWON_CK_BUSEO)이 위배
--insert into sawon values(seq_sawon.nextval,'이영미','f','게임개발부',3500000);
insert into sawon values(seq_sawon.nextval,'이민규','m','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'이영미','f','인사부',3000000);
insert into sawon values(seq_sawon.nextval,'최성현','m','홍보부',2500000);
insert into sawon values(seq_sawon.nextval,'홍성경','f','인사부',2300000);
insert into sawon values(seq_sawon.nextval,'임형준','m','교육부',3500000);
insert into sawon values(seq_sawon.nextval,'이성신','m','교육부',3000000);
insert into sawon values(seq_sawon.nextval,'전소미','f','홍보부',4000000);
commit;

--부서별 인원수와 최고급여,최저급여 조회
select buseo 부서,count(*) 인원수,max(pay) 최고급여,min(pay) 최소급여 from sawon group by buseo;
--위의 쿼리문에서 최고급여,최저급여에 화폐단위 붙이고 3자리 컴마도 나오게
select buseo 부서,count(*) 인원수,to_char(max(pay),'L9,999,999') 최고급여,to_char(min(pay),'L9,999,999') 최소급여 from sawon group by buseo;
--성별 인원수와 평균급여를 출력(인원수 뒤에 명 이라고 나오도록)
select gender 성별,count(*)||'명' 인원수,avg(pay) 평균급여 from sawon group by gender;
--부서별 인원수와 평균급여를 구하되 인원이 3명 이상인 경우에만 출력
select buseo 부서,count(*) 인원수, avg(pay) 평균급여 from sawon group by buseo having count(*)>=3;
