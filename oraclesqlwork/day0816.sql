create table myschool(num number(5) primary key,
myid varchar2(20), mypass varchar2(20),
myname varchar2(20),
myimg varchar2(50),
myadmin varchar2(10),myhp varchar2(20),
myaddr varchar2(50),mybirthday date,
mygrade number(2),myclass number(2),
writeday date);

create sequence myseq;
drop sequence myseq;
drop table myschool;
drop table mysubject;
create table mysubject(num number(5) references myschool(num) on delete cascade,
korean number(3),english number(3),math number(3),society number(3),
science number(3),music number(3), art number(3), pe number(3));

commit;

select * from myschool;
select * from mysubject;

delete from myschool where num=3;

insert into myschool values(myseq.nextval,'admin','1234','나교장','../cartoon/14.png','on',
'010-1234-5678','서울시 강남구','1965-07-11',null,null,sysdate);

insert into myschool values(myseq.nextval,'yeon1','1234','강연주','../cartoon/02.png',null,
'010-1234-5678','경기도 성남시','1997-12-03',1,1,sysdate);
insert into mysubject values(2,90,80,70,80,75,90,50,85);
insert into myschool values(myseq.nextval,'soon1','1234','장순영','../cartoon/02.png',null,
'010-1523-2324','경기도 수원시','1996-07-19',1,1,sysdate);
insert into mysubject values(3,80,85,75,90,85,80,60,75);
insert into myschool values(myseq.nextval,'jinp1','1234','최진평','../cartoon/03.png',null,
'010-1523-2324','경기도 부천시','1997-09-11',1,1,sysdate);
insert into mysubject values(4,70,90,65,80,80,75,90,90);

insert into myschool values(myseq.nextval,'jinh1','1234','진현규','../cartoon/04.png',null,
'010-5563-4215','경기도 오산시','1999-10-21',1,1,sysdate);
insert into mysubject values(5,80,60,75,70,85,65,70,95);
insert into myschool values(myseq.nextval,'kims1','1234','김석진','../cartoon/05.png',null,
'010-5163-2115','경기도 기흥시','1998-05-27',1,1,sysdate);
insert into mysubject values(6,70,70,95,70,80,70,75,85);
insert into myschool values(myseq.nextval,'hongs1','1234','홍성경','../cartoon/06.png',null,
'010-2163-5674','서울시 관악구','1997-08-09',1,1,sysdate);
insert into mysubject values(7,72,75,78,81,85,82,85,75);

insert into myschool values(myseq.nextval,'yoonh1','1234','윤호석','../cartoon/07.png',null,
'010-2231-9682','경기도 부천시','1997-04-29',1,1,sysdate);
insert into mysubject values(8,76,81,82,75,83,60,71,82);
insert into myschool values(myseq.nextval,'leem1','1234','이민규','../cartoon/08.png',null,
'010-1125-2152','경기도 부천시','1993-12-03',1,1,sysdate);
insert into mysubject values(9,90,87,95,87,85,55,60,75);
insert into myschool values(myseq.nextval,'chois1','1234','최성현','../cartoon/09.png',null,
'010-3623-4151','경기도 부천시','1995-06-27',1,1,sysdate);
insert into mysubject values(10,78,82,85,81,72,81,75,82);