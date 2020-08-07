**Projet developpement du jeu <b>TIC TAC TOE </b> en <strong>RUBY</strong>**<br>

Membre du **groupe 5:**

```mermaid
1- Freddy Harimanana                  |   https://github.com/Freddy-Harimanana 
2- Lafatra L Ramahefaharimamonjy      |   https://github.com/Lafatra351
3- Toky Raf                           |   https://github.com/toky007
4- Toiher Omar                        |   https://github.com/omar-4
5- Randy rajaonarison                 |   https://github.com/Randyraja
6- Freddy Michel                      |   https://github.com/freddymi1
```
Notre comporte un fichier **game.rb** qui se trouve dans le dossier **lib**.
Dans ce fichier, il y a **4 classes** dont
> **Board:** définit le plateau et les combinaisons gagnantes avec victoire.<br>
> **Boardcase** definit les cases de la tableau.<br>
> **Player** definit les noms des joueurs et sa couleur.<br>
> **Game** le morpion avec la classe Game qui retrace les étapes du jeu, les tours jusqu'à la fin du jeu, qui peut aboutir à une victoire ou une égalité.<br>

## Fonctionnalité du programme
Pour lancer le jeu, il faut ouvrir le terminal dans le dossier lib du projet. Ensuite, tapez la commande **ruby game.rb** et fait entrer.
En commencant, il demande le **nom** des 2 joueurs et en leurs donnants le symbole **X** pour le joueur numero 1 et **O** pour le joueur numero 2.
Quand les noms des joueurs sont bien rentrer, la partie commence avec la **tour numero 1** jusque a la **tour numero 9**.

## Regle du jeu
Il y a un gagnant si l'un parmis des ces conditions sont vraie ou la combinaison des ces chiffres dans le tableau sont vraie:

**Condition Gagnant**
```mermaid
1- case_1 = @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != "1" && @board[1] != "2" && @board[2] != "3" ***#victoire à l'horizontal***
2- case_2 = @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != "4" && @board[4] != "5" && @board[5] != "6" ***#victoire à l'horizontal***
3- case_3 = @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != "7" && @board[7] != "8" && @board[8] != "9" ***#victoire à l'horizontal***
4- case_4 = @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != "1" && @board[3] != "4" && @board[6] != "7" ***#victoire à la verticale***
5- case_5 = @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != "3" && @board[5] != "6" && @board[8] != "9" ***#victoire à la verticale***
6- case_6 = @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != "1" && @board[4] != "5" && @board[8] != "9" ***#victoire à la verticale***
7- case_7 = @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != "3" && @board[4] != "5" && @board[6] != "7" ***#victoire en diagonale***
8- case_8 = @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != "2" && @board[4] != "5" && @board[7] != "8" ***#victoire en diagonale***
```
**Condition match null**
> Si le score n'est pas parmis ces condition, alors, il n'y a pas de gagnant, donc, match null.

Pour jour, les 2 joueurs choisissent un nombre entre **1 a 9**
Si l'un parmis les 2 joueurs gagne la partie, le programme affichera une message

> ***Felicitation! **#{player.name.upcase.cyan}**, tu as gagné la partie!"***

Sinon, si le match est a egalite, le programme affichera une message

> ***Woz, egalite***

Et a la fin de chaque partie, le programme demande au utilisateur s'il veut rejouer ou quiter le jeur en affichant une message:

> ***Voulez vous rejouer encore? [O/n]:***

Si la reponse est **o** ou **O**
Le programme relance le jeu depuis le debut

Si la reponse est **n** ou **N**
Le programme quitera le jeu en envoyant une message:

> ***Fin de la partie! Bye...***

Ou si l'utilisateur appuis sur les autres touches, le programme renvoie le message:

> ***Annulation...***

Et le boucle sortira du programme.