create sequence seq_1;
--info
create table info(num number(5) primary key,
name varchar2(20),hp varchar2(20),
age number(3),photo varchar2(100));
insert into info values(seq_1.nextval,'옥동자','010-1111-2222',23,'../image/logoImg/icon01.png');
insert into info values(seq_1.nextval,'이성신','010-1411-5552',27,'../image/logoImg/icon02.png');
insert into info values(seq_1.nextval,'최성현','010-1192-8824',28,'../image/logoImg/icon03.png');
insert into info values(seq_1.nextval,'홍성경','010-0171-2861',23,'../image/logoImg/icon04.png');
insert into info values(seq_1.nextval,'박희찬','010-9999-2888',23,'../image/logoImg/icon05.png');
commit;

--team
create table team(num number(5) primary key,
name varchar2(20),addr varchar2(50),writeday date);
insert into team values(seq_1.nextval,'퉁퉁이','경기도 수원시',sysdate);

