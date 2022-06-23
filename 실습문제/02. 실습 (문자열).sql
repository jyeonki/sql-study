

SELECT 
    first_name, LENGTH(first_name)
FROM employees;

SELECT 
    first_name, last_name
FROM employees
WHERE LOWER(first_name) = 'david'
;

-- Q. employees 테이블에서 job_id가 it_prog인 사원의 first_name과 salary를 출력하세요.
--  조건1 ) 비교하기 위한 값은 소문자로 입력할 것!
--  조건2 ) 이름은 앞 3글자까지만 출력하고 나머지는 *로 마킹할 것. 
--          이 열의 별칭은 name입니다.
--  조건3 ) 급여는 전체 10자리로 출력하되 나머지자리는 *로 출력합니다. 
--           이 열의 별칭은 salary입니다.


SELECT 
    RPAD('Ste', 6, '*')  -- Steven
    , RPAD('Cas', 9, '*')  -- Cassandra
    , RPAD('Mic', 8, '*')  -- Michelle
FROM dual;




SELECT 
    RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name
    , LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog'
;

