

-- 104번

--  * GROUP BY절에 쓸 수 있는 그룹핑함수
--
--    1.  ROLLUP( col_a, col_b )     
--        :  col_a로 그룹바이해서 통계, col_a + col_b 를 합쳐서 그룹바이 통계, 전체 통계
--
--    2.  CUBE( col_a, col_b ) 
--       :  col_a로 그룹바이 통계, col_b 그룹바이 통계, col_a + col_b 통계,  전체 통계
--
--    3. GROUPING SETS ( col_a, col_b )
--       :  col_a로 통계,   col_b로 통계
--
--    *  SELECT절에 쓰는 GROUPING함수
--       :  함수의 인자값이 null이면 1리턴, 아니면 0리턴
--         ex )  GROUPING( manager_id )   =>   manager_id가 null이면 1리턴
      
      

--      ROLLUP ( 사원번호, 급여지급월 )
--
--        ->   GROUP BY 사원번호 
--              GROUP BY 사원번호, 급여지급월
--              GROUP BY 없이 통계 
--
--         CUBE ( 사원번호, 급여지급월 )
--
--        ->   GROUP BY 사원번호 
--              GROUP BY  급여지급월
--              GROUP BY 사원번호, 급여지급월
--              GROUP BY 없이 통계 
--
--        GROUPING SETS ( 사원번호, 급여지급월 )
--
--        ->   GROUP BY 사원번호 
--              GROUP BY  급여지급월
--
-- 
--           사원번호     급여지급월      액수
--         ----------------------------------------
--            001             202201          100
--            001             202202          120
--            001             202203          140
--            002             202201          200
--            002             202202          220
--            002             202203          240