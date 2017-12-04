SELECT * FROM t_user u LEFT JOIN t_dept d ON u.dept_id = d.id ORDER BY d.id NULLS FIRST; 

SELECT * FROM emp; 

SELECT DISTINCT e.*,LEVEL FROM emp e START WITH e.mgr IS NULL CONNECT BY PRIOR e.empno =  e.mgr; 

SELECT e.deptno,e.mgr,SUM(sal) FROM emp e GROUP BY ROLLUP(deptno,mgr);
SELECT GROUPING(e.deptno),GROUPING(e.mgr),SUM(sal) FROM emp e GROUP BY CUBE(deptno,mgr);

SELECT e.deptno,e.mgr,SUM(sal) FROM emp e GROUP BY GROUPING SETS(deptno,mgr);


SELECT e.*,RANK() OVER(PARTITION BY deptno ORDER BY sal) FROM emp e; 
SELECT e.*,dense_rank() OVER(PARTITION BY deptno ORDER BY sal) FROM emp e; 
SELECT e.*,row_number() OVER(PARTITION BY deptno ORDER BY sal) FROM emp e; 
SELECT e.*,NTILE(3) OVER(ORDER BY sal) FROM emp e;

SELECT e.*,
first_value(sal) OVER(PARTITION BY deptno ORDER BY sal),
first_value(sal) OVER(PARTITION BY deptno ORDER BY sal DESC)
FROM emp e;

SELECT e.*,
LEAD(sal, 1) OVER(PARTITION BY deptno ORDER BY sal),
LAG(sal, 1) OVER(PARTITION BY deptno ORDER BY sal)
FROM emp e;
