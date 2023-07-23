// Answer 1
SELECT HR.employees.employee_id, HR.employees.first_name ,HR.departments.department_name
FROM HR.employees
INNER JOIN HR.departments ON HR.employees.manager_id = HR.departments.manager_id;


// Answer 2
SELECT EMP.employee_id,
       MAN.employee_id
FROM HR.employees EMP
JOIN HR.employees MAN ON EMP.manager_id = MAN.employee_id;



// Answer 3.1
SELECT SUBSTR(phone_number,1,3) Operator,
       COUNT(*) Total
FROM HR.employees
GROUP BY SUBSTR(phone_number,1,3);


//Answer 3.2
SELECT
    CASE 
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '515' THEN 'Op. 515'
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '650' THEN 'Op. 650'
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '603' THEN 'OP. 603'      
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '590' THEN 'OP. 590'   
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '011' THEN 'OP. 011'  
    END Operator,
    COUNT(*) "Total"
FROM
    HR.EMPLOYEES
GROUP BY
    CASE 
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '515' THEN 'Op. 515'
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '650' THEN 'Op. 650'
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '603' THEN 'OP. 603'      
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '590' THEN 'OP. 590'   
        WHEN SUBSTR(PHONE_NUMBER,1,3) = '011' THEN 'OP. 011'   
    END;
    
    
    
//Answer 4    
CREATE TABLE HR.emp (
  employee_id NUMBER(10),
  first_name VARCHAR2(25),
  last_name VARCHAR2(25),
  email VARCHAR2(25),
  phone_number VARCHAR2(25),
  hire_date date,
  job_id VARCHAR2(10),
  salary number(10,2),
  commision_pct number(3,2),
  manager_id number(10),
  department_id number(10)
);   
    
INSERT INTO HR.emp (employee_id,first_name,last_name,
  email,phone_number,hire_date,job_id,salary,commision_pct,manager_id,department_id)
SELECT employee_id,first_name,last_name,
  email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id
FROM HR.employees
WHERE HR.employees.employee_id > 200;

UPDATE HR.emp
SET phone_number = '535.353.553', salary = 5353
WHERE employee_id = 205;

DELETE FROM HR.emp
WHERE employee_id = 205;

drop table HR.emp;





//Answer 5  
CREATE TABLE HR.emp (
  employee_id NUMBER(10),
  customer_name VARCHAR2(40)
); 

INSERT INTO HR.emp (employee_id,customer_name)
SELECT employee_id,first_name || ' ' || last_name AS CUSTOMERNAME
FROM HR.employees
WHERE HR.employees.employee_id > 200;

SELECT         
  UPPER(INITCAP(SUBSTR(customer_name, 1, 2)) 
  || RPAD('*', INSTR(customer_name, ' ', 1, 1) - 3, '*') 
  || ' ' 
  || INITCAP(SUBSTR(customer_name, INSTR(customer_name, ' ', 1, 1) + 1, 2))
  || RPAD('*', LENGTH(customer_name) - INSTR(customer_name, ' ', 1, 1) - 2, '*')) AS CUSTOMERNAME
FROM HR.emp;