--7/10 문제
--Q1.emp에서 ename을 empname으로 바꾸세요
alter table emp rename column ename to empname;
--Q2.gift에서 7번 노트북을 아이패드로 바꾸세요
update gift set gname='아이패드' where gno=7;
--Q3.gift에서 10번 아이폰 500001~1000001 한행을 추가
insert into gift values(10,'아이폰',500001,1000001);
--Q4.member에서 1003 서새알 멤버를 삭제
delete from member where no=1003 and name='서새알';
--Q5.emp에서 입사일이 82/01/23 인 사람의 이름,부서번호,급여를 출력
select empname 이름,deptno 부서번호,sal 급여 from emp where hiredate='82/01/23';
--Q6.emp에서 직무별로 최대급여,최소급여,총급여,평균급여를 출력
select job 직무,max(sal) 최대급여,min(sal) 최소급여,sum(sal) 총급여,avg(sal) 평균급여 from emp group by job;

--Join
--1.emp와 dept를 조인해서 emp사람들의 부서명을 구해보자
--사원명   부서명
--1.
select e.empname,d.dname --약어 아닌 원래이름으로도 가능
from emp e,dept d
where e.deptno=d.deptno;
--2.
select empname,dname --테이블의 고유명일경우 e. d.생략가능
from emp e,dept d
where e.deptno=d.deptno;

--student와 professor를 조인하여 다음과 같이 출력하시오
--학번  학생명  지도교수명
select studno 학번,s.name 학생명,p.name 지도교수명
from student s,professor p
where s.profno=p.profno;
--학번  학생명  제1전공명
select studno 학번,name 학생명,dname 제1전공명
from student s,department d
where s.deptno1=d.deptno;
--교수명  직급  학과명
select name 교수명,position 직급,dname 학과명
from professor p,department d
where p.deptno=d.deptno;
--사원번호  사원명  근무도시
select empno 사원번호,empname 사원명,loc 근무도시
from emp e,dept d
where e.deptno=d.deptno;
--판매테이블 product join
--판매일자  과자명  전체 판매액
select p_date 판매일자,p_name 과자명,p_total "전체 판매액"
from panmae,product
where panmae.p_code=product.p_code;

--primary 키와 foreign키를 생성한 조인테이블(부모,자식) 만들어보기
--시퀀스
create sequence seq_shop;

--shop테이블(부모)
create table shop(shop_num number(5) primary key,
sangname varchar2(30),color varchar2(20));

--5개 상품추가
insert into shop values(seq_shop.nextval,'apple','red');
insert into shop values(seq_shop.nextval,'orange','orange');
insert into shop values(seq_shop.nextval,'peach','peach');
insert into shop values(seq_shop.nextval,'melon','yellowgreen');
insert into shop values(seq_shop.nextval,'pear','yellow');
commit;

--cart1..상품정보는 shop테이블의 shop_num값을 외부키로 지정
create table cart1(idx number(5) primary key,
shop_num number(5) CONSTRAINT cart1_fk_shopnum REFERENCES shop(shop_num),
cnt number(5),duipday date);

--cart2..상품정보는 shop테이블의 shop_num값을 외부키로 지정
--부모테이블의 상품을 지우면 그상품과 연결된 카트를 자동으로 지워준다
create table cart2(idx number(5) primary key,
shop_num number(5) REFERENCES shop(shop_num) ON DELETE CASCADE,
cnt number(5),guipday date);

--cart1에 상품추가_1번
insert into cart1 values(seq_shop.nextval,1,2,sysdate);
insert into cart1 values(seq_shop.nextval,2,5,sysdate);
insert into cart1 values(seq_shop.nextval,3,1,sysdate);
insert into cart1 values(seq_shop.nextval,4,4,sysdate);
insert into cart1 values(seq_shop.nextval,6,7,sysdate);

delete from cart1 where shop_num=3;

--cart2에 상품추가
insert into cart2 values(seq_shop.nextval,2,2,sysdate);
insert into cart2 values(seq_shop.nextval,4,5,sysdate);
insert into cart2 values(seq_shop.nextval,3,1,sysdate);
insert into cart2 values(seq_shop.nextval,1,4,sysdate);
insert into cart2 values(seq_shop.nextval,6,7,sysdate);
commit;

--cart1: 부모 1,2,6   cart2: 부모 1,2,3,6

--shop의 1번 상품 삭제?
--무결성 제약조건(RHEEMINGYU.CART1_FK_SHOPNUM)이 위배되었습니다- 자식 레코드가 발견되었습니다
delete from shop where shop_num=1;

--cart2에서 3번데이터 지워보자
--ON DELETE CASCADE 때문에 제약없이 삭제가 된다
delete from shop where shop_num=3;

--cart1에 답긴상품을 shop테이블과 join해서 자세히 출력
--방법1
select c1.idx,s.shop_num,s.sangname,s.color,cnt,c1.duipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;

--방법2
select idx,s.shop_num,sangname,color,cnt,duipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;


--부모테이블
create table menu(m_num number(5) primary key,
m_name varchar2(20),price number(10));

create sequence seq_menu;
insert into menu values(seq_menu.nextval,'steak',30000);
insert into menu values(seq_menu.nextval,'spagetti',10000);
insert into menu values(seq_menu.nextval,'chicken',25000);
insert into menu values(seq_menu.nextval,'frenchfry',20000);
insert into menu values(seq_menu.nextval,'pickle',1000);

