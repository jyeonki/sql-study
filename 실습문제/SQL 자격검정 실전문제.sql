


-- 93��
drop table ���ں�����_93;

CREATE TABLE ���ں�����_93 (
    ���� DATE,
    ����� NUMBER(5)
);

INSERT INTO ���ں�����_93 VALUES ('2015-11-01', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-02', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-03', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-04', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-05', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-06', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-07', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-08', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-09', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM ���ں�����_93;


-- ���� 2

SELECT B.����, SUM(B.�����) AS ���������
FROM ���ں�����_93 A
JOIN ���ں�����_93 B 
ON (A.���� >= B.����)
GROUP BY B.����
ORDER BY B.����;

SELECT A.����, A.�����, B.����, B.�����
FROM ���ں�����_93 A
JOIN ���ں�����_93 B 
ON (A.���� >= B.����)
ORDER BY B.����;






-- 86��
drop table ȸ���⺻����_86;
drop table ȸ��������_86;
CREATE TABLE ȸ���⺻����_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE ȸ��������_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE ȸ��������_86
ADD CONSTRAINT fk_user_id 
FOREIGN KEY (user_id)
references ȸ���⺻����_86 (user_id);



-- 31��
DROP TABLE ǰ��;

CREATE TABLE ǰ�� (
    ǰ��ID VARCHAR2(3),
    �ܰ� NUMBER(4)
);

INSERT INTO ǰ�� VALUES ('001', 1000);
INSERT INTO ǰ�� VALUES ('002', 2000);
INSERT INTO ǰ�� VALUES ('003', 1000);
INSERT INTO ǰ�� VALUES ('004', 2000);

SELECT
    *
FROM ǰ��;    

INSERT INTO ǰ��(ǰ��ID, �ܰ�)
    VALUES('005', 2000);
COMMIT;

DELETE ǰ�� WHERE ǰ��ID = '002';

UPDATE ǰ�� SET �ܰ� = 2000
WHERE �ܰ� = 1000;

ROLLBACK;

SELECT COUNT(ǰ��ID)
FROM ǰ��
WHERE �ܰ� = 2000;



-- 32��
DROP TABLE ��ǰ;

CREATE TABLE ��ǰ (
    ��ǰID VARCHAR2(3),
    ��ǰ�� VARCHAR2(10)
);

INSERT INTO ��ǰ VALUES ('001', 'TV');

SELECT
    *
FROM ��ǰ; 

SAVEPOINT SP1;
UPDATE ��ǰ SET ��ǰ�� = 'LCD-TV' WHERE ��ǰID = '001';

SAVEPOINT SP2;
UPDATE ��ǰ SET ��ǰ�� = '���-TV' WHERE ��ǰID = '001';
ROLLBACK TO SP2;
COMMIT;



-- 38��
DROP TABLE ��������;

CREATE TABLE �������� (
    �� VARCHAR(4),
    �� VARCHAR(2),
    ����ݾ� NUMBER(5)
);          

INSERT INTO �������� VALUES ('2014', '01', 1000);
INSERT INTO �������� VALUES ('2014', '02', 2000);
INSERT INTO �������� VALUES ('2014', '03', 3000);
INSERT INTO �������� VALUES ('2014', '11', 4000);
INSERT INTO �������� VALUES ('2014', '12', 5000);
INSERT INTO �������� VALUES ('2015', '01', 6000);
INSERT INTO �������� VALUES ('2015', '02', 7000);
INSERT INTO �������� VALUES ('2015', '03', 8000);
INSERT INTO �������� VALUES ('2015', '11', 9000);
INSERT INTO �������� VALUES ('2015', '12', 10000);

SELECT
    *
FROM ��������; 

-- 2014�� 11������ 2015�� 03�������� ����ݾ� �հ踦 ���
-- -> 30000

-- ���� 1
SELECT SUM(����ݾ�) AS ����ݾ��հ�
FROM ��������
WHERE �� BETWEEN '2014' AND '2015'
AND �� BETWEEN '03' AND '12'
;
-- -> 39000

-- ���� 2
SELECT SUM(����ݾ�) AS ����ݾ��հ�
FROM ��������
WHERE �� IN ('2014', '2015')
AND �� IN ('11', '12', '03', '04', '05')
;
-- -> 39000

-- ���� 3
SELECT SUM(����ݾ�) AS ����ݾ��հ�
FROM ��������
WHERE (�� = '2014' OR �� = '2015')
AND (�� BETWEEN '01' AND '03' OR �� BETWEEN '11' AND '12')
;
-- -> 55000

-- ���� 4
SELECT SUM(����ݾ�) AS ����ݾ��հ�
FROM ��������
WHERE (�� = '2014' AND �� BETWEEN '11' AND '12')
OR    (�� = '2015' AND �� BETWEEN '01' AND '03')
;
-- -> 30000




-- 39��
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



-- 96��
DROP TABLE ���;

CREATE TABLE ��� (
    ��� VARCHAR2(3) PRIMARY KEY,
    �̸� VARCHAR2(3),
    ���� NUMBER(2)
);  

DROP TABLE ����;

CREATE TABLE ���� (
    
); 


































