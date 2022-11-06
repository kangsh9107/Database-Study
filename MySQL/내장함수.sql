/* 내장 함수 */
USE mydb;
SET @a = 10.1;
SET @b = -10.1;
SELECT abs(@a), abs(@b), ceil(@a), ceil(@b), floor(@a), floor(@b);

SELECT round(12345.123456, 3), round(123456, -3), round(12345.123456, 0);
SELECT round(-12.35, 1);

/********** 숫자 관련 함수 **********/
/* 1) 수량이 1234개이고, 단가가 123.4원 제품의 금액을 계산하고,
		1000원 미만의 금액은 절삭하여 표시. */
SELECT (1234*123.4) AS "금액", floor(1234*123.4) AS "절삭", floor(1234*123.4/1000)*1000 AS "100원 단위 이하 절삭";

/* 2) 12345원의 예금액에 이자율을 25% 적용하여 지급액을 조회.
		단, 원단위 이하, 10원단위 이하는 절상 */
SELECT (12345*0.25) AS "원래", ceil(12345*0.25/100)*100 AS "10원 단위 이하 절상";

/* 3) 12311원의 예금액에 이자율을 11% 적용하여 지급액을 조회.
		단, 원단위 이하, 10원단위 이하는 반올림 */
SELECT (12311*0.11) AS "원래", round(12311*0.11/100)*100 AS "10원 단위 이하 반올림";

/* 4) truncate(n, p): p의 자리에서 버림 */
SELECT truncate(12345.678, 0), truncate(12345.678, 1), truncate(12345.678, 2), truncate(12345.678, -1), truncate(12345.678, -2);

/* 5) pow(x, y) OR power(x, y): x의 y승 */
SELECT power(2, 2);

/* 6) mod(x, y): x를 y로 나눈 나머지 */
SELECT mod(10, 3);

/* 7) greatest(n1, n2, n3, ...): 가장 큰 수 */
SELECT greatest(345, 2, 2, 35, 4,
				68, 6, 78, 3, 53,
				6, -100, 7, 7, 657) AS "가장 큰 수";

/* 8) least(n1, n2, n3, ...): 가장 작은 수 */
SELECT least(345, 2, 2, 35, 4,
				68, 6, 78, 3, 53,
				6, -100, 7, 7, 657) AS "가장 작은 수";

/* 비교연산 */
SET @num = 10;
SELECT @num = 10; /* TRUE 1반환 */
SELECT @num = 50; /* FALSE 0반환 */
SELECT @num := "가"; /* @num에 새로운 값 대입 */
SELECT @num;



/********** 문자 관련 함수 **********/
/* 1) ascii(str): str의 아스키 코드값 */
SELECT ascii('e'); /* 1글자씩만 가능. */
SELECT ascii('-');
SELECT ascii(@k);

/* 2) concat(str1, str2, str3, ...): 문자열 연결 */
SET @k = concat('e','n','t','e','r');
SELECT @k;
SELECT concat('enter', ' ', 'key');
SELECT concat('a', 'b'), 'a'+'b', 'a'||'b', 'a', 'b', 'a'&&'b', 'a'!='b';

/* 3) insert(str, start, length, newStr): str문자열에서
		start에서 LENGTH길이 만큼의 문자열을 newStr로 바꿈
		첫번째 자리가 1이다. */
SELECT insert('12345', 2, 0, 'abc');
SELECT insert('abcdef', 2, 1, '123');
SELECT insert('abcdef', 2, 5, '123');

/* REPLACE */
SELECT replace('abcdef', 'b', '123'), insert('abcdef', 2, 1, '123');

/* 4) left(str, length): str에서 왼쪽부터 length만큼 추출 */
SELECT left('12345', 2);

/* 5) right(str, length): str에서 오른쪽부터 length만큼 추출 */
SELECT right('12345', 3);

/* 6) mid(str, start, length) OR substring(str, start, length):
		str에서 start위치부터 length만큼 추출 */
SELECT mid('12345', 2, 2);

/* 7) ltrim(str) OR rtrim(str) OR trim(str): 공백 제거 */
SELECT trim('     12 34 5   '); /* 양쪽 공백 제거 */
SELECT trim(LEADING FROM '      12 34 5     '); /* 좌측 첫번째~다른문자까지 공백 제거 */
SELECT trim(LEADING '1' FROM '111  2 34 5     '); /* 좌측 첫번째~다른문자까지 지정 문자 제거 */
SELECT trim(TRAILING FROM '      12 34 5     '); /* 우측 첫번째~다른문자까지 공백 제거 */
SELECT trim(TRAILING '5' FROM '    111  2 34 5555'); /* 우측 첫번째~다른문자까지 지정 문자 제거 */

/* 8) lcase(str) OR lower(str): 모두 소문자로 */
SELECT lower('asdBSDFsaf');
SELECT lower(asdBSDFsaf); /* ''없어서 오류 */

SELECT customerNumber  , customerName, contactLastName,
	   contactFirstName, phone       , addressLine1,
	   addressLine2    , lower(city) AS "city" FROM classicmodels.customers WHERE lower(CITY) = lower('NYC');

/* 9) ucase(str) OR upper(str): 모두 대문자로 */
SELECT upper('asdBSDFsaf');

/* 10) reverse(str): str을 반대로 나열 */
SELECT reverse('abcdef12345');

/* 11) format(숫자, 소수점 자리수): 천단위 소숫점 표시 */
SELECT format(12.12345, 1);
SELECT format(12.12345, 10);

SELECT * FROM classicmodels.payments;
SELECT format(amount, 2) "금액", format(amount*0.1, 2) "부가세", format(amount*1.1, 2) "총액"
FROM classicmodels.payments;





/********** 논리 함수 **********/
/* 1) if(논리식, 참일때, 거짓일때) */
SELECT if(1!=1, 't', 'f');
SELECT if(1=1 && 2=2, 't', 'f');
SELECT if(1!=1 || 2=2, 't', 'f');

SELECT customerNumber, checkNumber,paymentDate FROM classicmodels.payments;
SELECT format(amount, 2) "금액",
	   format(amount*0.1, 2) "부가세",
	   format(amount*1.1, 2) "총액",
	   if(amount*1.1 >= 50000, '우수고객', null) "우수고객 여부"
FROM classicmodels.payments
ORDER BY amount desc;

SELECT if(amount*1.1 >= 50000, concat( format(amount*1.1, 2), ', ', "우수고객" ),
	   format(amount*1.1, 2)) "총액, 우수고객 여부"
FROM classicmodels.payments
ORDER BY amount desc;

/* 2) ifnull(v1, v2): v1이 null이면 v2를 반환, 아니면 v1을 반환 */
SELECT ifnull(null, 'abc');
SELECT ifnull('가나다', 'abc');









