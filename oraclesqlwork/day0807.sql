create table memo(num number(5) primary key,
writer varchar2(20),
story varchar2(200),
avatar varchar2(50),
writeday date);

insert into memo values(seq_1.nextval,'성시니','메이플 하고싶다','../image/logoImg/icon01.png',sysdate);
commit;

select * from ajaxboard;

delete from memo;

create table ajaxboard(num number(3) primary key,
writer varchar2(20),subject varchar2(20),story varchar2(1000),
avatar varchar2(50),writeday date);

insert into ajaxboard values(seq_1.nextval,'성깽깨','오타요정','오타 좀 그만 내','../image/logoImg/images01.jpg',sysdate);