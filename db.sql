create database library;
use library;
create table student_registration(id int primary key auto_increment ,std_id VARCHAR(255), name varchar(300), email varchar(300),password varchar(255) , dept varchar(500), image longblob);
select * from student_registration;	


select * from  Books_details;
create table dept_books(book_id int primary key auto_increment, book_dept varchar(200),book_quantity int  );
create table Books_details(book_id int primary key auto_increment, book_name varchar(200), book_dept varchar(200),author_name varchar(200) );




DELIMITER $$
CREATE TRIGGER trg1
AFTER INSERT ON Books_details
FOR EACH ROW
BEGIN
  UPDATE dept_books
  SET book_quantity = book_quantity + 1
  WHERE book_dept = NEW.book_dept;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg2
AFTER DELETE ON Books_details
FOR EACH ROW
BEGIN
  -- Decrease book quantity if it is greater than 0
  UPDATE dept_books
  SET book_quantity = book_quantity - 1
  WHERE book_dept = OLD.book_dept;

  -- Delete the department if the quantity becomes 0
  DELETE FROM dept_books
  WHERE book_dept = OLD.book_dept AND book_quantity <= 0;
END$$
DELIMITER ;


select * from Books_details;	
select * from dept_books;


create table admin(id int primary key auto_increment, username varchar(200), password varchar(200));
select * from admin;



create table purchase(id int primary key auto_increment , student_name varchar(300),book_name varchar(300),submit varchar(200) , book_purchase varchar(200) default "Purchase");
select * from purchase;	


