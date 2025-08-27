      *    Author      : Renato D. Mejilla
      *    Date        : August 27, 2025
      *    Description : Looping with IF ELSE
      *    Compiler    : Micro Focus Visual Cobol
      *    *************************************************************
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CBLIFELSE.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ws-num          pic 99.
       01  ws-check        pic 99 value 85.

       PROCEDURE DIVISION.
       main-loop. 
           display " ".
           display "Enter a number (0 to exit): " with no advancing.
           accept ws-num.
           
           if ws-num = 0
               display "Exiting program..."
               display " "
               stop run
           else
               if ws-num = ws-check
                   perform 01-correct
               else
                   perform 02-wrong
               end-if
           end-if.
           go to main-loop.
           
       01-correct.
           display "Excellent, you got the correct number!".
           
       02-wrong.
           display "Sorry, try another number.".
           