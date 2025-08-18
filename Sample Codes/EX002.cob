      *    Author     : Renato D. Mejilla
      *    Date       : August 6, 2025
      *    Description: A demo of calling another program.

       identification division.
       program-id.     ex002.

       environment division.
       data division.
       working-storage section.

       screen section.
       01 ws-clear-screen.
           05 blank screen.
           
       procedure division.
           display ws-clear-screen.
           display "Calling another COBOL program.."   line 1 col 1.
           display "I am from COBOL 1 program."        line 3 col 1.
           display "Let's connect to EX003."           line 4 col 1.
           
           call 'ex003'.
           
           display "Successfully return to main program!" line 6 col 1.

           stop run.

