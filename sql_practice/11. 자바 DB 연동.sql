

CREATE TABLE PERSON ( 
    ssn CHAR(14)PRIMARY KEY -- �ֹι�ȣ�� ���� PRIMARY KEY�� �ϸ� �ȵ�
    , person_name VARCHAR2(50) NOT NULL
    , age NUMBER NOT NULL
);

SELECT * FROM person;