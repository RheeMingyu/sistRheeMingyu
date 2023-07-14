--7/10 ����
--Q1.emp���� ename�� empname���� �ٲټ���
alter table emp rename column ename to empname;
--Q2.gift���� 7�� ��Ʈ���� �����е�� �ٲټ���
update gift set gname='�����е�' where gno=7;
--Q3.gift���� 10�� ������ 500001~1000001 ������ �߰�
insert into gift values(10,'������',500001,1000001);
--Q4.member���� 1003 ������ ����� ����
delete from member where no=1003 and name='������';
--Q5.emp���� �Ի����� 82/01/23 �� ����� �̸�,�μ���ȣ,�޿��� ���
select empname �̸�,deptno �μ���ȣ,sal �޿� from emp where hiredate='82/01/23';
--Q6.emp���� �������� �ִ�޿�,�ּұ޿�,�ѱ޿�,��ձ޿��� ���
select job ����,max(sal) �ִ�޿�,min(sal) �ּұ޿�,sum(sal) �ѱ޿�,avg(sal) ��ձ޿� from emp group by job;

--Join
--1.emp�� dept�� �����ؼ� emp������� �μ����� ���غ���
--�����   �μ���
--1.
select e.empname,d.dname --��� �ƴ� �����̸����ε� ����
from emp e,dept d
where e.deptno=d.deptno;
--2.
select empname,dname --���̺��� �������ϰ�� e. d.��������
from emp e,dept d
where e.deptno=d.deptno;

--student�� professor�� �����Ͽ� ������ ���� ����Ͻÿ�
--�й�  �л���  ����������
select studno �й�,s.name �л���,p.name ����������
from student s,professor p
where s.profno=p.profno;
--�й�  �л���  ��1������
select studno �й�,name �л���,dname ��1������
from student s,department d
where s.deptno1=d.deptno;
--������  ����  �а���
select name ������,position ����,dname �а���
from professor p,department d
where p.deptno=d.deptno;
--�����ȣ  �����  �ٹ�����
select empno �����ȣ,empname �����,loc �ٹ�����
from emp e,dept d
where e.deptno=d.deptno;
--�Ǹ����̺� product join
--�Ǹ�����  ���ڸ�  ��ü �Ǹž�
select p_date �Ǹ�����,p_name ���ڸ�,p_total "��ü �Ǹž�"
from panmae,product
where panmae.p_code=product.p_code;

--primary Ű�� foreignŰ�� ������ �������̺�(�θ�,�ڽ�) ������
--������
create sequence seq_shop;

--shop���̺�(�θ�)
create table shop(shop_num number(5) primary key,
sangname varchar2(30),color varchar2(20));

--5�� ��ǰ�߰�
insert into shop values(seq_shop.nextval,'apple','red');
insert into shop values(seq_shop.nextval,'orange','orange');
insert into shop values(seq_shop.nextval,'peach','peach');
insert into shop values(seq_shop.nextval,'melon','yellowgreen');
insert into shop values(seq_shop.nextval,'pear','yellow');
commit;

--cart1..��ǰ������ shop���̺��� shop_num���� �ܺ�Ű�� ����
create table cart1(idx number(5) primary key,
shop_num number(5) CONSTRAINT cart1_fk_shopnum REFERENCES shop(shop_num),
cnt number(5),duipday date);

--cart2..��ǰ������ shop���̺��� shop_num���� �ܺ�Ű�� ����
--�θ����̺��� ��ǰ�� ����� �׻�ǰ�� ����� īƮ�� �ڵ����� �����ش�
create table cart2(idx number(5) primary key,
shop_num number(5) REFERENCES shop(shop_num) ON DELETE CASCADE,
cnt number(5),guipday date);

--cart1�� ��ǰ�߰�_1��
insert into cart1 values(seq_shop.nextval,1,2,sysdate);
insert into cart1 values(seq_shop.nextval,2,5,sysdate);
insert into cart1 values(seq_shop.nextval,3,1,sysdate);
insert into cart1 values(seq_shop.nextval,4,4,sysdate);
insert into cart1 values(seq_shop.nextval,6,7,sysdate);

delete from cart1 where shop_num=3;

--cart2�� ��ǰ�߰�
insert into cart2 values(seq_shop.nextval,2,2,sysdate);
insert into cart2 values(seq_shop.nextval,4,5,sysdate);
insert into cart2 values(seq_shop.nextval,3,1,sysdate);
insert into cart2 values(seq_shop.nextval,1,4,sysdate);
insert into cart2 values(seq_shop.nextval,6,7,sysdate);
commit;

--cart1: �θ� 1,2,6   cart2: �θ� 1,2,3,6

--shop�� 1�� ��ǰ ����?
--���Ἲ ��������(RHEEMINGYU.CART1_FK_SHOPNUM)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
delete from shop where shop_num=1;

--cart2���� 3�������� ��������
--ON DELETE CASCADE ������ ������� ������ �ȴ�
delete from shop where shop_num=3;

--cart1�� ����ǰ�� shop���̺�� join�ؼ� �ڼ��� ���
--���1
select c1.idx,s.shop_num,s.sangname,s.color,cnt,c1.duipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;

--���2
select idx,s.shop_num,sangname,color,cnt,duipday
from shop s,cart1 c1
where s.shop_num=c1.shop_num;


