      *    Author      : Renato D. Mejilla 
      *    Date        : August 24, 2025
      *    Description : A demo of User input that will save it to the 
      *                  table USERS and database ACMITS.
      *    ============================================================ 
      
       $set sql(dbman=odbc)
       identification division.
       program-id.     SQLUserInput.
       
       environment division.
       
       data division.
       working-storage section.

       01  ws-username     pic x(30).
       01  ws-sqlcode      pic s9(9) comp-5.

       exec sql include sqlca end-exec.
       
       procedure division.
           display "Attempting connection to PostgreSQL..."
           
      * /Connect to PostgreSQL database    
           exec sql
                connect to PG_ACMITS user 'postgres' using 
                                          '@F867eddf'                   
           end-exec

           move sqlcode to ws-sqlcode
           if ws-sqlcode not = 0
              display "Connection failed. SQLCODE=" ws-sqlcode
              stop run
           end-if
           
      * /COBOL code connected to PostgreSQL database.
           display "Connected successfully to database acmits!".
      
      * /Accept user input
           display "Enter Username: " with no advancing.
           accept ws-username.
           
      * /Save the records to USERS table  
           exec sql
                insert into users (username)
                values (:ws-username)
           end-exec

      * /Error will be displayed if INSERT is not successful.
           move sqlcode to ws-sqlcode
           if ws-sqlcode not = 0
              display "Insert failed. SQLCODE=" ws-sqlcode
              display sqlerrmc
           else
      
      * /Record is inserted successfully.        
              exec sql commit end-exec
              display "Record inserted successfully!"
           end-if
      
      * /Close the database connection.
         exec sql disconnect current end-exec
           display "Disconnected from PostgreSQL.".

           stop run.
