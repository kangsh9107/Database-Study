SELECT * FROM cus;
/* 1) country가 USA인 고객정보를 삭제 */
SELECT * FROM cus WHERE country = 'USA';
DELETE FROM cus WHERE country = 'USA'; /* SELECT로 확인하고 그대로 복사해 오는게 좋다. */
SELECT * FROM cus WHERE country = 'USA';
rollback;
SELECT * FROM cus WHERE country = 'USA';

/* 2) country USA이고 state가 NY인 자료만 삭제 */
SELECT * FROM cus;
DELETE FROM cus WHERE country = 'USA' and state = 'NY';

/* 3) customerNumber가 146번인 고객과 같은 country 자료를 삭제 */
SELECT * FROM cus;
SELECT * FROM cus WHERE country = 
	( SELECT a.country from
		( SELECT country FROM cus WHERE customerNumber = '146' ) a
	);
	/* 오라클의 경우 서브쿼리 하나로도 잘 작동하지만 MySQL은
	 * DML 명령을 적용하려는 테이블을 서브쿼리로 값을 끌어 올 때 에러난다.
	 * 그래서 서브쿼리 문장을 서브쿼리로 감싸 줘야 한다.
	 * a가 하나의 가상 테이블이라고 생각하면 편하다.
	 */

/* join으로 해보기 */
/* c1 : customerNumber가 146번인 고객의 정보 테이블
   c2 : 고객 정보 테이블 이라고 생각한다면 */
DELETE c2.* FROM cus c1 JOIN cus c2
ON c1.country = c2.country
WHERE c1.customerNumber = 146;

SELECT * FROM cus WHERE customerNumber = 146;
rollback;










