CREATE TABLE "CUSTOMERS" 
   (	"CUSTOMERID" NUMBER, 
	"NAME" VARCHAR2(50), 
	"AGE" NUMBER, 
	"BALANCE" NUMBER, 
	"ISVIP" VARCHAR2(5) DEFAULT 'FALSE' -- 'TRUE' or 'FALSE', 
	 PRIMARY KEY ("CUSTOMERID"));

	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (1, 'Alice Johnson', 45, 12000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (2, 'Bob Smith', 62, 8000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (3, 'Charlie Brown', 70, 15000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (4, 'Diana Prince', 55, 9500, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (5, 'Ethan Hunt', 68, 7000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (6, 'Fiona Gallagher', 30, 3000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (7, 'George Miller', 75, 20000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (8, 'Hannah Lee', 50, 6000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (9, 'Ian Wright', 65, 11000, 'N');
	INSERT INTO CUSTOMERS (CustomerID, Name, Age, Balance, IsVIP) VALUES (10, 'Judy Hopps', 58, 5000, 'N');

	COMMIT;


CREATE TABLE "LOANS" 
   (	"LOANID" NUMBER, 
	"CUSTOMERID" NUMBER, 
	"DUEDATE" DATE, 
	"INTERESTRATE" NUMBER, 
	 PRIMARY KEY ("LOANID"));
	 
	 INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (101, 1, SYSDATE + 15, 8.5);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (102, 2, SYSDATE + 25, 9.0);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (103, 3, SYSDATE + 45, 7.5);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (104, 4, SYSDATE + 5, 8.0);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (105, 5, SYSDATE + 10, 9.2);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (106, 6, SYSDATE + 60, 8.3);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (107, 7, SYSDATE + 20, 7.8);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (108, 8, SYSDATE + 90, 9.5);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (109, 9, SYSDATE + 18, 8.1);
	INSERT INTO LOANS (LoanID, CustomerID, DueDate, InterestRate) VALUES (110, 10, SYSDATE + 27, 8.9);

	COMMIT;

--Senario 1

DECLARE
  CURSOR c_loans IS
    SELECT l.LoanID, l.InterestRate
    FROM LOANS l
    JOIN CUSTOMERS c ON l.CustomerID = c.CustomerID
    WHERE c.Age > 60;

BEGIN
  FOR rec IN c_loans LOOP
    UPDATE LOANS
    SET InterestRate = InterestRate - 1
    WHERE LoanID = rec.LoanID;
  END LOOP;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Interest rate discounts applied to loans for customers over 60.');
END;
/


--Senaro 2

DECLARE
  CURSOR c_customers IS
    SELECT CustomerID
    FROM CUSTOMERS
    WHERE Balance > 10000;

BEGIN
  FOR rec IN c_customers LOOP
    UPDATE CUSTOMERS
    SET IsVIP = 'Y'
    WHERE CustomerID = rec.CustomerID;
  END LOOP;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('VIP status updated for eligible customers.');
END;
/

--Senario 3

DECLARE
  CURSOR c_due_loans IS
    SELECT l.LoanID, c.Name, l.DueDate
    FROM LOANS l
    JOIN CUSTOMERS c ON l.CustomerID = c.CustomerID
    WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;

BEGIN
  FOR rec IN c_due_loans LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || rec.LoanID ||
                         ' for customer ' || rec.Name ||
                         ' is due on ' || TO_CHAR(rec.DueDate, 'DD-MON-YYYY') || '.');
  END LOOP;
END;
/
