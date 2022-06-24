

-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT employee_id, first_name, department_id, manager_id FROM employees;
SELECT department_id, manager_id FROM departments;

SELECT
    E.employee_id, E.first_name, E.last_name
    , E.department_id, D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id, E.first_name, E.last_name
    , department_id, D.department_name
FROM employees E
NATURAL JOIN departments D
;

SELECT
    E.employee_id, E.first_name, E.last_name
    , D.department_id, D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
    AND E.manager_id = D.manager_id
;


-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.employee_id, E.first_name, E.last_name
    , department_id, D.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    E.employee_id, E.first_name
    , D.department_name, L.city
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
INNER JOIN locations L
ON D.location_id = L.location_id
;






