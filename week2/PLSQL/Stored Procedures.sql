CREATE TABLE "ACCOUNTS" 
   (	"ACCOUNTID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"BALANCE" NUMBER, 
	 PRIMARY KEY ("ACCOUNTID"));
	 
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (401, 1, 10000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (402, 2, 15000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (403, 3, 7000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (404, 4, 12000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (405, 5, 9000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (406, 6, 11000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (407, 7, 8000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (408, 8, 9500);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (409, 9, 13000);
INSERT INTO ACCOUNTS (AccountID, CustomerID, Balance) VALUES (410, 10, 14000);

	 
CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEEID" NUMBER, 
	"NAME" VARCHAR2(50), 
	"DEPARTMENTID" NUMBER, 
	"SALARY" NUMBER, 
	 PRIMARY KEY ("EMPLOYEEID"));
	 
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (301, 'Alice Morgan', 1, 50000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (302, 'Bob Carter', 1, 55000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (303, 'Catherine Lee', 2, 48000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (304, 'David Kim', 2, 60000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (305, 'Eve Brown', 3, 52000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (306, 'Frank Wilson', 3, 58000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (307, 'Grace Hall', 1, 51000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (308, 'Henry Young', 2, 57000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (309, 'Ivy Scott', 3, 49000);
INSERT INTO EMPLOYEES (EmployeeID, Name, DepartmentID, Salary) VALUES (310, 'Jack Adams', 1, 53000);

COMMIT;

CREATE TABLE "SAVINGS_ACCOUNTS" 
   (	"ACCOUNTID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"BALANCE" NUMBER, 
	 PRIMARY KEY ("ACCOUNTID"));

INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (201, 1, 5000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (202, 2, 12000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (203, 3, 8000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (204, 4, 20000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (205, 5, 4500);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (206, 6, 6000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (207, 7, 7000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (208, 8, 3000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (209, 9, 15000);
INSERT INTO SAVINGS_ACCOUNTS (AccountID, CustomerID, Balance) VALUES (210, 10, 9000);

COMMIT;

--Senario 1

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  UPDATE SAVINGS_ACCOUNTS
  SET Balance = Balance + (Balance * 0.01);
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');
END;
/

call ProcessMonthlyInterest();

--Senario 2

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_DepartmentID IN NUMBER,
  p_BonusPercent IN NUMBER  -- e.g., pass 10 for 10%
) AS
BEGIN
  UPDATE EMPLOYEES
  SET Salary = Salary + (Salary * p_BonusPercent / 100)
  WHERE DepartmentID = p_DepartmentID;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Bonuses applied to employees in department ' || p_DepartmentID);
END;
/

call UpdateEmployeeBonus(2,10);

--Senario 3

CREATE OR REPLACE PROCEDURE TransferFunds (
  p_FromAccountID IN NUMBER,
  p_ToAccountID   IN NUMBER,
  p_Amount        IN NUMBER
) AS
  v_SourceBalance NUMBER;
BEGIN
  -- Get source account balance
  SELECT Balance INTO v_SourceBalance
  FROM ACCOUNTS
  WHERE AccountID = p_FromAccountID
  FOR UPDATE; -- Lock row for update

  IF v_SourceBalance < p_Amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
  END IF;

  -- Deduct from source
  UPDATE ACCOUNTS
  SET Balance = Balance - p_Amount
  WHERE AccountID = p_FromAccountID;

  -- Add to destination
  UPDATE ACCOUNTS
  SET Balance = Balance + p_Amount
  WHERE AccountID = p_ToAccountID;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Transferred ' || p_Amount || ' from account ' || p_FromAccountID || ' to account ' || p_ToAccountID);
END;
/

call TransferFunds (401,402,500);




