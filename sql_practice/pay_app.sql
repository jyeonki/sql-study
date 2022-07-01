
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

COMMENT ON TABLE pay IS '�޿�';
COMMENT ON COLUMN pay.emp_num IS '�����ȣ';
COMMENT ON COLUMN pay.emp_name IS '�����';
COMMENT ON COLUMN pay.emp_rank IS '����';
COMMENT ON COLUMN pay.base_pay IS '�⺻��';
COMMENT ON COLUMN pay.tax_rate IS '����';
COMMENT ON COLUMN pay.net_salary IS '���޿�';


SELECT * FROM pay;


CREATE SEQUENCE seq_pay;
--    START WITH    
--    INCREMENT BY 1

INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '����', '���', 2000000, 0.10, 1800000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '���븮', '�븮', 2500000, 0.15, 2125000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '�ڰ���', '����', 3000000, 0.20, 2400000);
INSERT INTO pay VALUES (TO_CHAR(sysdate,'yymmdd')|| + LPAD(seq_pay.nextval, 2, '0'), '�̺���', '����', 3500000, 0.25, 2625000);


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









