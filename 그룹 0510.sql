--rownum ���� �÷�.
SELECT rownum,empno,ename FROM emp  
where rownum<=5;


-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�

 SELECT avg(sal)as avg, sum(sal) as sum, min(sal) as min, max(sal) max
 FROM   emp
 WHERE job = 'SALESMAN';

-- ���� �Լ��� null ���� �˾Ƽ� ó������. 
 INSERT INTO emp(empno, ename, job) VALUES (9988,'ȫȫ��','SALESMAN');

 --Ŀ�̼�(COMM)�� �޴� ������� ����
 SELECT count(empno) as count  --SELECT count(*) as count
 FROM   emp
whERE comm is not null and comm !=0;
--where nvl(comm,0)<>0;
 
 /*
 SELECT columns
 FROM table_name
 WHERE condition
 GROUP BY group_by_expression
 HAVING condition
 ORDER By column;
 */
 
 
 --�μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
SELECT deptno, count(*) cnt, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
 FROM emp

 GROUP BY deptno; -- �翬�� grouping �� column �� �θ� �� �ִ�. 
 
  --�μ���,job���� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
 SELECT deptno,job, count(*) cnt, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum
 FROM emp
 GROUP BY deptno,job; -- �翬�� grouping �� column �� �θ� �� �ִ�. 
 
 
-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� (�μ��� �޿��� ���� ���� ������

SELECT deptno, round(avg(sal)) avg, min(sal) min, max(sal) max, sum(sal) sum 
 FROM emp
 GROUP BY deptno
 ORDER By sum desc; 
          

 -- �μ��������� �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
 
SELECT deptno,job, count(*) cnt, round(avg(sal)) avg, sum(sal) sum
 FROM emp

 GROUP BY deptno,job;
          

-- �޿��� �ִ� 2900 �̻��κμ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
SELECT deptno, round(avg(sal)) avg,  sum(sal) sum 
 FROM emp
  GROUP BY deptno
 HAVING max(sal) >=2900; 

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���

SELECT job, round(avg(sal)) avg,   sum(sal) sum 
 FROM emp
 GROUP BY job 
 HAVING round(avg(sal)) >=3000;

-- ��ü �հ� �޿��� 5000���ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
--��, SALESMAN�������ϰ� �޿� �հ谡 ���� ������ ����

SELECT job, sum(sal) sum 
 FROM emp
 where job !='SALESMAN' 
 GROUP BY job 
 HAVING  sum(sal) >5000
 ORDER BY sum desc;
 

--  �������ְ� �޿��� �ּ� �޿��� ���̸� ���϶�

SELECT job, max(sal)-min(sal) Diff
 FROM emp
 GROUP BY job ;

 

-- �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���

 SELECT deptno,count(*),sum(sal) sum 
 FROM emp
 GROUP BY deptno 
 HAVING  count(*)>4;

 
 
 
 
