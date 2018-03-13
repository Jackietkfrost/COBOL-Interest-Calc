      *identification division.
      *program-id. Program1.
      *
      *environment division.
      *
      *
      *data division.
      *working-storage section.
      *
      *procedure division.
      *
      *    goback.
      *
      *end program Program1.
       IDENTIFICATION DIVISION.
       program-id. Program1.
      **********************************
      *NAME:       ALEK MARCANO MORALES*
      *STUDENT ID: S00928916           *
      *CLASS:      COSC 235            *
      *PROFESSOR:  PEDRO MALDONADO     *
      **********************************
       data division.
       working-storage section.
       01  USER-SELECTION  PIC X VALUE SPACE.
       01  DUMMY           PIC X.
       01  LOAN-AMT-IN     PIC 9(8).
       01  LOAN-PERCENT-IN PIC 9(3).
       01  LOAN-YEARS-IN   PIC 99.

      ****************************************************************************************************
      * INTERACTIVE MENU FOR USER. SCREEN DISPLAYS AVAILABLE OPTIONS, AND ACCEPTS INPUT OF SAID OPTIONS. *
      ****************************************************************************************************
       SCREEN SECTION.
       01  MAIN-MENU
           BLANK SCREEN.
           05  LINE 3  COLUMN 25   VALUE   "**************************".
           05  LINE 4  COLUMN 25   VALUE   "*        Main Menu       *".
           05  LINE 5  COLUMN 25   VALUE   "* Simple Interest Payment*".
           05  LINE 6  COLUMN 25   VALUE   "*        Calculator      *".
           05  LINE 7  COLUMN 25   VALUE   "**************************".
           05  LINE 9  COLUMN 25   VALUE   "1. Data edit/entry".
           05  LINE 10 COLUMN 25   VALUE   "2. Calculate/Display results".
           05  LINE 11 COLUMN 25   VALUE   "3. Clear Data".
           05  LINE 12 COLUMN 25   VALUE   "4. Exit".
           05  LINE 14 COLUMN 10   VALUE   "Enter the respective number for your operation (1-4): ".
      --                                                              
           05  PIC 9 USING USER-SELECTION.

       01 ERROR-SCREEN
           BLANK SCREEN.
           05  LINE 5  COLUMN 10   VALUE "Only values 1 thru 4 are accepted as a correct response.".

       01 ENTER-DATA-SCREEN
           BLANK SCREEN.
      *    05  LINE 3  COLUMN 15   VALUE   "Enter loan amount. (Min $500 - Max $1,000,000): ".
      *    05  PIC 9(8)    USING LOAN-AMT-IN.
      *    05  LINE 4  COLUMN 20   VALUE   "Enter the annual percentage: ".
      *    05  PIC 9(3)    USING LOAN-PERCENT-IN.
      *    05  LINE 5  COLUMN 3    VALUE   "Finally, please enter the years of the loan. (Min 1 yrs. - Max 30 yrs.)".
      *    05  PIC 99      USING LOAN-YEARS-IN.


       PROCEDURE DIVISION.
           100-MAIN-MODULE.
           PERFORM UNTIL USER-SELECTION = 4
               DISPLAY MAIN-MENU
               ACCEPT MAIN-MENU
               EVALUATE USER-SELECTION
                   WHEN 1  PERFORM 200-ENTER-DATA
                   WHEN 2  PERFORM 300-READ-FILE
                   WHEN 3  PERFORM 400-INPUT-CLEAR
      *            WHEN 4  PERFORM 500-EXIT
                   WHEN OTHER
                       DISPLAY ERROR-SCREEN
                       PERFORM 600-DUMMY-PAUSE


               END-EVALUATE
           END-PERFORM
           ACCEPT DUMMY.

           200-ENTER-DATA.
           DISPLAY ENTER-DATA-SCREEN
           DISPLAY "Enter loan amount. (Min 500 - Max 1,000,000): "
           ACCEPT LOAN-AMT-IN
           IF LOAN-AMT-IN < 500
               DISPLAY "INVALID AMOUNT. PLEASE ENTER A VALUE BETWEEN 500, AND 1,000,000."
               DISPLAY "Press enter to continue..."
               ACCEPT DUMMY
               PERFORM 200-ENTER-DATA

           ELSE IF LOAN-AMT-IN > 1000000
              DISPLAY "INVALID AMOUNT. PLEASE ENTER A VALUE BETWEEN 500, AND 1,000,000."
              DISPLAY "Press enter to continue..."
              ACCEPT DUMMY
              PERFORM 200-ENTER-DATA
           END-IF
           END-IF
           DISPLAY "Enter Annual Percentage of the loan: "
           ACCEPT LOAN-PERCENT-IN
           IF LOAN-AMT-IN < 1
               DISPLAY "INVALID AMOUNT. PERCENTAGE CAN ONLY BE POSITIVE."
               DISPLAY "Press enter to continue..."
               ACCEPT DUMMY
               PERFORM 200-ENTER-DATA
           END-IF
           DISPLAY "How many years will the loan last? (Min. 1 yr. - Max 30 yrs.)"
           ACCEPT LOAN-YEARS-IN
           PERFORM 600-DUMMY-PAUSE
           GOBACK.
       
           300-READ-FILE.
           DISPLAY "ENTER DATA: ".
         
           400-INPUT-CLEAR.
           DISPLAY ENTER-DATA-SCREEN
           MOVE 0 TO LOAN-AMT-IN
           MOVE 0 TO LOAN-YEARS-IN
           MOVE 0 TO LOAN-PERCENT-IN
           DISPLAY "USER DATA HAS BEEN ERASED"
           PERFORM 600-DUMMY-PAUSE.

           500-EXIT.

           600-DUMMY-PAUSE.
           ACCEPT DUMMY.
           GOBACK.
           STOP RUN.
           
       end program Program1.
