identification division.
program-id. FICHE-PRESENTATION.
author. MORGAN HUART.

data division.
working-storage section.
01 WS-USER.
       05 WS-NOM pic x(20).
       05 WS-PRENOM pic x(20).
       05 WS-AGE pic 9(2) value zeros.
           88 WS-MAJEUR value 18 thru 99.
           88 WS-MINEUR value 0 thru 17.
       05 WS-VILLE pic x(30).
       05 WS-METIER pic x(30).
       77 WS-DATE pic 9(8).
       77 WS-MSG pic x(8).

procedure division. 
PARA-PRINCIPALE.
    move function current-date (1:8) to WS-DATE.
    perform PARA-SAISIE.
    perform PARA-TRAITEMENT.
    perform PARA-AFFICHAGE.
    stop run.



PARA-SAISIE.
    display 'entrez votre prénom: '.
    accept WS-PRENOM.
    display 'entrez votre nom: '.
    accept WS-NOM.
    display 'entrez votre âge: '.
    accept WS-AGE.
    display 'entrez votre ville: '.
    accept WS-VILLE.
    display 'entrez votre métier: '.
    accept WS-METIER.

PARA-TRAITEMENT.
    if WS-MAJEUR
        move 'majeur' to WS-MSG
    else
        move 'mineur' to WS-MSG
    end-if.

PARA-AFFICHAGE.
    display '================================'.
    display 'FICHE DE PRESENTATION'.
    display '================================'.
    display 'Nom complet : ' function trim(WS-PRENOM) ' ' function trim(WS-NOM).
    display 'Âge : ' WS-AGE ' ans [' function trim(WS-MSG) ']'.
    display 'Ville : ' WS-VILLE.
    display 'Métier : ' WS-METIER.
    display 'Date de saisie: ' WS-DATE.
    display '================================'.


