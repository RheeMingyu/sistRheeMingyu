--��������
--Q1. emp���� job�������� �������� �ѹ����� ���
select DISTINCT job ������ from emp;
--Q2.emp���̺��� ������� A�� S�� �����ϴ� ����� ���(�����ȣ, �����)
select empno �����ȣ,ename ����� from emp where ename like 'A%' or ename like 'S%';
--Q3.emp���� deptno�� 10�κμ��� ���(����� �μ���ȣ)
select ename �����, deptno �μ���ȣ from emp where deptno=10;
--Q4.emp���� �޿�(pay)�� ��պ��� �� ��������� ����� �޿��� ���
select ename �����,sal �޿� from emp where sal>(select avg(sal) from emp);
--Q5.SCOTT�� �޿��� �����ϰų� ������ �޴� ����� ������ �޿��� ���
select ename �����,sal �޿� from emp where sal>=(select sal from emp where ename='SCOTT');
--Q6.emp���� hiredate���� ���� 5���� ����� ����� �Ի����� ���(to_char���)
select ename �����,hiredate �Ի����� from emp where to_char(hiredate,'mm')='05';

--7��1��
--1.���̺� ����
--primary key�� �⺻Ű�� �ǹ� not null+unique�� �ǹ��Ѵ�

--test���̺�
create table test(num number(5) primary key,
name varchar2(20),score number(6,2),birth date);

desc test;--���� ����
select * from test;

--test�� ��ü������ insert
insert into test values(1,'�ռ���',67.2,'1993-12-03');
--test�� �Ϻε����� insert
insert into test (num,name) values (2,'��ȣ��');

--insert ����
--���Ἲ ���� ����(RHEEMINGYU.SYS_C008353)�� ����
insert into test values(4,'�̿���',68.72,'1998-12-12');

--sysdate���糯¥ �ǹ�
insert into test values(5,'��ȿ��',72.32,sysdate);

--alter
--���̸� ������ �÷� �߰�,������ null�� �߰�
--ALTER TABLE ���̺�� ADD �߰����÷��� ������Ÿ��;

alter table test add age number(5);

--�ּҸ� ������ �÷��� �߰��ϴµ� �ʱⰪ�� ������ ��� ����
alter table test add addr varchar2(30) default '������';

--insert into test values(4,'�̿���',68.72,'1998-12-12',22,'republic of korea seoul city 123450998661234689');
--�ּ� �����÷� 30=>50
--ALTER TABLE ���̺�� MODIFY �÷��� ������Ÿ��;
alter table test modify addr varchar2(50);

--age Ÿ���� ���ڿ�(10)���� �����ϰ� �ʱⰪ�� 20���� ����
--���� null�� �״�� �ְ� ���� insert�ϴ°� ���� �ʱⰪ ��
alter table test modify age varchar2(10) default '20';

insert into test (num,name) values (10,'��ȣ��');

--num�� �������� ���
select * from test order by num;
--�̸��� �������� �˻�
select * from test order by name desc;

--drop
--ALTER TABLE ���̺�� DROP COLUMN �������÷���
--age��� �÷��� ����
alter table test drop column age;
--addr ����
alter table test drop column addr;

--�÷��� ����
--ALTER TABLE ���̺�� RENAME COLUMN OLD�÷��� TO NEW�÷���;
--score==>jumsu
alter table test rename column score to jumsu;
--birth==>birthday
alter table test rename column birth to birthday;

--���̺� ���� test
drop table test;


--������ ����
--������ �⺻���� ����,1���� 1�� �����ϴ� ������ ������
create sequence seq1;

--��ü������ Ȯ��
select * from seq;

--���� ���������� �߻� �ֿܼ� ���
select seq1.nextval from dual;

--���� ������ �߻��� ��������
select seq1.currval from dual;

--seq1����
drop sequence seq1;

--10���� 5�� �����ϴ� ����������-cache�� ���ֱ�
create sequence seq2 start with 10 increment by 5 nocache;

--������ �߻�
select seq2.nextval from dual;

--������2 ����
drop sequence seq2;

--seq1 ���۰�:5 ������:2 ����:30 ĳ��:no cycle:yes
create sequence seq1 start with 5 increment by 2 maxvalue 30 nocache cycle;
--seq2 ���۰� 1 ������ 1 cache no
create sequence seq2 nocache;
--seq3 ���۰� 1 ������ 2 cache no
create sequence seq3 start with 1 increment by 2 nocache;

--���
select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--��ü����
drop sequence seq1;
drop sequence seq2;
drop sequence seq3;

