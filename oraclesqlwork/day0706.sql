--emp���̺��� ename�� ��ȸ�Ͻÿ�
select ename from emp;
--emp���̺��� �̸��� ������ ��ȸ�Ͻÿ�
select ename,job from emp;
--emp���̺� ��ü��ȸ
select * from emp;
--Student���̺� ��ü��ȸ
select * from student;
--ǥ����
select name,'���ݽǽ���' from student;
--�÷� ��Ī alias���
select name "�̸�",grade as "�г�",birthday ���� from student;
--emp���� �����,����,�Ի������� ��ȸ�Ͻÿ�
select ename "�����",job "����",hiredate "�Ի�����" from emp;
--DISTINCT:�ߺ��� ���� �����ϰ� ����ϱ�
--emp���� �������� �ߺ����� ���� ����ϼ���
select DISTINCT job ������ from emp;
--emp���� �μ���ȣ�� �ߺ����� ���
select DISTINCT DEPTNO "�μ���ȣ" from emp;
--�ռ�������: �÷��� �ٿ��� ���
select name||grade �г⺰�л��� from student;
--professor��ȸ
select * from professor;
--�ϳ��� �÷����� ���_������ ���� ������ �Դϴ�
select name || '����' || position || '�Դϴ�' "����������" from professor;
--smith���� job�� clerk �Դϴ�
select ename||'����job��'||job||'�Դϴ�' from emp;
--student���� ���������� Ű�� 180cm,�����Դ� 72kg�Դϴ�
select name||'���� Ű�� '||height||'cm,�����Դ� '||weight||'kg�Դϴ�' from student;
--emp���� �������� salesman �̰� ������ ***�Դϴ�
select '�������� '||job||'�̰� ������ '||sal||'�Դϴ�' from emp;
--����
--student���� �л��� �г� ������ �л����� ������������ ��ȸ�Ͻÿ�
select name �л���,grade �г�,birthday ���� from student order by name asc;--asc�� ��������
select name �л���,grade �г�,birthday ���� from student order by birthday;

--emp���� �����,����,�޿��� �޿��� ������������� ��ȸ�ϼ���
select ename �����,job ����,sal �޿� from emp order by 3 desc;--�÷���ȣ�ε� ��ȸ����
--emp���� �������� �ߺ����� ����ϰ� �������� ������������ ���
select DISTINCT job ������ from emp order by job asc;

--���������
--emp���� sal�� Ư�����ʽ� 100�� ���Ͽ� ����Ͻÿ�
select ename �����,sal �⺻��,sal+100 Ư�����ʽ� from emp;
--where�� : ����
--emp���� 10���μ��� �ٹ��ϴ� ����� �����,�޿�,�μ���ȣ�� ����ϼ���
select ename �����,sal �޿�,deptno �μ���ȣ from emp where deptno=10;
--emp���� �̸��� KING�λ���� �����,������ ��ȸ�Ͻÿ�
select ename �����,job ���� from emp where ename='KING';
--emp���� �޿��� 3000�̻��� ����� �����,�޿��� ��ȸ�ϼ���
select ename �����,sal �޿� from emp where sal>=3000;
--�л����̺��� Ű�� 180cm�̻��� �л���� Ű�� ����Ͻÿ�
select name �л���,height Ű from student where height>=180;
--�л����̺� Ű�� 160~180������ �л���� Ű ��� between a and b(�������ں���)
select name �л���,height Ű from student where height between 160 and 180 order by height;
--in(a,b) :a,b�� ��ȸ
--emp���� deptno�� 20,30�λ������ ������ �μ���ȣ ��ȸ
select ename �����,deptno �μ���ȣ from emp where deptno in(20,30);
--null���� ���
--emp���� comm�� null�λ���� �̸��� ���ʽ��� ����Ͻÿ�
select ename �̸�,comm ���ʽ� from emp where comm is null;
--emp���� comm�� null�� �ƴѻ���� �̸��� ���ʽ��� ����Ͻÿ�
select ename �̸�,comm ���ʽ� from emp where comm is not null;

