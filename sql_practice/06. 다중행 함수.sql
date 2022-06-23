

-- ���� �Լ� (������ �Լ�)
-- : ���� ���� ��� �Լ��� ����
SELECT * FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
ORDER BY pay_de
;


SELECT * FROM tb_sal_his
WHERE emp_no = '1000000005'
;

-- GROUP BY�� �ұ׷�ȭ ���� ������ �����Լ��� ��ü����� �������� �����Ѵ�
SELECT
    SUM(pay_amt) "���� �Ѿ�"
    , AVG(pay_amt) "��� ���޾�"
    , COUNT(pay_amt) "���� Ƚ��"
--    ,emp_no ����!
FROM tb_sal_his
;  

SELECT
    MAX(birth_de) �ֿ�����
    , MIN(birth_de) �ֿ�����
    , COUNT(emp_no) "���� ��"
FROM tb_emp    
; 

SELECT
    dept_cd
    , MAX(birth_de) �ֿ�����
    , MIN(birth_de) �ֿ�����
    , COUNT(emp_no) "���� ��"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;


-- ����� ���� �޿����ɾ� ��ȸ
SELECT 
    emp_no "���"
    , SUM(pay_amt) "���� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no -- GROUP BY ��ġ�� WHERE�� ��, ORDER BY ��
                -- GROUP BY ���� ���� �÷��� FROM�� �ش����� �ʾƵ� SELECT�� ���� �� �ִ�
ORDER BY emp_no
;

-- ������� �޿��� ���� ���� �޾��� ��, ���� ���� �޾��� ��, ��������� �󸶹޾Ҵ��� ��ȸ
SELECT 
    emp_no "���"
    , MAX(pay_amt) "�ְ� ���ɾ�"
    , MIN(pay_amt) "���� ���ɾ�"
    , AVG(pay_amt) "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no 
ORDER BY emp_no
;

-- ������� �޿��� ���� ���� �޾��� ��, ���� ���� �޾��� ��, ��������� �󸶹޾Ҵ��� ��ȸ
-- 2019�⵵�� ��ȸ
SELECT 
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999.99') "��� ���ɾ�"
    , TO_CHAR(SUM(pay_amt), 'L999,999,999') "����"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no 
ORDER BY emp_no
;


-- HAVING : �׷�ȭ�� ������� ������ �ɾ� �� ���� ����
-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����

SELECT
    dept_cd
    , MAX(birth_de) �ֿ�����
    , MIN(birth_de) �ֿ�����
    , COUNT(emp_no) "���� ��"
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(emp_no) > 1 -- �Ϲ������� HAVING�� GROUP BY �ڿ� ����
ORDER BY dept_cd
;

-- ������� �޿��� ���� ���� �޾��� ��, ���� ���� �޾��� ��, ��������� �󸶹޾Ҵ��� ��ȸ
-- ��� �޿��� 450���� �̻��� ����� ��ȸ
SELECT 
    emp_no "���"
    , TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
    , TO_CHAR(MIN(pay_amt), 'L999,999,999') "���� ���ɾ�"
    , TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999.99') "��� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no 
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;

-- ������� 2019�� ��� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ
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


-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��)
-- DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no -- ������ ���� (�⺻��)
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
ORDER BY emp_nm -- �����ڵ�� ����
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
    emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY �̸�
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
    emp_no ���
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no 
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;










