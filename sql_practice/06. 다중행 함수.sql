

-- 집계 함수 (다중행 함수)
-- : 여러 행을 묶어서 함수를 적용
SELECT * FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
ORDER BY pay_de
;


SELECT * FROM tb_sal_his
WHERE emp_no = '1000000005'
;

-- GROUP BY로 소그룹화 하지 않으면 집계함수는 전체행수를 기준으로 집계한다
SELECT
    SUM(pay_amt) "지급 총액"
    , AVG(pay_amt) "평균 지급액"
    , COUNT(pay_amt) "지급 횟수"
--    ,emp_no 주의!
FROM tb_sal_his
;  

SELECT
    MAX(birth_de) 최연소자
    , MIN(birth_de) 최연장자
    , COUNT(emp_no) "직원 수"
FROM tb_emp    
; 

SELECT
    dept_cd
    , MAX(birth_de) 최연소자
    , MIN(birth_de) 최연장자
    , COUNT(emp_no) "직원 수"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;


-- 사원별 누적 급여수령액 조회
SELECT 
    emp_no "사번"
    , SUM(pay_amt) "누적 수령액"
FROM tb_sal_his
GROUP BY emp_no -- GROUP BY 위치는 WHERE절 뒤, ORDER BY 앞
                -- GROUP BY 절에 적은 컬럼은 FROM에 해당하지 않아도 SELECT에 적을 수 있다
ORDER BY emp_no
;

-- 사원별로 급여를 제일 많이 받았을 때, 제일 적게 받았을 때, 평균적으로 얼마받았는지 조회
SELECT 
    emp_no "사번"
    , MAX(pay_amt) "최고 수령액"
    , MIN(pay_amt) "최저 수령액"
    , AVG(pay_amt) "평균 수령액"
FROM tb_sal_his
GROUP BY emp_no 
ORDER BY emp_no
;

-- 사원별로 급여를 제일 많이 받았을 때, 제일 적게 받았을 때, 평균적으로 얼마받았는지 조회
-- 2019년도만 조회
SELECT 
    emp_no "사번"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "최고 수령액"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999.99') "평균 수령액"
    , TO_CHAR(SUM(pay_amt), 'L999,999,999') "연봉"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no 
ORDER BY emp_no
;


-- HAVING : 그룹화된 결과에서 조건을 걸어 행 수를 제한
-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음

SELECT
    dept_cd
    , MAX(birth_de) 최연소자
    , MIN(birth_de) 최연장자
    , COUNT(emp_no) "직원 수"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(emp_no) > 1 -- 일반적으로 HAVING은 GROUP BY 뒤에 쓴다
ORDER BY dept_cd
;

-- 사원별로 급여를 제일 많이 받았을 때, 제일 적게 받았을 때, 평균적으로 얼마받았는지 조회
-- 평균 급여가 450만원 이상인 사람만 조회
SELECT 
    emp_no "사번"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "최고 수령액"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "최저 수령액"
    , TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999.99') "평균 수령액"
FROM tb_sal_his
GROUP BY emp_no 
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

-- 사원별로 2019년 평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT
    emp_no
    , SUM(pay_amt)
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
;

--  
SELECT
    emp_no
    , sex_cd
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, sex_cd
;

SELECT
    dept_cd
    , COUNT(*)
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd
;


-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값)
-- DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no -- 오름차 정렬 (기본값)
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no DESC
;

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm -- 유니코드로 정렬
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY dept_cd, emp_no
;

SELECT
    emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, 1 DESC
;

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT 
    emp_no 사번
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no 
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;










