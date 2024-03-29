       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAESAR.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 INP PIC X(45) VALUE "ATTACK AT ONCE".
       01 SHIFT PIC 99 VALUE 4.
       01 OUT PIC X(45).
       01 LEN PIC 999.
       01 TMP1 PIC 999.
       01 TMP2 PIC 999.
       01 I PIC 999.
       01 S PIC 999.
       01 TMPSHIFT PIC 99.
           
       PROCEDURE DIVISION.
           
           MOVE FUNCTION UPPER-CASE(INP) TO INP.
           
           PERFORM ENCRYPT.
           
           DISPLAY FUNCTION TRIM(OUT).

           MOVE OUT TO INP.

           PERFORM DECRYPT.

           DISPLAY FUNCTION TRIM(OUT).

           MOVE 'abcdeFGHIJKLmnopqrstuvwxyz ,?;{[()]}' TO INP.
           MOVE FUNCTION UPPER-CASE(INP) TO INP.

           PERFORM SOLVE.

           STOP RUN.
		   
		   ENCRYPT.		   
           MOVE FUNCTION LENGTH(INP) TO LEN

		   PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE FUNCTION ORD(INP(I:1)) TO TMP1
               IF TMP1 > 65 AND TMP1 < 92
                   MOVE FUNCTION MOD(TMP1 - 66 + SHIFT, 26) TO TMP2
		           MOVE FUNCTION CHAR(TMP2 + 66) TO OUT(I:1)
               ELSE
                   MOVE INP(I:1) TO OUT(I:1)
		   END-PERFORM.
		   
		   DECRYPT.		   
           MOVE FUNCTION LENGTH(INP) TO LEN

		   PERFORM VARYING I FROM 1 BY 1 UNTIL I > LEN
               MOVE FUNCTION ORD(INP(I:1)) TO TMP1
               IF TMP1 > 65 AND TMP1 < 92
                   MOVE FUNCTION MOD(TMP1 - 66 - SHIFT, 26) TO TMP2
		           MOVE FUNCTION CHAR(TMP2 + 66) TO OUT(I:1)
               ELSE
                   MOVE INP(I:1) TO OUT(I:1)
		   END-PERFORM.
		   		  
		   SOLVE.
		   DISPLAY "SOLVING...".
           MOVE SHIFT TO TMPSHIFT.
           PERFORM VARYING S FROM 1 BY 1 UNTIL S > 26
               MOVE S TO SHIFT
               PERFORM DECRYPT
               DISPLAY "SHIFT " SHIFT " " FUNCTION TRIM(OUT)
           END-PERFORM.
		   MOVE TMPSHIFT TO SHIFT.
		   
