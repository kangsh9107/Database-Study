/* payments ���̺��� �ݾ�(amount)�� 5�� �̻��� ���� ��ȣ�� ��ȸ */
use classicmodels;
desc payments;
select customerNumber as "����ȣ" from payments
where amount>=50000;

select 10+10 as "hap";
select * from orders;

/* group by���� ���� �ʵ常 select ���� ��밡�� */
select orderNumber from orders group by status; /* ���� */

/* asc(��������)�� �⺻�����̶� �������� */
select * from orders order by orderNumber desc;

/* 1. ����(employees)���� ������ �̸���(lastName)���� ������ �����Ͽ� ��ȸ */
select * from employees order by lastName;

/* 2. �������� ������ officeCode�� 4���� �������� �̸������� ��ȸ */
select * from employees where officeCode=4 order by lastName;

/* 3. �������� ������ officeCode�� 1�� �Ǵ� 4���� �������� �̸������� ��ȸ */
select * from employees where officeCode=1 or officeCode=4 order by lastName;

/* count, sum, avg, max ,min �����Լ� */
/* 4. officCode�� 4���� �������� �ο�����? */
select count(officeCode) as "�ο���" from employees where officeCode=4;

/* 5. payments�� �ִ� �ݾ׵��� �հ�(sum), ���(avg)�� ��ȸ */
select sum(amount) as "�հ�", avg(amount) as "���" from payments;

/* 6. payments�� �ִ� �ݾ׵��� �ִ밪(max)�� �ּҰ�(min)�� ��ȸ */
select max(amount) as "�ְ�ݾ�", min(amount) as "�ּұݾ�" from payments;

/* 7. ���ҳ�¥(paymentDate)�� 2004-11-14�� �߻��� �������� �Ǽ� ��ȸ */
select count(paymentDate) as "���ҳ�¥" from payments where paymentDate='2004-11-14';

select * from payments where paymentDate='2004-11-14'; /* �´��� Ȯ�� */

/* 8. �ִ�ݾ��� ������ ������ ����ȣ�� ��ȸ */
select * from payments order by amount desc; /* ��ü �����Ϳ��� ������������ �ѹ� Ȯ�� */
select max(amount) from payments; /* ��ü �����Ϳ��� �ְ� amount Ȯ��. 42,43��ó�� 2�� ������ ������ Ȯ�� ����. */

select customerNumber from payments where amount = (select max(amount) from payments);

/* 9. �ּұݾ��� ������ ������ ����ȣ�� ��ȸ */
select customerNumber from payments where amount = (select min(amount) from payments);

/* 10. �� ��ȣ�� �ݾ��� �հ踦 ��ȸ */
select sum(amount) as "�Ѿ�", customerNumber as "����ȣ" from payments group by customerNumber;

/* 11. orders ���̺��� �� ����(status)�� �Ǽ��� ��ȸ */
select status as "����", count(status) as "�Ǽ�"  from orders group by status;

/* limit(������ġ, ����) ������ġ�� ���κ��̽� */
select * from orders limit 0,10;


