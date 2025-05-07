CREATE DATABASE Library_Managementdb;

USE Library_Managementdb;

CREATE TABLE Books(
    bookid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    publication_year INT NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE
   
);

CREATE TABLE Members(
    memberid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    membership_date DATE NOT NULL
);

CREATE TABLE Branches(
    branchid INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL
);  

CREATE TABLE Staff(
    staffid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    position VARCHAR(50) NOT NULL,
    branchid INT NOT NULL,
    FOREIGN KEY (branchid) REFERENCES Branches(branchid)
);
CREATE TABLE Authors(
    authorid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    biography TEXT NOT NULL
);

CREATE TABLE Genres(
    genreid INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Book_Genres(
    bookid INT NOT NULL,
    genreid INT NOT NULL,
    PRIMARY KEY (bookid, genreid),
    FOREIGN KEY (bookid) REFERENCES Books(bookid),
    FOREIGN KEY (genreid) REFERENCES Genres(genreid)
);
CREATE TABLE Book_Authors(
    bookid INT NOT NULL,
    authorid INT NOT NULL,
    PRIMARY KEY (bookid, authorid),
    FOREIGN KEY (bookid) REFERENCES Books(bookid),
    FOREIGN KEY (authorid) REFERENCES Authors(authorid)
);

CREATE TABLE Reviews(
    reviewid INT PRIMARY KEY AUTO_INCREMENT,
    bookid INT NOT NULL,
    memberid INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT NOT NULL,
    review_date DATE NOT NULL,
    FOREIGN KEY (bookid) REFERENCES Books(bookid),
    FOREIGN KEY (memberid) REFERENCES Members(memberid)
);
    CREATE TABLE Transactions(
    transactionid INT PRIMARY KEY AUTO_INCREMENT,
    bookid INT NOT NULL,
    memberid INT NOT NULL,
    transaction_date DATE NOT NULL,
    return_date DATE,
    status enum('borrowed', 'returned') NOT NULL,
    FOREIGN KEY (bookid) REFERENCES Books(bookid),
    FOREIGN KEY (memberid) REFERENCES Members(memberid)
);

CREATE TABLE Fines(
    fineid INT PRIMARY KEY AUTO_INCREMENT,
    transactionid INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    paid BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (transactionid) REFERENCES Transactions(transactionid)
);

CREATE TABLE Events(
    eventid INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE Event_Attendees(
    eventid INT NOT NULL,
    memberid INT NOT NULL,
    PRIMARY KEY (eventid, memberid),
    FOREIGN KEY (eventid) REFERENCES Events(eventid),
    FOREIGN KEY (memberid) REFERENCES Members(memberid)
);
