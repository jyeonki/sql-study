
--DROP TABLE pay;
--DROP SEQUENCE seq_pay;
 
CREATE TABLE pay (
    emp_num CHAR(8),
    emp_name VARCHAR2(20) NOT NULL,
    emp_rank VARCHAR2(10) NOT NULL,
    base_pay NUMBER(8),
    tax_rate NUMBER(3,2),
    net_salary NUMBER(8),
    CONSTRAINT pk_pay PRIMARY KEY (emp_num)
);

COMMENT ON TABLE pay IS '급여';
COMMENT ON COLUMN pay.emp_num IS '사원번호';
COMMENT ON COLUMN pay.emp_name IS '사원명';
COMMENT ON COLUMN pay.emp_rank IS '직급';
COMMENT ON COLUMN pay.base_pay IS '기본급';
COMMENT ON COLUMN pay.tax_rate IS '세율';
COMMENT ON COLUMN pay.net_salary IS '순급여';


SELECT * FROM pay;


CREATE SEQUENCE seq_pay;
--    START WITH    
--    INCREMENT BY 1

INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '김사원', '사원', 2000000, 0.10, 1800000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '나대리', '대리', 2500000, 0.15, 2125000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '박과장', '과장', 3000000, 0.20, 2400000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '이부장', '부장', 3500000, 0.25, 2625000);


--ROLLBACK;
COMMIT;


SELECT
    *
FROM pay
WHERE emp_num = '22070101'
;

SELECT AVG(net_salary) AS avg_emp_pay 
FROM pay;

SELECT 
    * 
FROM pay
ORDER BY emp_num
;