--NVL : null�� 0���� �ٲٱ� _������ ����
select ename �����,nvl(comm,0) ���ʽ� from emp;

--Like ������
--�л����̺��� �达�� ��ȸ�Ͽ� ��翭�� ����Ͻÿ�
select * from student where name like '��%';
--�л��޺� �� ���?
select count(*) cnt from student;
--emp���� job�� salesman,manager�� �����,�������� ����Ͻÿ�(or in������)
select ename �����,job ������ from emp where job='SALESMAN' or job='MANAGER';
select ename �����,job ������ from emp where job in('SALESMAN','MANAGER');

--emp���� �޿��� 2000~3000�� �����,������,�޿��� ����ϼ���(and between������)
select ename �����,job ������,sal �޿� from emp where sal>=2000 and sal<=3000;
select ename �����,job ������,sal �޿� from emp where sal between 2000 and 3000;

--Q.student ���̺��� 1�г� �л��� �л���,Ű�� ����Ͻÿ�(�� Ű�� ������..)
select name �л���,height Ű from student where grade=1 order by height;
--Q.student���� 2�г��л��� �л��� ���� Ű �����Ը� ����Ͻÿ�(�� ������ �����������)
select name �л���,birthday ����,height Ű,weight ������ from student where grade=2 order by birthday;
--Q.professor���� �������� �̸��� �������� ���� ������ ������ ���� �Ի����ڸ� ����Ͻÿ�
select name ������,position ����,hiredate �Ի����� from professor where name like '��%';
--Q.emp���� �����,�޿�,�޿�*12,���ʽ�,�޿��Ѱ踦 ���Ͻÿ�
select ename �����,sal �޿�,sal*12 "�޿�*12",nvl(comm,0) ���ʽ�,sal*12+nvl(comm,0) �޿��Ѱ� from emp;
--Q.emp���� �Ի����ڰ� 1982�� ���Ŀ� ���»���� ������ �Ի����ڸ� ��ȸ�Ͻÿ�(�Ի����� ��)
select ename �����,hiredate �Ի����� from emp where hiredate>='1982/01/01' order by hiredate;

--Like % ,_����� �̿��ؼ� Ư�������� �ִ� ���� ���
--emp���� ������� 3��°���ڰ� a�λ���� ����� ���
select ename ����� from emp where ename like '__A%';
--emp���� ������� 2��°���ڰ� a�λ�� �Ǵ� 3��° ���ڰ� a�λ���� ����� ���
select ename ����� from emp where ename like '_A%'or ename like'__A%';

--��¥ ���ͷ� ' '�ݵ�� ���
--emp���� ������ clerk�̰� �Ի����� 87/05/23�λ���� ����� �Ի��� ���ϱ�
select ename �����,hiredate �Ի��� from emp where job='CLERK'and hiredate='87/05/23';
--emp���� �Ŵ����̰ų� 82������ �Ի����� ����� ������ �Ի��� ���
select ename �����,job ������,hiredate �Ի��� from emp where job='MANAGER'or hiredate>='1982/01/01';

--��������
--student���� 1�г��л��� �̸��� Ű�� ������ ���(Ű�� �����������,�����Դ� �����������)
select name �̸�,height Ű,weight ������ from student where grade=1 order by height asc,weight desc;
--emp���� �޿����������� �ٽ� �̸����� ��������_�����ȣ ����� �޿� ��ȸ
select empno �����ȣ,ename �����,sal �޿� from emp order by sal desc,ename asc;

--union
--unionAll
select name,deptno1,deptno2 from student where deptno1=101 union
select name,deptno1,deptno2 from student where deptno2=201;
--Q.gogak point�� 30��~50�� ����� ����Ʈ�� ���(����Ʈ ������)

select gname ����,point ����Ʈ from gogak where point between 300000 and 500000 order by point desc;
--Q.emp�� comm�� ���� 0���� �ٲپ ������ manager�� ����� �̸��� ���ʽ� ���
select ename �̸�,nvl(comm,0) ���ʽ� from emp where job='MANAGER';
--Q.professor 103�� �а� �������� �̸��� �޿�,���ʽ�,������ ���
select name �̸�,pay �޿�,nvl(bonus,0) ���ʽ�,pay*12+nvl(bonus,0) ���� from professor where deptno=103;