--------------------������1������,���̺� ����
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
insert into personinfo values(seq_start.nextval,'�̹α�','programmer','m',29,'010-8250-9354','2023-06-15');
insert into personinfo values(seq_start.nextval,'karen','designer','f',29,'010-1233-5423','2020-08-14');
insert into personinfo values(seq_start.nextval,'�̼���','programmer','m',26,'010-5434-1254','2013-12-11');
insert into personinfo values(seq_start.nextval,'�ּ���','programmer','m',27,'010-1230-9323','2021-04-23');
insert into personinfo values(seq_start.nextval,'ȫ����','jobless','f',13,'010-7656-9344','2001-02-01');
insert into personinfo values(seq_start.nextval,'������','programmer','m',29,'010-8460-6745','2023-06-30');
insert into personinfo values(seq_start.nextval,'������','student','f',29,'010-8324-9254','2019-05-15');
insert into personinfo values(seq_start.nextval,'���缮','designer','m',40,'010-3240-9954','2014-12-12');
insert into personinfo values(seq_start.nextval,'��ȣ��','jobless','m',29,'010-1250-9314','2023-01-15');
insert into personinfo values(seq_start.nextval,'���缮','student','f',21,'010-1344-9314','2023-01-15');
commit;

--�����ο�Ȯ��
select count(*) from personinfo;
--��ȸ����
select * from personinfo order by name asc;
select * from personinfo order by age desc;
select * from personinfo order by 5; --�÷���ȣ�� ����

select * from personinfo order by gender,age desc;
select * from personinfo order by gender,name;

select job from personinfo;
select distinct job from personinfo;

--���� ������
select * from personinfo where name like '��%';
--�̸��� �ι�°���ڰ� �� �λ��
select * from personinfo where name like '_��%';

--�ڵ��� ������ �ڸ��� 33�� ���
select * from personinfo where hp like '%54';

--�Ի����ڰ� 3���λ��
select * from personinfo where to_char(ipsaday,'mm')='05';

--�Ի����ڰ� 2023�� �λ��
select * from personinfo where to_char(ipsaday,'yyyy')='2023';

--���̰� 20~30����
select * from personinfo where age between 20 and 30;
--������ �����̰ų� ���α׷����λ��
select * from personinfo where job in('programmer','jobless');
--������ �����̰ų� ���α׷��Ӱ� �ƴ� ���
select * from personinfo where job not in('programmer','jobless');

--��ճ���, �Ҽ��� ���ڸ��� ���ϱ�
select round(avg(age),1) from personinfo;

--�������(update)
--UPDATE ���̺�� SET �÷�1='�����ҵ�����' WHERE �÷�2='�����Ͱ�';
--2�� ���� ���� �����ϱ�,�����̾����� ��� �����Ͱ� �����ȴ� �����ʼ�
update personinfo set job='teacher',age=12;
--�߸������ѵ����� ������� ������
rollback;

update personinfo set job='teacher',age=12 where num=2;

--�Ӿ��̸鼭 ���α׷����λ���� ������ ���ڷ� �����ϱ�
update personinfo set gender='f' where name like '��%' and job='programmer';

--num�� 5���� ����� ������ ����� �Ի����� 2000/12/25 �� ����
update personinfo set job='teacher',ipsaday='2000/12/25' where num=5;

commit;

--����
--DELETE FROM ���̺��;
--5���� ����
delete from personinfo where num=5;

--�����߿��� ���̰� 25���̻� ��� ����
delete from personinfo where gender='f' and age>=25;

--�ڵ����� ***-****-****����
update personinfo set hp='***-****-****';

rollback;

desc personinfo;
select * from personinfo;

--���̺����
--������ ����
drop table personinfo;
drop sequence seq_start;

--dept���� 30�� �μ��� �þ�Ʋ�� ����
update dept set dname='SEATTLE' where deptno=30;
--emp���̺� TotalSal���� �ϳ� �� �߰�(number(20)���� �ٰ�)
alter table emp add TotalSal number(20);
--emp���̺� TotSal�� sal�� comm�� ���Ѱ����� ���
update emp set TotalSal=sal+nvl(comm,0);
--emp���� WARD����
delete from emp where ename='WARD';
--product���̺��� 100���� �������̷� ����
update product set p_name='��������' where p_code=100;

--Group by
--professor���� �а����� �������� ��ձ޿��� ���
select deptno �а�,avg(pay) "��� �޿�"
from professor
group by deptno;

--select���� ���� �׷��Լ� �̿��� �÷��̳� ǥ������ �ݵ�� group by�� ���Ǿ����
--professor���� ���޺� ��պ��ʽ� ���
select position ����,avg(nvl(bonus,0)) ��պ��ʽ� from professor group by position;

--�а��� ���޺��� �������� ��ձ޿�
select deptno,position,avg(pay) ��ձ޿�
from professor
group by deptno,position;

--student���� �г⺰ �ְ�Ű�� �ְ������ ���
select grade �г�,max(height) �ְ�Ű,max(weight) �ְ������ from student group by grade;

--������ ���޺� �ѱ޿��� �ְ��ʽ�
select position ����,sum(pay) �ѱ޿�,max(bonus) �ְ��ʽ� from professor group by position;

--emp���� ������ ���������� �����
select job ����,count(ename) ����� from emp group by job;

--Having��_�����ְ� �˻��ϱ�_�ݵ�� group by�ڿ�...
--��ձ޿��� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿�
--where���� �׷��Լ��� ���������� ��������
select deptno,avg(sal)
from emp
group by deptno
having avg(sal)>=2000;

--professor���� ��ձ޿��� 300�̻��� �а��� �а���ȣ�� ��ձ޿�
select deptno �а���ȣ,avg(pay) ��ձ޿�
from professor
where deptno not in(101)
group by deptno
having avg(pay)>=300
order by deptno desc;

