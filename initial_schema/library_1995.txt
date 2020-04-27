--Name: Sumukha MK, 4I
--DBMS: MySQL
CREATE DATABASE library_final;
USE library_final;


CREATE TABLE Publisher (
Name Varchar(200) PRIMARY KEY,
Address Varchar(400),
Phone Decimal(20)
);

CREATE TABLE Library_Branch (
Branch_id Char(10) PRIMARY KEY,
Branch_name Varchar(200) NOT NULL,
Address Varchar(400)
);

CREATE TABLE Borrower (
Card_no Int PRIMARY KEY,
Name Varchar(200) NOT NULL,
Address Varchar(400),
Phone Decimal(20)
);


CREATE TABLE Book (
Book_id Int PRIMARY KEY,
Title Varchar(200),
Publisher_name Varchar(200),
FOREIGN KEY (Publisher_name) REFERENCES Publisher(Name)
ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Book_Authors (
Book_id Int NOT NULL,
Author_name Varchar(200) NOT NULL,
PRIMARY KEY (Book_id, Author_name),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Book_Copies (
Book_id Int NOT NULL,
Branch_id Char(10) NOT NULL,
No_of_copies Int DEFAULT 1,
PRIMARY KEY (Book_id, Branch_id),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Branch_id) REFERENCES Library_Branch(Branch_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Book_Loans (
Book_id Int NOT NULL,
Branch_id Char(10) NOT NULL,
Card_no Int NOT NULL,
Date_out Date,
Due_date Date,
PRIMARY KEY (Book_id, Branch_id, Card_no),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (Branch_id) REFERENCES Library_Branch(Branch_id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (Card_no) REFERENCES Borrower(Card_no)
ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO Publisher(Name,Address,Phone)
VALUES ("Cengage_Learning","New Delhi","0806545"),
       ("McGraw-Hill","Bengaluru","0809765"),
      ("Pearson","Kerala","0809721"),
      ("Wiley","Hyderabad","0806543"),
("Macmillan","Los Angeles","8894236"),
("Bloomsbury","United Kingdom","3578900");



INSERT INTO Library_branch(Branch_id,Branch_name,Address) 
VALUES("65212","JP Nagar","near BDA"),
("66565","Vijayanagar","near govt school"),
("66787","Hoskerehalli","near PESU"),
("65422","Hebbal","near BIA"),
("62443","Shivajinagar","near cubbon park"),
("65757","Central","near UVCE");

INSERT INTO Borrower(Card_no,Name,Address,Phone)
VALUES ("1995","Sumukha MK","Lalbagh Siddapura","8050530770"),
        ("1920","Abhishek","Hebbal","8928736461"),
("2432","Gopal","Hoskerehalli ,Bsk","9898787682"),
("2017","Manish","Banashankari 3rd stage","9908976322"),
("1926","Rahul","Jayanagar 1st block","9089763221"),
("2788","Srujan","Peenya industrial area","897865432"),
("2898","Sagar","JP nagar","8876788779");
INSERT INTO Book(Book_id,Title,Publisher_name)
VALUES ("144","Fundamentals of DBMS","Pearson"),
        ("165","War and Peace","Macmillan"),
        ("198","Theory of Computation","Wiley"),
        ("345","Harry Potter","Bloomsbury"),
        ("123","Data Structures","McGraw-Hill"),
          ("445","Linear Algebra","Cengage_Learning"),
            ("378","Algorithm","Macmillan"),
              ("305","Digital design","Wiley");

INSERT INTO Book_Copies(Book_id,Branch_id,No_of_copies)
VALUES ("345","65757","10"),
        ("144","65212","12"),
            ("165","66565","18"),
             ("165","65212","16"),
            ("198","66787","16"),
            ("123","66565","15"),
            ("445","65422","11"),
            ("378","62443","14"),
            ("305","66787","8"),
            ("345","66565","9");          
INSERT INTO Book_Authors(Book_id,Author_name)
VALUES ("378","Channa Bankapur"),
("144","Raghu BA Rao"),
("198","Kavi Mahesh"),
("345","J.K. Rowling"),
("165","Mandela"),
("445","RP Umashankar"),
("123","Algor"),
("305","Henry patterson");
            

INSERT INTO Book_Loans(Book_id,Branch_id,Card_no,Date_out,Due_date)
VALUES ("144","66565","2017","2020-04-01","2020-04-27"),
("165","65212","2788","2020-03-03","2020-04-28"),
("198","65757","2432","2020-03-06","2020-04-29"),
("345","65422","1995","2020-03-19","2020-04-30"),
("123","65757","1926","2020-02-07","2020-03-02"),
("445","65757","1926","2020-02-18","2020-03-02"),
("378","65422","1995","2020-02-23","2020-03-02"),
("305","65757","2432","2020-02-14","2020-03-02"),
("123","65422","1995","2020-02-10","2020-03-02"),
("305","65422","1995","2019-03-17","2019-04-20"),
("144","65422","1995","2019-03-17","2019-04-20"),
("165","65422","1995","2019-03-17","2019-04-20");

