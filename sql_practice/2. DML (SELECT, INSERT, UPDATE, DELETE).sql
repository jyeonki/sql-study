

-- DML : 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE
--  조회   |         갱신

INSERT INTO board 
    (bno, title, content, writer, reg_date) -- 순서대로 쓰지 않아도 상관은 없음
VALUES
    (1,'제목이야~', '랄라라~~~', '둘리', SYSDATE + 1); -- 문자열은 무조건 ''


-- NOT NULL (title) 제약조건 위반 - 삽입 실패 
INSERT INTO board 
    (bno, content, writer)
VALUES
    (2,'하하호호', '마이콜');


-- PK의 UNIQUE 제약조건 위반(bno 중복) - 삽입 실패
INSERT INTO board 
    (bno, content, writer)
VALUES
    (1,'후헤헤헿', '미키');
 
    
INSERT INTO board 
    (bno, title, writer) -- COLUMN
VALUES
    (2,'제목입니당', '길동이');


-- 컬럼을 명시하지 않았을 경우 반드시 모든 컬럼의 값을 순서대로 채워야 함 (가능하지만 쓰는 것을 추천하지 않는다)
INSERT INTO board 
   
VALUES
    (3,'제목뚜리', '돼지', '내용입니당', SYSDATE +30);
   
   
    
-- 데이터 수정    
UPDATE board
SET title = '수정된 제목이야~'
-- WHERE writer = '돼지';
WHERE bno = 3;

UPDATE board
SET writer = '수정맨'
    , content = '메롱메롱메롱'
WHERE bno = 2;    

-- WHERE절 생략시
UPDATE board
SET writer = '나쁜놈';



-- 데이터 삭제
DELETE FROM board -- DELETE와 FROM사이에 아무것도 적지마
WHERE bno = 1;


-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE절 (롤백 가능, 수동 커밋 가능, 로그남기기 가능)
DELETE FROM board;

-- 2. TRUNCATE TABLE 
-- (롤백 불가능, 자동 커밋, 로그를 남길 수 없음, 테이블 생성 초기상태로 복귀) - 위험하니 쓰지마
-- 이때까지 커밋 안한 내용도 다 커밋함
TRUNCATE TABLE board;

-- 3. DROP TABLE
-- (롤백 불가능, 자동 커밋, 로그를 남길 수 없음, 테이블 구조가 완전 삭제됨) - 위험하니 쓰지마
DROP TABLE board;
    
    
    
COMMIT; -- commit 언제나 신중하게  
ROLLBACK;

SELECT * FROM board;



