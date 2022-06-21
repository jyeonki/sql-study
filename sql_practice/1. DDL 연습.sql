
-- DDL : ������ ���Ǿ�
-- CREATE, ALTER, DROP, RENAME, TRUNCATE

DROP TABLE board;
DROP TABLE reply;

-- CREATE TABLE : ���̺��� ����
CREATE TABLE board (
    bno NUMBER(10)
    , title VARCHAR2(200) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , content CLOB
    , reg_date DATE DEFAULT SYSDATE 
    , view_count NUMBER(10) DEFAULT 0 
);
-- SYSDATE(���� �ð�)

-- ALTER : ���̹����̽��� ������ ����

-- PK ���� (PK ��ü�� NOT NULL UNIQUE)
ALTER TABLE board
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);


-- ������ �߰�
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1, '�ȴ�?', '�ٲٱ��', '�ƾ��������Ϥ�������');
COMMIT; 

INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '���ִ� ����', '����ȣȣ');
COMMIT; 


-- �������� ����
-- �Խù��� ����� ����
-- 1 : M

-- ��� ���̺� ����
CREATE TABLE reply (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10)
    , CONSTRAINT pk_reply_rno PRIMARY KEY(rno) -- PK ����
);

-- �ܷ�Ű ���� (FOREIGN KEY) : ���̺� ���� ���� ���� ����
ALTER TABLE reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(bno)
REFERENCES board (bno);


-- �÷� ����
-- �÷� �߰� ADD
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);

SELECT * FROM reply;

-- �÷� ���� DROP COLUMN (�߰��� �򰥸��� �ʵ��� ����)
ALTER TABLE board
DROP COLUMN view_count;

-- �÷� ���� MODIFY
ALTER TABLE board
MODIFY (title VARCHAR2(500));


-- ���̺� ����
DROP TABLE reply; -- ���̺� ���� ����
TRUNCATE TABLE board; -- ���̺� ���� ��ü ���� - �ѹ� �Ұ�



SELECT * FROM board;