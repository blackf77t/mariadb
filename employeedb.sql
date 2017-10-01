/*
 * employeedb.sql
 * author: Tom Monte
 * version: 1.0
 * Usage: mysql -u dbadmin -pPASSWORD < /home/tmonte/scripts/employeedb/codechallenge.sql
 * Purpose: Solve code challenge problem
 * convert the string: "(id,created,employee(id,firstname,employeeType(id), lastname),location)"
 *
 * Assumptions:
 * 1.) centos 7 server is installed
 * 2.) mariadb is installed with "sudo yum -y install mariadb-server"
 * 3.) The script needs to be executible with "chmod +x codechallenge.sh" on linux.
 * 4.) The following commands were entered to create the database.
 *     mysql -u root -pDatapass123
 *     create database employeedb;
 *     create user 'dbadmin'@localhost identified by 'sqlpassword';
 *     grant all on employeedb.* to 'dbadmin' identified by 'sqlpassword';
 *     exit
 *
 */

use employeedb;
create table employees (
  employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  employeeType TEXT,
  firstname TEXT,
  lastname TEXT);
# unittest - show columns from employees;

# Create the location table
create table location (
  location_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  employee_id INT,
  location TEXT);
# unittest - show columns from location;


# Insert data into the employees table
use employeedb;
INSERT INTO employees (employeeType,firstname,lastname) VALUES ('FTE', 'Thomas', 'Monte');
INSERT INTO employees (employeeType,firstname,lastname) VALUES ('FTE', 'Tom', 'Monte');
# unittest - Select * from employees;

# Insert data into the location table
INSERT INTO location (employee_id, location) VALUES (1,'Malvern');
INSERT INTO location (employee_id, location) VALUES (2,'Doylestown');
# unittest - Select * from location;

# Create a view that contains the employees and location tables sorted based on bonus format
SELECT *
FROM employees
INNER JOIN location ON employees.employee_id = location.employee_id
ORDER BY location.created,employees.employeeType,employees.employee_id,employees.firstname,employees.lastname,loca$
