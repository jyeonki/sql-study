

-- SELECT 기본
SELECT 
    emp_no, emp_nm
FROM tb_emp;

SELECT 
    certi_cd, certi_nm
FROM
    tb_certi;
    
SELECT
    * 
FROM tb_dept;

SELECT 
    emp_nm, emp_no
FROM tb_emp;


-- DISTINCT : 중복값을 제외하고 조회
SELECT ALL 
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM tb_certi;


-- 열 별칭 (colomn alias) 지정
SELECT
    certi_cd AS "자격증 코드" -- AS는 항상 생략가능, 
    , certi_nm AS 자격증명 -- ""(띄어쓰기 없으면 생략가능)
    , issue_insti_nm 발급기관명
FROM tb_certi;


-- 문자열 결합 연산자
-- ex) SQLD (100002) - 한국데이터진흥원
SELECT
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM tb_certi;


-- 더미 테이블 (dual) : 단순 연산결과를 조회할 때 사용
SELECT
    3 * 7 AS "연산 결과"
FROM dual;

SELECT
    SYSDATE AS "현재 날짜"
FROM dual;












