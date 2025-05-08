# Library Management System

A comprehensive database system for managing libraries, including books, members, staff, transactions, and events.

## Overview

This Library Management System provides a robust relational database structure for libraries to manage their collections, members, staff, and daily operations. It's designed to handle various library management tasks such as book cataloging, membership management, transaction tracking, event planning, and fine collection.

## Database Structure

The system consists of several interconnected tables that store different aspects of library data:

### Core Tables
- **Books**: Stores information about books in the library collection
- **Members**: Contains details about library users
- **Branches**: Records information about different library locations
- **Staff**: Keeps track of library employees
- **Transactions**: Records book borrowing and returns

### Supporting Tables
- **Authors**: Information about book authors
- **Genres**: List of book genres
- **Book_Authors**: Many-to-many relationship between books and authors
- **Book_Genres**: Many-to-many relationship between books and genres
- **Reviews**: Member reviews and ratings for books
- **Fines**: Records of fines for late returns or damaged books
- **Events**: Information about library events and programs
- **Event_Attendees**: Many-to-many relationship between events and members

## Entity Relationship Diagram


![ERD_Lib](https://github.com/user-attachments/assets/ed26d837-8119-4eb6-ac0f-17a60d0ecc67)





## Installation

### Prerequisites
- MySQL Server (5.7+)
- MySQL Client or MySQL Workbench

### Setup Instructions

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/library-management-system.git
   cd library-management-system
   ```

2. Connect to your MySQL server:
   ```
   mysql -u your_username -p
   ```

3. Execute the SQL script:

   library.sql


## Usage

After setting up the database, you can:

1. Connect to it from any MySQL client:
   ```
   mysql -u your_username -p Library_Managementdb
   ```

2. Run queries to interact with the data:
   ```sql
   -- List all books
   SELECT * FROM Books;
   
   -- Find overdue books
   SELECT b.title, m.name, t.transaction_date 
   FROM Transactions t
   JOIN Books b ON t.bookid = b.bookid
   JOIN Members m ON t.memberid = m.memberid
   WHERE t.status = 'borrowed' AND t.return_date < CURDATE();
   ```

## Features

- **Book Management**: Catalog books with details including title, author, genre, publication year, and ISBN
- **Member Management**: Register and track library members
- **Branch Management**: Handle multiple library locations
- **Staff Management**: Keep records of library employees
- **Transaction Tracking**: Record book borrowing and returns
- **Review System**: Allow members to leave ratings and reviews for books
- **Fine Management**: Track and manage fines for late returns or damaged books
- **Event Planning**: Create and manage library events and track attendees

## Schema Details

### Books Table
- `bookid`: Unique identifier for each book (auto-increment)
- `title`: Book title
- `author`: Book author
- `genre`: Book genre
- `publication_year`: Year the book was published
- `isbn`: International Standard Book Number (unique)

### Members Table
- `memberid`: Unique identifier for each member (auto-increment)
- `name`: Member's full name
- `email`: Member's email address (unique)
- `phone`: Member's phone number
- `address`: Member's physical address
- `membership_date`: Date when the member joined the library

### Transactions Table
- `transactionid`: Unique identifier for each transaction (auto-increment)
- `bookid`: Reference to the borrowed book
- `memberid`: Reference to the member who borrowed the book
- `transaction_date`: Date of the transaction
- `return_date`: Expected return date
- `status`: Current status ('borrowed' or 'returned')
<table>
   <tbody>
      <tr>

<td align="center">
        <a href="https://github.com/priscillanzula">
          <img src="https://avatars.githubusercontent.com/u/144167777?v=4" width="100;" alt="priscillanzula"/>
          <br />
          <sub><b>Priscilla Nzula</b></sub>
        </a>
      </td>
    </tr>
  </tbody>
</table>
