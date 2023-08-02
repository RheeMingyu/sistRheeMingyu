create sequence seq_1;
--info
create table info(num number(5) primary key,
name varchar2(20),hp varchar2(20),
age number(3),photo varchar2(100));
insert into info values(seq_1.nextval,'������','010-1111-2222',23,'../image/logoImg/icon01.png');
insert into info values(seq_1.nextval,'�̼���','010-1411-5552',27,'../image/logoImg/icon02.png');
insert into info values(seq_1.nextval,'�ּ���','010-1192-8824',28,'../image/logoImg/icon03.png');
insert into info values(seq_1.nextval,'ȫ����','010-0171-2861',23,'../image/logoImg/icon04.png');
insert into info values(seq_1.nextval,'������','010-9999-2888',23,'../image/logoImg/icon05.png');
commit;

--team
create table team(num number(5) primary key,
name varchar2(20),addr varchar2(50),writeday date);
insert into team values(seq_1.nextval,'������','��⵵ ������',sysdate);

create table myfood(num number(3) primary key,
foodname varchar2(20),foodphoto varchar2(50),
price number(5),cnt number(5));
insert into myfood values(seq_food.nextval,'�������ƴ�','../image/logoImg/icon05.png',85000,13);
commit;
select * from myfood;

create table shop(num number(3) primary key,
sangpum varchar2(30),
color varchar2(20),
price number(5),imgname varchar2(50));
insert into shop values(seq_1.nextval,'��������','red',78000,'../image/logoImg/bag04.png');

create table myfriend(num number(5) primary key,
fname varchar2(20),fhp varchar2(15),faddr varchar2(50),
gaipday date);

insert into myfriend values(seq_1.nextval,'���ÿ�','010-9613-0912','��⵵ �����ֽ�',sysdate);
select * from myfriend;

create table sinsang(num number(5) primary key,
name varchar2(20),
addr varchar2(30),
sdate date);