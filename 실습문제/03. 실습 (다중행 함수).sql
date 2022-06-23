-- 실습문제

-- 1. employees테이블에서 각 사원의 부서별 부서 번호(department_id)와 평균 급여(salary)를 조회하세요. 
--    단, 부서번호가 null이면 0으로 변경하여 조회세요.
SELECT
    NVL(department_id, 0) AS dep_id
    , AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id -- SELECT보다 먼저 실행
ORDER BY dep_id
;

-- FROM -> WHERE-> GROUP BY -> HAVING -> SELECT -> ORDER BY

-- FROM : 각 테이블 확인
-- ON : 조인 조건 확인
-- JOIN : 테이블 조인 (병합)
-- WHERE : 데이터 추출 조건 확인
-- GROUP BY : 특정 칼럼으로 데이터 그룹화
-- HAVING : 그룹화 이후 데이터 추출 조건 확인
-- SELECT : 데이터 추출
-- DISTINCT : 중복 제거
-- ORDER BY : 데이터 정렬

SELECT 
    NVL(department_id, 0) AS dep_id
     , ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

-- 2. employees테이블에서 부서별 부서 번호(department_id)와 부서별 총 사원 수를 조회하세요.
--    단, 부서번호가 null이면 0으로 변경하여 조회세요.
SELECT
    NVL(department_id, 0) AS dep_id
    , COUNT(*) AS total_count
FROM employees
GROUP BY department_id
ORDER BY dep_id
;

SELECT 
    NVL(department_id, 0) AS dep_id
     , COUNT(employee_id) AS total_count
FROM employees
GROUP BY department_id
ORDER BY dep_id
;


-- 3. employees테이블에서 부서의 급여 평균이 8000을 초과하는 부서의 부서번호와 급여 평균을 조회하세요.
SELECT
    department_id
    , AVG(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
;

SELECT
    department_id,
    ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY department_id
;


-- 4. employees테이블에서 급여 평균이 8000을 초과하는 각 직무(job_id)에 대하여 
--    직무 이름(job_id)이 SA로 시작하는 사원은 제외하고 직무 이름과 급여 평균을 
--    급여 평균이 높은 순서로 정렬하여 조회하세요.
SELECT
   job_id
   , AVG(salary)
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY AVG(salary) DESC
;

SELECT 
    job_id
    , ROUND(AVG(salary), 2) AS avg_sal
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY avg_sal DESC
;