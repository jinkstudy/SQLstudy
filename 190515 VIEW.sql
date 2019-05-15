
CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp;
           
 select * from v_emp; --�������̺� (View)
 select * from emp; --��¥ ���̺�
 
 
 -- �������̺� �����ص� ���� ���̺� �ڷᵵ ������.
INSERT INTO v_emp(empno,ename,deptno) Values(8888,'�ͽ���',30);
INSERT INTO v_emp(empno,ename,deptno) Values(8888,'�����',30); --��¥���̺� PK ����
INSERT INTO v_emp(empno,ename,deptno) Values(7777,'�ڽ���',60); --��¥���̺� FK ����

-- �б� ���� �� ����
CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
          with read only ;
          
INSERT INTO v_emp(empno,ename,deptno) Values(7777,'�ڽ���',60);    -- �б� ������ ����� DML�۾� �Ұ�.


--�����ȣ,�����,�μ��� --> v_emp_info 

CREATE OR REPLACE VIEW v_emp_info  AS
           select e.empno empno, e.ename ename, d.dname dname from emp e,dept d where e.deptno = d.deptno ;
          --with read only ;

select * from v_emp_info; 

INSERT INTO v_emp_info(empno,ename,dname) Values(8899,'�˽���','RESEARCH'); --���� �信��  �Է¾ȵ�.

-- [ ���� ] �μ����� �μ���, �ּұ޿�, �ִ�޿�, �μ��� ��� �޿��� �����ϴ� DEPT_SUM �並�����Ͽ���.

CREATE OR REPLACE VIEW DEPT_SUM AS
        SELECT d.dname dname, min(e.sal) min ,max(e.sal) max , avg(e.sal) avg 
        FROM emp e inner join dept d
        on e.deptno=d.deptno 
        group by d.dname;
        
SELECT * FROM dept_sum;        
--�������̺� ������ view�� �ڵ� ������Ʈ ��.
INSERT INTO emp(empno,ename,sal,deptno) Values(8890,'ȫȫȫ',10000,20);       

          