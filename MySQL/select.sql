/* payments 테이블에서 금액(amount)이 5만 이상인 고객의 번호를 조회 */
use classicmodels;
desc payments;
select customerNumber as "고객번호" from payments
where amount>=50000;

select 10+10 as "hap";
select * from orders;

/* group by절에 사용된 필드만 select 절에 사용가능 */
select orderNumber from orders group by status; /* 오류 */

/* asc(오름차순)이 기본설정이라 생략가능 */
select * from orders order by orderNumber desc;

/* 1. 직원(employees)들의 정보를 이름순(lastName)으로 오름차 정렬하여 조회 */
select * from employees order by lastName;

/* 2. 직원들의 정보중 officeCode가 4번인 직원들을 이름순으로 조회 */
select * from employees where officeCode=4 order by lastName;

/* 3. 직원들의 정보중 officeCode가 1번 또는 4번인 직원들을 이름순으로 조회 */
select * from employees where officeCode=1 or officeCode=4 order by lastName;

/* count, sum, avg, max ,min 집계함수 */
/* 4. officCode가 4번인 직원들의 인원수는? */
select count(officeCode) as "인원수" from employees where officeCode=4;

/* 5. payments에 있는 금액들의 합계(sum), 평균(avg)를 조회 */
select sum(amount) as "합계", avg(amount) as "평균" from payments;

/* 6. payments에 있는 금액들의 최대값(max)과 최소값(min)을 조회 */
select max(amount) as "최고금액", min(amount) as "최소금액" from payments;

/* 7. 지불날짜(paymentDate)가 2004-11-14에 발생한 데이터의 건수 조회 */
select count(paymentDate) as "지불날짜" from payments where paymentDate='2004-11-14';

select * from payments where paymentDate='2004-11-14'; /* 맞는지 확인 */

/* 8. 최대금액을 지불한 고객들의 고객번호를 조회 */
select * from payments order by amount desc; /* 전체 데이터에서 내림차순으로 한번 확인 */
select max(amount) from payments; /* 전체 데이터에서 최고 amount 확인. 42,43행처럼 2번 쿼리를 날리면 확인 가능. */

select customerNumber from payments where amount = (select max(amount) from payments);

/* 9. 최소금액을 지불한 고객들의 고객번호를 조회 */
select customerNumber from payments where amount = (select min(amount) from payments);

/* 10. 고객 번호별 금액의 합계를 조회 */
select sum(amount) as "총액", customerNumber as "고객번호" from payments group by customerNumber;

/* 11. orders 테이블에서 현 상태(status)별 건수를 조회 */
select status as "상태", count(status) as "건수"  from orders group by status;

/* limit(시작위치, 갯수) 시작위치는 제로베이스 */
select * from orders limit 0,10;


