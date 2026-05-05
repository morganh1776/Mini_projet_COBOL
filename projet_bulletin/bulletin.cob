identification division.
program-id. Bulletin.
author. Morgan Huart
environment division.
configuration section.
special-names.
    decimal-point is comma.



data division.
working-storage section.

01 Information-eleve.
    05 ws-nom-eleve pic X(20) value space.
    05 ws-prenom-eleve pic X(20) value space.
    05 ws-numero-classe pic X(10) value space.

01 ws-matieres.
    05 ws-mathematique pic 9(2) value zeros.
    05 ws-francais pic 9(2) value zeros.
    05 ws-histoire pic 9(2) value zeros.
    05 ws-moyenne pic 9(2)V99 value zeros. 



01 ws-moy-lvl pic 9(2)V99 value zeros. 
    88 Echec value 0 thru 9,99.
    88 Passable value 10 thru 11,99.  
    88 Assez-bien value 12 thru 13,99.
    88 Bien value 14 thru 15,99.
    88 Tres-bien value 16 thru 20.
01 ws-mention pic X(20) value spaces.


procedure division.
    perform para-saisie.
    perform para-calculer.
    perform para-mention.
    perform para-afficher.
    stop run.

    para-saisie.
    display 'Demander nom de l élève  :'
    accept ws-nom-eleve.
    display 'Demander prénom de l élève  :'
    accept ws-prenom-eleve.
    display 'Demander numero de classe  :'
    accept ws-numero-classe.
    display 'Demander la note en maths (sur 20) :'
    accept ws-mathematique.
    display 'Demander la note en francais  (sur 20) :'
    accept ws-francais.
    display 'Demander la note en histoire  (sur 20) :'
    accept ws-histoire.

    para-calculer.
    compute ws-moyenne = (ws-mathematique + ws-francais + ws-histoire) / 3
    move ws-moyenne to ws-moy-lvl.

    para-mention.

    evaluate true
        when Echec 
            move 'Echec' to ws-mention
        when Passable 
            move 'Passable' to ws-mention
        when Assez-bien 
            move 'Assez-bien' to ws-mention
        when Bien 
            move 'Bien'  to ws-mention
        when Tres-bien
            move 'Tres-bien' to ws-mention
        when other 
            move 'Erreur' to ws-mention
    end-evaluate.

    para-afficher.

    display '===================================================='
    display '                     BULLETIN DE NOTE.              '
    display '===================================================='
    display 'Eleve    :  '  ws-nom-eleve ' ' ws-prenom-eleve
    display '----------------------------------------------------'
    display ' Maths     :  ' ws-mathematique '/20'.
    display ' Francais  :  ' ws-francais '/20'.
    display ' Histoire  :  ' ws-histoire '/20'.
    display '----------------------------------------------------'
    display 'Moyenne    :  ' ws-moyenne '/20'.
    display 'Mention    :'   ws-mention.
    display '===================================================='.
