IDENTIFICATION DIVISION. 
PROGRAM-ID. CALCULATRICE-2.
AUTHOR. HUART MORGAN.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION. 
SPECIAL-NAMES. 
    DECIMAL-POINT IS COMMA.

DATA DIVISION.
WORKING-STORAGE SECTION.

77 WS-NUMBER1 PIC S9(7)V99 VALUE 0. 
77 WS-NUMBER2 PIC S9(7)V99 VALUE 0.

77 WS-OPERATION PIC X(1) VALUE SPACE.
77 WS-RESULT PIC S9(10)V99 VALUE 0.

01 WS-BOUCLE PIC X.
    88 WS-BOUCLE-OUI VALUE 'O'.
    88 WS-BOUCLE-NON VALUE 'N'.

77 WS-NUMBER1-F         PIC -ZZZ.ZZZ.ZZ9,99.
77 WS-NUMBER2-F         PIC -ZZZ.ZZZ.ZZ9,99.
77 WS-RESULT-F          PIC -ZZZ.ZZZ.ZZ9,99.




PROCEDURE DIVISION.
    PERFORM UNTIL WS-BOUCLE-NON
        PERFORM PARA-SAISIE
        PERFORM PARA-TRAITEMENT
        PERFORM PARA-AFFICHAGE
        PERFORM PARA-BOUCLE
    END-PERFORM.
    DISPLAY 'Au revoir !'.
    STOP RUN. 


    PARA-SAISIE.
        DISPLAY '=============================='.
        DISPLAY '  CALCULATRICE COBOL'.
        DISPLAY '=============================='.
        DISPLAY 'Entrez le premier nombre : '. 
        ACCEPT WS-NUMBER1.
        DISPLAY 'Entrez le second nombre : '.
        ACCEPT WS-NUMBER2.
        DISPLAY 'Entrez un opérateur (+, -, *, /): '.
        ACCEPT WS-OPERATION.

    PARA-TRAITEMENT.
        EVALUATE WS-OPERATION
            WHEN '+'
                COMPUTE WS-RESULT ROUNDED = WS-NUMBER1 + WS-NUMBER2
                    ON SIZE ERROR 
                        DISPLAY 'Erreur: Dépassement de la capacité lors du calcul.'
                END-COMPUTE
            WHEN '-'
                COMPUTE WS-RESULT ROUNDED = WS-NUMBER1 - WS-NUMBER2
                    ON SIZE ERROR 
                        DISPLAY 'Erreur: Dépassement de la capacité lors de la soustraction.'
                END-COMPUTE
            WHEN '*'
                COMPUTE WS-RESULT ROUNDED = WS-NUMBER1 * WS-NUMBER2
                    ON SIZE ERROR 
                        DISPLAY 'Erreur: Dépassement de la capacité lors de la multiplication.'
                END-COMPUTE
            WHEN '/'
                IF WS-NUMBER2 = 0
                    DISPLAY 'Erreur: Division par zéro.'
                ELSE 
                    COMPUTE WS-RESULT ROUNDED = WS-NUMBER1 / WS-NUMBER2
                        ON SIZE ERROR 
                            DISPLAY 'Erreur: Dépassement de la capacité lors de la division.'
                    END-COMPUTE
                END-IF
            WHEN OTHER
                DISPLAY 'Erreur: Opération non reconnue.'
        END-EVALUATE.

    PARA-AFFICHAGE.
        MOVE WS-NUMBER1 TO WS-NUMBER1-F.
        MOVE WS-NUMBER2 TO WS-NUMBER2-F.
        MOVE WS-RESULT TO WS-RESULT-F.


        DISPLAY '----RÉSULTAT----'.
        DISPLAY WS-NUMBER1-F ' ' WS-OPERATION ' ' WS-NUMBER2-F ' = ' WS-RESULT-F.
        DISPLAY '-----------------'.
    
    PARA-BOUCLE. 
        DISPLAY 'NOUVEAU CALCUL ? (O/N) : '.
        ACCEPT WS-BOUCLE.
