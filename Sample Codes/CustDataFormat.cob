      *    Author      : Renato D. Mejilla
      *    Date        : August 24, 2025
      *    Description : A demo of Customer Data Formatting
      
      *    1. Accept First Name, Last Name, and Birth Date (YYYYMMDD).
      *    2. Validate the date (basic check).
      *    3. Calculate Age.
      *    4. Display in format: LASTNAME, FIRSTNAME (Age: XX)
      *================================================================
       IDENTIFICATION DIVISION.
       PROGRAM-ID.     CustDataFormat.
       
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-FIRST-NAME      PIC X(20).
       01 WS-LAST-NAME       PIC X(20).
       01 WS-BIRTH-DATE      PIC 9(8).   *> Format: YYYYMMDD
       01 WS-BIRTH-YEAR      PIC 9(4).
       01 WS-BIRTH-MONTH     PIC 9(2).
       01 WS-BIRTH-DAY       PIC 9(2).

       01 WS-CURR-DATE.
          05 WS-CURR-YEAR    PIC 9(4).
          05 WS-CURR-MONTH   PIC 9(2).
          05 WS-CURR-DAY     PIC 9(2).

       01 WS-AGE             PIC 99.

       01 WS-DATE-STATUS     PIC X VALUE SPACE.

       PROCEDURE DIVISION.
           DISPLAY "<<< CUSTOMER DATA FORMATTING >>>".
           DISPLAY "--------------------------------".
           DISPLAY "Enter First Name           : " WITH NO ADVANCING.
           ACCEPT WS-FIRST-NAME.
           DISPLAY " ".

           DISPLAY "Enter Last Name            : " WITH NO ADVANCING.
           ACCEPT WS-LAST-NAME.
           DISPLAY " ".

           DISPLAY "Enter Birth Date (YYYYMMDD): " WITH NO ADVANCING.
           ACCEPT WS-BIRTH-DATE.

           *> Split birth date
           MOVE WS-BIRTH-DATE(1:4) TO WS-BIRTH-YEAR
           MOVE WS-BIRTH-DATE(5:2) TO WS-BIRTH-MONTH
           MOVE WS-BIRTH-DATE(7:2) TO WS-BIRTH-DAY

           *> Get system date
           ACCEPT WS-CURR-DATE FROM DATE YYYYMMDD

           *> Validate basic ranges
           IF WS-BIRTH-MONTH < 1 OR WS-BIRTH-MONTH > 12
              MOVE "E" TO WS-DATE-STATUS
           END-IF
           IF WS-BIRTH-DAY < 1 OR WS-BIRTH-DAY > 31
              MOVE "E" TO WS-DATE-STATUS
           END-IF

           IF WS-DATE-STATUS = "E"
              DISPLAY "Invalid Date Entered."
              STOP RUN
           END-IF

           *> Compute Age
           COMPUTE WS-AGE = WS-CURR-YEAR - WS-BIRTH-YEAR
           IF (WS-CURR-MONTH < WS-BIRTH-MONTH)
              OR ((WS-CURR-MONTH = WS-BIRTH-MONTH)
              AND (WS-CURR-DAY < WS-BIRTH-DAY))
              SUBTRACT 1 FROM WS-AGE
           END-IF

           *> One line output in required format
      *    DISPLAY FUNCTION TRIM(WS-LAST-NAME TRAILING) ", "
      *            FUNCTION TRIM(WS-FIRST-NAME TRAILING)
      *            " (Age: " WS-AGE ")"

          *> /Output formatting
           DISPLAY "OUTPUT FOR CUSTOMER DATA FORMATTING."
                                              LINE 10 COL 1.
           DISPLAY "------------------------------------"
                                              LINE 11 COL 1.
           DISPLAY "Last Name"                LINE 12 COL 1.
           DISPLAY "First Name"               LINE 12 COL 26.
           DISPLAY "Age"                      LINE 12 COL 52.
           DISPLAY "========================" LINE 13 COL 1.
           DISPLAY "========================" LINE 13 COL 26.
           DISPLAY "==="                      LINE 13 COL 52. 
           DISPLAY WS-LAST-NAME               LINE 14 COL 1.
           DISPLAY WS-FIRST-NAME              LINE 14 COL 26.
           DISPLAY WS-AGE                     LINE 14 COL 52.
           
           DISPLAY "Transaction completed!"   LINE 24 COL 1.
           DISPLAY " ".
           
           STOP RUN.
           