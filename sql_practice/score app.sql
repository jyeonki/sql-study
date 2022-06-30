


CREATE TABLE score (
    stu_num NUMBER(10),
    stu_name VARCHAR2(20) NOT NULL,
    kor NUMBER(3) NOT NULL,
    eng NUMBER(3) NOT NULL,
    math NUMBER(3) NOT NULL,
    total NUMBER(3),
    average NUMBER(5,2),
    CONSTRAINT pk_score PRIMARY KEY (stu_num)
);

-- ¿¬¼ÓµÈ ¼ýÀÚ »ý¼º
CREATE SEQUENCE seq_score;

SELECT * FROM score;

INSERT INTO score VALUES (seq_score.nextval,  'È«±æµ¿', 90, 90, 90, 270, 90);
INSERT INTO score VALUES (seq_score.nextval,  '±èÃ¶¼ö', 80, 80, 80, 240, 80);
INSERT INTO score VALUES (seq_score.nextval,  '¹Ú¿µÈñ', 100, 100, 100, 300, 100);
COMMIT;





