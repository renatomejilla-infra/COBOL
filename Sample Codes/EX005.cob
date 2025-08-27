      *    Author      : Renato D. Mejilla
      *    Date        : August 27, 2025
      *    Desciption  : A demo of COBOL connecting to a POSTGRESQL DB
      *    *************************************************************
       
       $set sql(dbman=odbc)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTPG.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.

       01  WS-USER        PIC X(20) VALUE "postgres".
       01  WS-PASS        PIC X(20) VALUE "@F8****df".
       01  WS-DBNAME      PIC X(20) VALUE "acmits".
       01  WS-HOST        PIC X(50) VALUE "localhost".

       PROCEDURE DIVISION.
           DISPLAY "Attempting to connect to PostgreSQL...".

           EXEC SQL
                CONNECT :WS-USER IDENTIFIED BY :WS-PASS
                USING :WS-DBNAME
           END-EXEC.

           IF SQLCODE = 0
              DISPLAY "Connected successfully to database: " WS-DBNAME
           ELSE
              DISPLAY "Connection failed. SQLCODE=" SQLCODE
              DISPLAY "SQLERRMC=" SQLERRMC
           END-IF.

           EXEC SQL
                DISCONNECT ALL
           END-EXEC.

           STOP RUN.