--�θ����̺�
create table menu(m_num number(5) primary key,
m_name varchar2(20),price number(10));

create sequence seq_menu;
insert into menu values(seq_menu.nextval,'steak',30000);
insert into menu values(seq_menu.nextval,'spagetti',10000);
insert into menu values(seq_menu.nextval,'chicken',25000);
insert into menu values(seq_menu.nextval,'frenchfry',20000);
insert into menu values(seq_menu.nextval,'pickle',1000);

--�ڽ����̺�(�ڽ����̺� ����� �θ� �־ �θ� �����Ҽ������� �θ����̺������ �ڵ����� �ڽĻ���)
create table myorder(o_num number(5) primary key,
m_num number(5) CONSTRAINT order_fk_mnum REFERENCES menu(m_num) ON DELETE CASCADE,
cnt number(5),o_date date);

insert into myorder values(seq_menu.nextval,1,2,sysdate);
insert into myorder values(seq_menu.nextval,2,3,sysdate);
insert into myorder values(seq_menu.nextval,3,1,sysdate);
insert into myorder values(seq_menu.nextval,4,6,sysdate);
insert into myorder values(seq_menu.nextval,5,10,sysdate);

--�������
--�ֹ���ȣ  ���ĸ�   ����  ����  �ֹ�����
select o_num �ֹ���ȣ,m_name ���ĸ�,to_char(price,'L999,999') ����,cnt ����,o_date �ֹ�����
from menu,myorder
where menu.m_num=myorder.m_num;

-----------------
create table board (bno number(3) CONSTRAINT board_pk_bno primary key,
writer varchar2(20),
subject varchar2(100),
writeday date);

--board�� 5�� insert
insert into board values(seq_menu.nextval,'�̹α�','hi everybody',sysdate);
insert into board values(seq_menu.nextval,'karen','hello',sysdate);
insert into board values(seq_menu.nextval,'�ּ���','i am hungry',sysdate);
insert into board values(seq_menu.nextval,'ȫ����','happy birthday',sysdate);
insert into board values(seq_menu.nextval,'������','good bye',sysdate);
commit;

--answer��� ���(�ڽ�)
--�θ������� �ڽı� �ڵ������ǰ�
create table answer (num number(5)CONSTRAINT answer_pk_num primary key,
bno number(3) CONSTRAINT answer_fk_bno REFERENCES board(bno) ON DELETE CASCADE,
nickname varchar2(20),content varchar2(30),writeday date);

--���ϴ� �ۿ� ����߰��ϱ�
insert into answer values(seq_menu.nextval,20,'������','i am full haha',sysdate);
insert into answer values(seq_menu.nextval,18,'ȿ����','Nice to meet you',sysdate);
insert into answer values(seq_menu.nextval,19,'haha','hello too',sysdate);
insert into answer values(seq_menu.nextval,21,'�޺���','not birthday today',sysdate);
insert into answer values(seq_menu.nextval,22,'����ģ��','bye bye',sysdate);

--join���� ���
--���۹�ȣ  �ۼ���  �ۼ��ڱ�  ��۴ܻ��  ��۳���  ���۳�¥  ��۳�¥
select b.bno ���۹�ȣ,writer �ۼ���,subject �ۼ��ڱ�,nickname ��۴ܻ��,content ��۳���,b.writeday ���۳�¥,a.writeday ��۳�¥
from board b,answer a
where b.bno=a.bno;

--21�� ����
delete from board where bno=21;

--board�� ���� ����
drop table board; --�ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�

--�ڽ�
drop table answer; --�ڽ� ���� �����ؾ� �θ� ��������
--�ܺ�Ű�� ����� ��� �ڽ����̺� ���� ������ �θ����̺� ��������
drop table shop;
drop table cart1;
drop table cart2;
drop sequence seq_shop;

create sequence seq_food;

create table food(fno number(3) CONSTRAINT food_pk_fno primary key,
foodname varchar2(20),price number(6),shopname varchar2(10),loc varchar2(10));

insert into food values(seq_food.nextval,'���뱹��',8500,'�Ҹ�','������');
insert into food values(seq_food.nextval,'����',8500,'���̳�','���ϱ�');
insert into food values(seq_food.nextval,'������',9000,'����','������');
insert into food values(seq_food.nextval,'ġ�����',6500,'�Ƴ�','������');
insert into food values(seq_food.nextval,'�δ��',9900,'ŷ��','�߶���');
commit;

create table jumun(num number(3) primary key,name varchar2(10),
fno number(3) CONSTRAINT jumun_fk_fno REFERENCES food(fno) ON DELETE CASCADE,
addr varchar2(20));

insert into jumun values(seq_food.nextval,'�̼���',2,'�Ȼ�� ���յ�');
insert into jumun values(seq_food.nextval,'�ּ���',3,'������');
insert into jumun values(seq_food.nextval,'�����',4,'��򰡿�');
insert into jumun values(seq_food.nextval,'������',5,'��õ��');
insert into jumun values(seq_food.nextval,'�̹α�',6,'�߶���');
commit;

select f.fno �ֹ���ȣ,name �ֹ���,foodname ���ĸ�,to_char(price,'L9,999') ����,shopname ��ȣ��,loc ������ġ,addr �ֹ�����ġ
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