--emp���� job���� sal�� ��ձ޿��� ���Ͻÿ�
select job,round(avg(sal),2) from emp group by job;
--professor���� ���޺� �ѱ޿��� ���Ͻÿ�
select position,sum(pay) from professor group by position;

--emp���� ������ �ο��� �ִ�޿�,�ּұ޿� ���(job�� ��������)
select job ����,count(ename) �ο���,max(sal) �ִ�޿�,min(sal) �ּұ޿�
from emp
group by job
order by job;
--�Ի�⵵ �׷캰�� ���(�Ի�⵵,�ο���,�޿����(�Ҽ�������) _�Ի�⵵�� ��������)
select to_char(hiredate,'yyyy') �Ի�⵵,count(ename) �ο���,round(avg(sal),0) �޿����
from emp
group by to_char(hiredate,'yyyy')
order by to_char(hiredate,'yyyy');

--Rollup�Լ�
--�ڵ����� �Ұ�/�հ� �����ִ� �Լ�
--group by���� �־��� �������� �Ұ谪�� �����ش�
select deptno �а���ȣ,position ����,sum(pay) �ѱ޿�
from professor
group by position,rollup(deptno);

select deptno �а���ȣ,position ����,sum(pay) �ѱ޿�
from professor
group by deptno,rollup(position);

--count
select position,count(*),sum(pay)
from professor
group by rollup(position);

select deptno,count(*),sum(pay)
from professor
group by rollup(deptno);

--cube�ռ�
--rollupó�� ���Ұ迡 ��ü�Ѱ���� �����ش�
select deptno,position,count(*),sum(pay)
from professor
group by cube(deptno,position);

--������ �Ѻ���
--Q1.emp���� ��տ����� 2000�̻��� �μ��� �μ���ȣ�� ��ձ޿��� ���Ͻÿ�
select avg(sal*12) ��տ���,deptno �μ���ȣ,avg(sal) ��ձ޿�
from emp
group by deptno
having avg(sal*12)>=2000;
--Q2.emp���� deptno�� �ο�����?
select deptno,count(ename) �ο���
from emp
group by deptno;
--Q3.emp���� job�� �ο����� ���Ͻÿ�(�� �ο��� 2���� �������� ���Ұ�)
select job,count(ename)
from emp
group by job
having count(ename)>2;
--Q4.emp���� job�� �޿��հ踦 ���ϴµ�(president�� �����Ұ�) �޿��հ谡 5000�̻� ���Ͻð� �޿��հ谡 �����ͺ��� ���
select job,sum(sal) �޿��հ�
from emp
where job not in('PRESIDENT')--PRESIDENT����
group by job -- job �׷캰��
having sum(sal)>=5000 --�޿��հ谡 5000�̻�
order by sum(sal) desc;--�޿��հ� ��������


--��������
--���̺����
create table sawon(num number(5) CONSTRAINT sawon_pk_num primary key,
name varchar2(20),
gender varchar2(10),
buseo varchar2(20) CONSTRAINT sawon_ck_buseo check(buseo in('ȫ����','�λ��','������')),
pay number(10) default 2000000);

--����������
create sequence seq_sawon nocache;

--������ insert
--üũ ��������(RHEEMINGYU.SAWON_CK_BUSEO)�� ����
--insert into sawon values(seq_sawon.nextval,'�̿���','f','���Ӱ��ߺ�',3500000);
insert into sawon values(seq_sawon.nextval,'�̹α�','m','������',3500000);
insert into sawon values(seq_sawon.nextval,'�̿���','f','�λ��',3000000);
insert into sawon values(seq_sawon.nextval,'�ּ���','m','ȫ����',2500000);
insert into sawon values(seq_sawon.nextval,'ȫ����','f','�λ��',2300000);
insert into sawon values(seq_sawon.nextval,'������','m','������',3500000);
insert into sawon values(seq_sawon.nextval,'�̼���','m','������',3000000);
insert into sawon values(seq_sawon.nextval,'���ҹ�','f','ȫ����',4000000);
commit;

--�μ��� �ο����� �ְ�޿�,�����޿� ��ȸ
select buseo �μ�,count(*) �ο���,max(pay) �ְ�޿�,min(pay) �ּұ޿� from sawon group by buseo;
--���� ���������� �ְ�޿�,�����޿��� ȭ����� ���̰� 3�ڸ� �ĸ��� ������
select buseo �μ�,count(*) �ο���,to_char(max(pay),'L9,999,999') �ְ�޿�,to_char(min(pay),'L9,999,999') �ּұ޿� from sawon group by buseo;
--���� �ο����� ��ձ޿��� ���(�ο��� �ڿ� �� �̶�� ��������)
select gender ����,count(*)||'��' �ο���,avg(pay) ��ձ޿� from sawon group by gender;
--�μ��� �ο����� ��ձ޿��� ���ϵ� �ο��� 3�� �̻��� ��쿡�� ���
select buseo �μ�,count(*) �ο���, avg(pay) ��ձ޿� from sawon group by buseo having count(*)>=3;
