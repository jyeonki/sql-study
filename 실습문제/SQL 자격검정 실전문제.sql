


-- 93번
drop table 일자별매출_93;

CREATE TABLE 일자별매출_93 (
    일자 DATE,
    매출액 NUMBER(5)
);

INSERT INTO 일자별매출_93 VALUES ('2015-11-01', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-02', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-03', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-04', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-05', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-06', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-07', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-08', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-09', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM 일자별매출_93;


-- 보기 2

SELECT B.일자, SUM(B.매출액) AS 누적매출액
FROM 일자별매출_93 A
JOIN 일자별매출_93 B 
ON (A.일자 >= B.일자)
GROUP BY B.일자
ORDER BY B.일자;

SELECT A.일자, A.매출액, B.일자, B.매출액
FROM 일자별매출_93 A
JOIN 일자별매출_93 B 
ON (A.일자 >= B.일자)
ORDER BY B.일자;






-- 86번
drop table 회원기본정보_86;
drop table 회원상세정보_86;
CREATE TABLE 회원기본정보_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE 회원상세정보_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE 회원상세정보_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references 회원기본정보_86 (user_id);



-- 31번
DROP TABLE 품목;

CREATE TABLE 품목 (
    품목ID VARCHAR2(3),
    단가 NUMBER(4)
);

INSERT INTO 품목 VALUES ('001', 1000);
INSERT INTO 품목 VALUES ('002', 2000);
INSERT INTO 품목 VALUES ('003', 1000);
INSERT INTO 품목 VALUES ('004', 2000);

SELECT
    *
FROM 품목;    

INSERT INTO 품목(품목ID, 단가)
    VALUES('005', 2000);
COMMIT;

DELETE 품목 WHERE 품목ID = '002';

UPDATE 품목 SET 단가 = 2000
WHERE 단가 = 1000;

ROLLBACK;

SELECT COUNT(품목ID)
FROM 품목
WHERE 단가 = 2000;



-- 32번
DROP TABLE 상품;

CREATE TABLE 상품 (
    상품ID VARCHAR2(3),
    상품명 VARCHAR2(10)
);

INSERT INTO 상품 VALUES ('001', 'TV');

SELECT
    *
FROM 상품; 

SAVEPOINT SP1;
UPDATE 상품 SET 상품명 = 'LCD-TV' WHERE 상품ID = '001';

SAVEPOINT SP2;
UPDATE 상품 SET 상품명 = '평면-TV' WHERE 상품ID = '001';
ROLLBACK TO SP2;
COMMIT;



-- 38번
DROP TABLE 월별매출;

CREATE TABLE 월별매출 (
    년 VARCHAR(4),
    월 VARCHAR(2),
    매출금액 NUMBER(5)
);          

INSERT INTO 월별매출 VALUES ('2014', '01', 1000);
INSERT INTO 월별매출 VALUES ('2014', '02', 2000);
INSERT INTO 월별매출 VALUES ('2014', '03', 3000);
INSERT INTO 월별매출 VALUES ('2014', '11', 4000);
INSERT INTO 월별매출 VALUES ('2014', '12', 5000);
INSERT INTO 월별매출 VALUES ('2015', '01', 6000);
INSERT INTO 월별매출 VALUES ('2015', '02', 7000);
INSERT INTO 월별매출 VALUES ('2015', '03', 8000);
INSERT INTO 월별매출 VALUES ('2015', '11', 9000);
INSERT INTO 월별매출 VALUES ('2015', '12', 10000);

SELECT
    *
FROM 월별매출; 

-- 2014년 11월부터 2015년 03월까지의 매출금액 합계를 출력
-- -> 30000

-- 보기 1
SELECT SUM(매출금액) AS 매출금액합계
FROM 월별매출
WHERE 년 BETWEEN '2014' AND '2015'
AND 월 BETWEEN '03' AND '12'
;
-- -> 39000

-- 보기 2
SELECT SUM(매출금액) AS 매출금액합계
FROM 월별매출
WHERE 년 IN ('2014', '2015')
AND 월 IN ('11', '12', '03', '04', '05')
;
-- -> 39000

-- 보기 3
SELECT SUM(매출금액) AS 매출금액합계
FROM 월별매출
WHERE (년 = '2014' OR 년 = '2015')
AND (월 BETWEEN '01' AND '03' OR 월 BETWEEN '11' AND '12')
;
-- -> 55000

-- 보기 4
SELECT SUM(매출금액) AS 매출금액합계
FROM 월별매출
WHERE (년 = '2014' AND 월 BETWEEN '11' AND '12')
OR    (년 = '2015' AND 월 BETWEEN '01' AND '03')
;
-- -> 30000




-- 39번
DROP TABLE SVC_JOIN;

CREATE TABLE SVC_JOIN (
    CUST_ID VARCHAR2(10) NOT NULL,
    SVC_ID VARCHAR2(5) NOT NULL,
    JOIN_YMD VARCHAR2(8) NOT NULL,
    JOIN_HH VARCHAR2(4) NOT NULL,
    
    SVC_START_DATE DATE NULL,
    SVC_END_DATE DATE NULL
);          

--INSERT INTO SVC_JOIN VALUES ();

SELECT
    *
FROM SVC_JOIN; 



-- 96번
DROP TABLE 사원;

CREATE TABLE 사원 (
    사번 VARCHAR2(3) PRIMARY KEY,
    이름 VARCHAR2(3),
    나이 NUMBER(2)
);  

DROP TABLE 가족;

CREATE TABLE 가족 (
    
); 


































