**Projet developpement du jeu <b>TIC TAC TOE </b> en <strong>RUBY</strong>**<br>

Membre du **groupe 5:**

> 1- Freddy Harimanana                  |   https://github.com/Freddy-Harimanana 
> 2- Lafatra L Ramahefaharimamonjy      |   https://github.com/Lafatra351
> 3- Toky Raf                           |
> 4- Toiher Omar                        |
> 5- Randy rajaonarison                 |   
> 6- Freddy Michel                      |   https://github.com/freddymi1

Notre comporte un fichier **game.rb** qui se trouve dans le dossier **lib**.
Dans ce fichier, il y a **4 classes** dont
> **Board:** définit le plateau et les combinaisons gagnantes avec victoire
> **Boardcase** definit les cases de la tableau
> **Player** definit les noms des joueurs et sa couleur
> **Game** le morpion avec la classe Game qui retrace les étapes du jeu, les tours jusqu'à la fin du jeu, qui peut aboutir à une victoire ou une égalité.

## Fonctionnalite du programme
Pour lancer le jue, il faut ouvrir la terminal dans le dossier lib du projet. Ensuite, tapez la commande **ruby game.rb** et fait entrer.
Au premierem il demande le **nom** des 2 joueurs et en leurs donnants le symbole **X** et **O**.
Quand les noms des joueurs sont bien rentrer, la partie commence avec la **tour numero 1** jusque a la **tour numero 9**.
Pour jour, les 2 joueurs choisissent un nombre entre **1 a 9**
Si l'un parmis les 2 joueurs gagne la partie, le programme affichera une message

> ***Felicitation! **#{player.name.upcase.cyan}**, tu as gagné la partie!"***

Sinon, si le match est a egalite, le programme affichera une message

> ***Woz, egalite***

Et a la fin de chaque partie, le programme demande au utilisateur s'il veut rejouer ou quiter le jeur en affichant une message

> ***Voulez vous rejouer encore? [O/n]:***

Si la reponse est **o** ou **O**
Le programme relance le jeu depuis le debut

Si la reponse est **n** ou **N**
Le programme quitera le jeu en envoyant une message

> ***Fin de la partie! Bye...***