--SQL �׷��Լ�(count,sum,avg)
--count(*) null�� ����,count(�÷�) null�� ����
select count(*),count (hpage) from professor;
--sum(�÷���)
select count(bonus),sum(bonus) from professor;
--avg(�÷���)
select avg(bonus) from professor;
--max,min
select max(sal),min(sal) from emp;
select max(hiredate),min(hiredate) from emp;

--�Ҽ���
--emp���� sal�� ���
select round(avg(sal),1) from emp; --�Ҽ��� 1�ڸ�
select round(avg(sal),2) from emp;
select round(avg(sal),0) from emp; --�ݿø�
select round(avg(sal),-1) from emp; --10����
select round(avg(sal),-2) from emp; --100����

--�ֿܼ� ���
--���糯¥�� �ֿܼ� ���
select sysdate from dual;

--���ϳ�¥�� �ֿܼ� ���
select sysdate+1 from dual;

--to_char : ��¥ �� ��ġ �����͸� ���ڷ� ��ȯ�ϱ� ���� �Լ�
--��¥���� �⵵�� ����
select to_char(sysdate,'year') from dual;--����� ����
select to_char(sysdate,'yyyy') from dual;--2023

select to_char(sysdate,'month') from dual;
select to_char(sysdate,'mm') from dual;
select to_char(sysdate,'dd') from dual;

select to_char(sysdate,'yyyy-mm-dd hh24-mi-ss') from dual;

--to_char ���ڿ��� ���밡��
select to_char(981260173,'999,999,999') from dual;

--emp
select empno �����ȣ,ename �����,to_char(hiredate,'yyyy') �⵵ from emp;
--emp���� �����ȣ,�����,�޿� ���(�޿��� õ�������б�ȣ)
select empno �����ȣ,ename �����,to_char(sal,'L9,999') �޿� from emp;

--��������
--�����ȿ� �Ǵٸ� ���� ���(KING���� �޿��� ���� �޴� �����?)_2���� ����
--���������� ��������Ǿ� �װ���� ���������� �����ְ� �װ��� �޾� ���������� ����
--���������ȿ��� order by�� �� ��

--emp���� JAMES���� �޿����� �޴� ����� ����� �޿��� ���غ���
select ename �����,sal �޿� from emp where sal>(select sal from emp where ename='JAMES');

--emp���� ��ձ޿����� ���� �޴� ����� �����ȣ,�����,�޿��� ��Ÿ���ÿ�
select empno �����ȣ,ename �����,sal �޿� from emp where sal>(select avg(sal) from emp);

--emp���� �̸��� WARD�� ����� MGR�� �������� ��������� ������
select * from emp where MGR=(select MGR from emp where ename='WARD');

--emp���� ��ձ޿����� ���̹޴� �����?
select count(*) from emp where sal>(select avg(sal) from emp);

--�������� ����
--Q1. emp���� ADAMS�� ���� �������� ���� ����� �̸� ���� ������ ���
select ename �̸�,sal ����,job ������ from emp where job=(select job from emp where ename='ADAMS');
--Q2. emp���� SCOTT�� ���� ������ �޴� ����� �̸��� ���� ���
select ename �̸�,sal ���� from emp where sal=(select sal from emp where ename='SCOTT');
--Q3. student���� ��1������ ������ �л��� ������ �л����� �л��� ��1���� ���
select name �л���,deptno1 ��1���� from student where deptno1=(select deptno1 from student where name='������');
--Q4. student���� ��1������ 101�� �а��� ��ո����Ժ��� �����԰� ���� �л����� �̸��� ������ ���
select name �̸�,weight ������ from student where weight>(select avg(weight) from student where deptno1=101);
--Q5. professor���� �Ի����� �迵�� �������� ���߿� �Ի��� ����� �̸��� �Ի��� �а���ȣ ���
select name �̸�,hiredate �Ի���,deptno �а���ȣ from professor where hiredate>(select hiredate from professor where name='�迵��');