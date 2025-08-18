      *    Author     : Renato D. Mejilla
      *    Date       : August 11, 2025
      *    Description: A demo of converting upper-case words into 
      *                  lower-case.
      *    Tested     : Using GNUCobol
      
       identification division.
       program-id. EX004.

       environment division.
       data division.
       working-storage section.
       01  ws-user-input   pic x(20).
       01  ws-converted    pic x(20).

       procedure division.
           display "Enter an upper-case letter: " with no advancing.
           accept ws-user-input.

           move ws-user-input to ws-converted.

           inspect ws-converted
               converting 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
               to 'abcdefghijklmnopqrstuvwxyz'

           display "Converted: " ws-converted.    

           stop run.
