      *    Author:         Renato D. Mejilla
      *    Date:           August 5, 2025
      *    Description:    A demo of an ACCEPT statement with concatenation.

       IDENTIFICATION DIVISION.
       PROGRAM-ID.     ex001.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ws-name       PIC A(20).
       01  new-name      PIC A(20).
       01  trimmed-len   PIC 99.

       PROCEDURE DIVISION.
           DISPLAY "Enter your name: " WITH NO ADVANCING.
           ACCEPT ws-name.

           MOVE FUNCTION TRIM(ws-name TRAILING) TO new-name.
           COMPUTE trimmed-len = FUNCTION LENGTH(FUNCTION 
                   TRIM(ws-name TRAILING)).

           DISPLAY "Welcome ", new-name(1:trimmed-len), 
                   " to COBOL Development!".
           ACCEPT OMITTED.

           STOP RUN.

       
