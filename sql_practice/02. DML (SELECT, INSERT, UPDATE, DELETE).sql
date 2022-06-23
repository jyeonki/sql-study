

-- DML : ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE
--  ��ȸ   |         ����

INSERT INTO board 
    (bno, title, content, writer, reg_date) -- ������� ���� �ʾƵ� ����� ����
VALUES
    (1,'�����̾�~', '�����~~~', '�Ѹ�', SYSDATE + 1); -- ���ڿ��� ������ ''


-- NOT NULL (title) �������� ���� - ���� ���� 
INSERT INTO board 
    (bno, content, writer)
VALUES
    (2,'����ȣȣ', '������');


-- PK�� UNIQUE �������� ����(bno �ߺ�) - ���� ����
INSERT INTO board 
    (bno, content, writer)
VALUES
    (1,'�������m', '��Ű');
 
    
INSERT INTO board 
    (bno, title, writer) -- COLUMN
VALUES
    (2,'�����Դϴ�', '�浿��');


-- �÷��� ������� �ʾ��� ��� �ݵ�� ��� �÷��� ���� ������� ä���� �� (���������� ���� ���� ��õ���� �ʴ´�)
INSERT INTO board 
   
VALUES
    (3,'����Ѹ�', '����', '�����Դϴ�', SYSDATE +30);
   
   
    
-- ������ ����    
UPDATE board
SET title = '������ �����̾�~'
-- WHERE writer = '����';
WHERE bno = 3;

UPDATE board
SET writer = '������'
    , content = '�޷ո޷ո޷�'
WHERE bno = 2;    

-- WHERE�� ������
UPDATE board
SET writer = '���۳�';



-- ������ ����
DELETE FROM board -- DELETE�� FROM���̿� �ƹ��͵� ������
WHERE bno = 1;


-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (�ѹ� ����, ���� Ŀ�� ����, �α׳���� ����)
DELETE FROM board;

-- 2. TRUNCATE TABLE 
-- (�ѹ� �Ұ���, �ڵ� Ŀ��, �α׸� ���� �� ����, ���̺� ���� �ʱ���·� ����) - �����ϴ� ������
-- �̶����� Ŀ�� ���� ���뵵 �� Ŀ����
TRUNCATE TABLE board;

-- 3. DROP TABLE
-- (�ѹ� �Ұ���, �ڵ� Ŀ��, �α׸� ���� �� ����, ���̺� ������ ���� ������) - �����ϴ� ������
DROP TABLE board;
    
    
    
COMMIT; -- commit ������ �����ϰ�  
ROLLBACK;

SELECT * FROM board;



