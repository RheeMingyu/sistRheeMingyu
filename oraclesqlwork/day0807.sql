create table memo(num number(5) primary key,
writer varchar2(20),
story varchar2(200),
avatar varchar2(50),
writeday date);

insert into memo values(seq_1.nextval,'���ô�','������ �ϰ�ʹ�','../image/logoImg/icon01.png',sysdate);
commit;

select * from ajaxboard;

delete from memo;

create table ajaxboard(num number(3) primary key,
writer varchar2(20),subject varchar2(20),story varchar2(1000),
avatar varchar2(50),writeday date);

insert into ajaxboard values(seq_1.nextval,'������','��Ÿ����','��Ÿ �� �׸� ��','../image/logoImg/images01.jpg',sysdate);