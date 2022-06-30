
--DROP TABLE pay;
--DROP SEQUENCE seq_pay;
 
CREATE TABLE pay (
    emp_num NUMBER(8),
    emp_name VARCHAR2(20) NOT NULL,
    emp_rank VARCHAR2(10) NOT NULL,
    base_pay NUMBER(8),
    tax_rate NUMBER(3,2),
    net_salary NUMBER(8),
    CONSTRAINT pk_pay PRIMARY KEY (emp_num)
);

SELECT * FROM pay;

CREATE SEQUENCE  seq_pay;
--    START WITH    
--    INCREMENT BY 1

INSERT INTO pay VALUES (to_char(sysdate,'yymmdd')|| + SEQ_PAY.nextval, '김사원', '사원', 2000000, 0.10, 1800000);
INSERT INTO pay VALUES (to_char(sysdate,'yymmdd')|| + SEQ_PAY.nextval, '나대리', '대리', 2500000, 0.15, 2125000);
INSERT INTO pay VALUES (to_char(sysdate,'yymmdd')|| + SEQ_PAY.nextval, '박과장', '과장', 3000000, 0.20, 2400000);
INSERT INTO pay VALUES (to_char(sysdate,'yymmdd')|| + SEQ_PAY.nextval, '이부장', '부장', 3500000, 0.25, 2625000);

COMMIT;

SELECT
    *
FROM pay
WHERE emp_num = 2206302
;









