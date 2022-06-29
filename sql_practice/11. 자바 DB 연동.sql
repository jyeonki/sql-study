

CREATE TABLE PERSON ( 
    ssn CHAR(14)PRIMARY KEY -- 주민번호는 원래 PRIMARY KEY로 하면 안됨
    , person_name VARCHAR2(50) NOT NULL
    , age NUMBER NOT NULL
);

SELECT * FROM person;