identification division.
program-id. RELEVE-BANCAIRE.
author. Morgan HUART.

environment division.
input-output section. 
file-control.
       select fichier-trans assign to "transaction.dat"
           organization is line sequential.


data division.
file section.
FD fichier-trans.
01 reg-trans.
       05 trans-nom pic x(10).
       05 trans-montant pic 9(5).
       05 trans-type pic X.


working-storage section.

01 ws-EOF pic X value 'N'.
01 ws-solde pic s9(7) value 0.
01 ws-solde-disp pic -(6)9.


procedure division.
0000-Main.
       perform 1000-ouvrir-fichier
       perform 2000-traiter-fichier until ws-EOF= 'Y'
       perform 3000-afficher-bilan
       stop run. 


1000-ouvrir-fichier.
       open input fichier-trans.

2000-traiter-fichier.
       read fichier-trans
           at end
               move 'Y' to ws-EOF
           not at end
               perform 2100-calculer-solde
       end-read.
 
 2100-calculer-solde.
     evaluate trans-type
        when '+'
           add trans-montant to ws-solde
           display "Depot :" trans-nom "+" trans-montant
        when '-'
           subtract trans-montant from ws-solde 
           display "Retrait: " trans-nom "-" trans-montant
        when other
           display "Type invalide pour:  " trans-nom
     end-evaluate.




3000-afficher-bilan.
       close fichier-trans.
       move ws-solde to ws-solde-disp
       display "---------------------------------------------"
       display "Solde final total:" ws-solde-disp.
       