--자식테이블(자식테이블에 연결된 부모가 있어도 부모를 삭제할수있으며 부모테이블삭제시 자동으로 자식삭제)
create table myorder(o_num number(5) primary key,
m_num number(5) CONSTRAINT order_fk_mnum REFERENCES menu(m_num) ON DELETE CASCADE,
cnt number(5),o_date date);

insert into myorder values(seq_menu.nextval,1,2,sysdate);
insert into myorder values(seq_menu.nextval,2,3,sysdate);
insert into myorder values(seq_menu.nextval,3,1,sysdate);
insert into myorder values(seq_menu.nextval,4,6,sysdate);
insert into myorder values(seq_menu.nextval,5,10,sysdate);

--최종출력
--주문번호  음식명   가격  개수  주문일자
select o_num 주문번호,m_name 음식명,to_char(price,'L999,999') 가격,cnt 개수,o_date 주문일자
from menu,myorder
where menu.m_num=myorder.m_num;

-----------------
create table board (bno number(3) CONSTRAINT board_pk_bno primary key,
writer varchar2(20),
subject varchar2(100),
writeday date);

--board에 5개 insert
insert into board values(seq_menu.nextval,'이민규','hi everybody',sysdate);
insert into board values(seq_menu.nextval,'karen','hello',sysdate);
insert into board values(seq_menu.nextval,'최성현','i am hungry',sysdate);
insert into board values(seq_menu.nextval,'홍성경','happy birthday',sysdate);
insert into board values(seq_menu.nextval,'진현규','good bye',sysdate);
commit;

--answer라는 댓글(자식)
--부모글지우면 자식글 자동삭제되게
create table answer (num number(5)CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answer_fk_bno REFERENCES board(bno) ON DELETE CASCADE,
nickname varchar2(20),content varchar2(30),writeday date);

--원하는 글에 댓글추가하기
insert into answer values(seq_menu.nextval,20,'영지니','i am full haha',sysdate);
insert into answer values(seq_menu.nextval,18,'효지니','Nice to meet you',sysdate);
insert into answer values(seq_menu.nextval,19,'haha','hello too',sysdate);
insert into answer values(seq_menu.nextval,21,'메붕이','not birthday today',sysdate);
insert into answer values(seq_menu.nextval,22,'현규친구','bye bye',sysdate);

--join으로 출력
--원글번호  작성자  작성자글  댓글단사람  댓글내용  원글날짜  댓글날짜
select b.bno 원글번호,writer 작성자,subject 작성자글,nickname 댓글단사람,content 댓글내용,b.writeday 원글날짜,a.writeday 댓글날짜
from board b,answer a
where b.bno=a.bno;

--21번 원글
delete from board where bno=21;

--board를 먼저 삭제
drop table board; --외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다

--자식
drop table answer; --자식 먼저 삭제해야 부모 삭제가능
--외부키로 연결된 경우 자식테이블 먼저 삭제후 부모테이블 삭제가능
drop table shop;
drop table cart1;
drop table cart2;
drop sequence seq_shop;

create sequence seq_food;

create table food(fno number(3) CONSTRAINT food_pk_fno primary key,
foodname varchar2(20),price number(6),shopname varchar2(10),loc varchar2(10));

insert into food values(seq_food.nextval,'순대국밥',8500,'할매','강동구');
insert into food values(seq_food.nextval,'피자',8500,'도미노','성북구');
insert into food values(seq_food.nextval,'연유라떼',9000,'스벅','강동구');
insert into food values(seq_food.nextval,'치즈버거',6500,'맥날','강동구');
insert into food values(seq_food.nextval,'부대찌개',9900,'킹콩','중랑구');
commit;

create table jumun(num number(3) primary key,name varchar2(10),
fno number(3) CONSTRAINT jumun_fk_fno REFERENCES food(fno) ON DELETE CASCADE,
addr varchar2(20));

insert into jumun values(seq_food.nextval,'이성신',2,'안산시 정왕동');
insert into jumun values(seq_food.nextval,'최성현',3,'수원시');
insert into jumun values(seq_food.nextval,'정상수',4,'어딘가에');
insert into jumun values(seq_food.nextval,'임형준',5,'봉천동');
insert into jumun values(seq_food.nextval,'이민규',6,'중랑구');
commit;

select f.fno 주문번호,name 주문자,foodname 음식명,to_char(price,'L9,999') 가격,shopname 상호명,loc 가게위치,addr 주문자위치
from food f,jumun j
where f.fno=j.fno
order by name;

create table snsboard(b_num number(3) CONSTRAINT snsboard_pk_b_num primary key,
nick varchar2(10),subject varchar2(10),content varchar2(30),wday date);

insert into snsboard values(seq_food.nextval,'meboong','maplestory','like a homework',sysdate);
insert into snsboard values(seq_food.nextval,'java','swing','it is so hard for me',sysdate);
insert into snsboard values(seq_food.nextval,'oracle','still','not that bothering me',sysdate);
insert into snsboard values(seq_food.nextval,'haha','funny','like a comedy',sysdate);
insert into snsboard values(seq_food.nextval,'seongsin','seongs','master master',sysdate);
insert into snsboard values(seq_food.nextval,'sh','leader','seonghyun is a leader',sysdate);
insert into snsboard values(seq_food.nextval,'jss','jeong','tager gun shot',sysdate);
insert into snsboard values(seq_food.nextval,'karen','cute','she is so cute',sysdate);
insert into snsboard values(seq_food.nextval,'homework','hw','i got homework today',sysdate);
insert into snsboard values(seq_food.nextval,'jbsr','test','i got passed',sysdate);
commit;