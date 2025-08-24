      *    Author      : Renato D. Mejilla 
      *    Date        : August 24, 2025
      *    Description : A demo of a COBOL program connecting to a
      *                  PostgreSQL Database and displaying all the 
      *                  records in the table.
      *    Compiler    : Micro Focus Visual COBOL
      *    ============================================================

       $set sql(dbman=odbc)
       identification division.
       program-id.     SQLconnect.

       data division.
       working-storage section.
       exec sql include sqlca end-exec.

       01  WS-ID        PIC 9(9).
       01  WS-USERNAME  PIC X(50).

       procedure division.
           display "Attempting connection to PostgreSQL...".

           exec sql
                connect to PG_ACMITS user 'postgres' using 
                                          '@F867eddf' 
           end-exec

           if sqlcode not = 0
              display "Connection failed. SQLCODE=" sqlcode
              display "SQLERRMC=" sqlerrmc
              stop run
           end-if

           display "Connected successfully to database acmits!".

           *> Declare a cursor for SELECT
           exec sql
                declare C1 cursor for
                select userid, username, firstname, lastname, active 
                       from userid
           end-exec

           *> Open the cursor
           exec sql
                open C1
           end-exec

           if sqlcode not = 0
              display "Failed to open cursor. SQLCODE=" sqlcode
              stop run
           end-if

           display "Fetching rows from userid table:".

           perform until sqlcode not = 0
              exec sql
                   fetch C1 into :WS-ID, :WS-USERNAME
              end-exec

              if sqlcode = 0
                 display "ID: " WS-ID "  Username: " WS-USERNAME
              end-if
           end-perform

           *> Close cursor
           exec sql
                close C1
           end-exec

           *> Disconnect
           exec sql
                disconnect current
           end-exec

           display "Disconnected from PostgreSQL.".

           stop run.

