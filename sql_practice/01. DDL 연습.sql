
-- DDL : 데이터 정의어
-- CREATE, ALTER, DROP, RENAME, TRUNCATE

DROP TABLE board;
DROP TABLE reply;

-- CREATE TABLE : 테이블을 생성
CREATE TABLE board (
    bno NUMBER(10)
    , title VARCHAR2(200) NOT NULL
    , writer VARCHAR2(40) NOT NULL
    , content CLOB
    , reg_date DATE DEFAULT SYSDATE 
    , view_count NUMBER(10) DEFAULT 0 
);
-- SYSDATE(현재 시간)

-- ALTER : 데이버베이스의 구조를 변경

-- PK 설정 (PK 자체가 NOT NULL UNIQUE)
ALTER TABLE board
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);


-- 데이터 추가
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1, '안뇽?', '꾸꾸까까', '아아하하하하ㅋㅋㅋㅋ');
COMMIT; 

INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '맛있는 점심', '하하호호');
COMMIT; 


-- 연관관계 설정
-- 게시물과 댓글의 관계
-- 1 : M

-- 댓글 테이블 생성
CREATE TABLE reply (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10)
    , CONSTRAINT pk_reply_rno PRIMARY KEY(rno) -- PK 설정
);

-- 외래키 설정 (FOREIGN KEY) : 테이블 간의 관계 제약 설정
ALTER TABLE reply
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY(bno)
REFERENCES board (bno);


-- 컬럼 변경
-- 컬럼 추가 ADD
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);

SELECT * FROM reply;

-- 컬럼 제거 DROP COLUMN (추가랑 헷갈리지 않도록 주의)
ALTER TABLE board
DROP COLUMN view_count;

-- 컬럼 수정 MODIFY
ALTER TABLE board
MODIFY (title VARCHAR2(500));


-- 테이블 삭제
DROP TABLE reply; -- 테이블 구조 삭제
TRUNCATE TABLE board; -- 테이블 내부 전체 삭제 - 롤백 불가



SELECT * FROM board;