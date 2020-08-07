require 'pry'
require 'colorize' #gem qui permet de colorer

puts "\t\t\t=============================   ".cyan   
puts "\t\t\t|                           |		".cyan
puts "\t\t\t|       TicTacToe game      |		".cyan
puts "\t\t\t|                           |		".cyan
puts "\t\t\t=============================		".cyan


puts "\t\t\t\t X | O  | O ".cyan
puts "\t\t\t\t------------".cyan
puts "\t\t\t\t 0 | X  | X ".cyan
puts "\t\t\t\t----------- ".cyan
puts "\t\t\t\t X | O  | X ".cyan
puts "\n"
#Debut du Board class
class Board
  
  attr_accessor :board

  def initialize #Les neufs cases avec les valeurs 1 à 9 pour éviter de taper 0 comme dans l'array
    @board =  [*1..9].map { |i|  BoardCase.new(i).case_number }
  end

  def display_board #L'array du plateau de morpion
    puts "\t\t\t#{@board[0..2].join("  |  ")}"
    puts "\t\t\t---|-----|---"
    puts "\t\t\t#{@board[3..5].join("  |  ")}"
    puts "\t\t\t---|-----|---"
    puts "\t\t\t#{@board[6..8].join("  |  ")}"
  end

  def play(array) #Cela va définir des arrays où il faudra nécessairement rentrer un chiffre entre 1 et 9. Et va substituer les chiffres d'origine par les X et les O.
    if @board[array[2]] == 1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9
      if array[1] == "X"
      @board[array[2]] = "X".blue #permet d'avoir les X colorés en blue grâce à la gem colorize
      else
      @board[array[2]] = "O".green #permet d'avoir les X colorés en vert grâce à la gem colorize
      end
    end
  end

  def victoire #Tout ce qu'on a défini en turn doit s'exécuter jusqu'à qu'une des solutions suivantes se présente.
    case_1 = @board[0] == @board[1] && @board[0] == @board[2] && 
              @board[0] != "1" && @board[1] != "2" && @board[2] != "3" #victoire à l'horizontal
    case_2 = @board[3] == @board[4] && @board[3] == @board[5] && 
              @board[3] != "4" && @board[4] != "5" && @board[5] != "6" #victoire à l'horizontal
    case_3 = @board[6] == @board[7] && @board[6] == @board[8] && 
              @board[6] != "7" && @board[7] != "8" && @board[8] != "9" #victoire à l'horizontal
    case_4 = @board[0] == @board[3] && @board[0] == @board[6] && 
              @board[0] != "1" && @board[3] != "4" && @board[6] != "7" #victoire à la verticale
    case_5 = @board[2] == @board[5] && @board[2] == @board[8] && 
              @board[2] != "3" && @board[5] != "6" && @board[8] != "9" #victoire à la verticale
    case_6 = @board[0] == @board[4] && @board[0] == @board[8] && 
              @board[0] != "1" && @board[4] != "5" && @board[8] != "9" #victoire à la verticale
    case_7 = @board[2] == @board[4] && @board[2] == @board[6] && 
              @board[2] != "3" && @board[4] != "5" && @board[6] != "7" #victoire en diagonale
    case_8 = @board[1] == @board[4] && @board[1] == @board[7] && 
              @board[1] != "2" && @board[4] != "5" && @board[7] != "8" #victoire en diagonale
    case
    
    when case_1
      return true
    when case_2
      return true
    when case_3
      return true
    when case_4
      return true
    when case_5
      return true
    when case_6
      return true
    when case_7
      return true
    when case_8
      return true
    else
      return false
    end
  end
end
#Fin de la class Board

# Debut du classe Boardcases :
class BoardCase
  #system 'clear'
  #la classe a deux attr_accessor : sa valeur ("X", "_", ou vide), et son numéro de case.
  attr_accessor :value, :case_number
  
  def initialize(case_number)
    @value = ""
    @case_number = case_number
  end
  
  def to_s
    # renvoie la valeur au format string
    self.value = @value 
  end

end
#Fin de la class Boardcase
#Player class

class Player
  attr_accessor :name, :player_color

  def initialize(name, player_color)
    @name = name #Le nom à retourner lors de chaque tour
    @player_color = player_color #La représentation des X et des O
  end
end



class Game
  
  
  def initialize
    print "Entrer le nom du joueur nimero 1: "
    nom_player_1 = gets.chomp
    puts "#{nom_player_1.upcase.blue}, tu as les X."
    player_symbol_1 = "X"
    puts "\n"
    #Instancier le joueur numero 1
    @player_one = Player.new(nom_player_1, player_symbol_1)

    print "Entrer le nom du joueur nimero 2: "
    nom_player_2 = gets.chomp
    puts "#{nom_player_2.upcase.green}, tu as les O."
    player_symbol_2 = "O"
    puts "\n"
    #Instancier le joueur numero 2
    @player_two = Player.new(nom_player_2, player_symbol_2)

    @players = [@player_one, @player_two] #On lie les deux joueurs dans une array pour appliquer l'ensemble des futurs méthodes pour les deux joueurs.
    @grid_board = Board.new #On fait apparaitre le plateau avec notre instance @object_board
  end

  def go #Les règles du jeu pour faire joli
    
    puts
    puts "Aide...."
    puts "Entrer de chiffre 0-9 qui correspond au X et O dans la case"
    self.turn #fais appelle à la classe dans la classe. Donc ici appelle la classe pour exécuter turn donc le jeu
    #puts "Demarrez maintenant! Appuier sur entrer \n"
    #gets.chomp #Faire entrée pour effectivement enchaîner sur le jeu
    
  end

  def turn
    
    partie = 1
    turns = 0 #Le turns commence à 0, on ajoute +1 après jusqu'à ce qu'un des deux joueurs gagne.
    
      puts "===== PARTIE NUMERO #{partie} =====".cyan
      while @grid_board.victoire == false do #On fait tout ce qu'il y a en dessous, tant que victoire n'est pas atteint
        
        @players.each { |player| #Il ne faut pas oublier d'appeler l'array des joueurs pour cela et de leur appliquer les lignes suivantes
          @grid_board.display_board #Affichage du plateau
          tour = turns + 1
          
          puts "***** TOUR NUMERO #{tour} *****".yellow #La structure chaque tour
          
          print "#{player.name.capitalize.blue} ! Choisis ta case: "   #On appliquer le .name de la classe Player au player(les deux qu'on a lié juste avant.)
          n = gets.chomp.to_i   #On enregistre la case dans la variable n cad dans les infos du player
          puts "\n"
          if n < 0 && n > 10 && n.integer? == false  #Evite qu'on entre un numéro autre que les chiffres de 1 à 9, sinon ça demande de renseigner un bon numéro (se répète grâce à until)
            puts "Veuillez entrer un numero entre [0 - 9] :"
            n = gets.chomp.to_i
          end
          n = n - 1 #On retire 1 pour que ça corresponde à l'index (sans ça on commence à 0 et pas à 1)

          @info_player = [player.name, player.player_color, n] #enregistre les infos données au cours de la partie
          @grid_board.play(@info_player)
          
          if @grid_board.victoire #Les conditions de victoire sont remplies alors on applique deux cas de figure (win / égalité)
            partie += 1
            @grid_board.display_board # affiche le plateau gagnant
            puts "===============================".yellow
            puts "  =========> Felicitation! #{player.name.upcase.cyan}, tu as gagné la partie!"
            puts "===============================".yellow
            
            print "Voulez vous rejouer encore? [O/n]: " #rejouer à une autre partie
            rep = gets.chomp #On demande le oui ou le non
            if rep == "O" || rep == "o" #Si la réponse est oui (O) ou (o)
              Game.new.go #On relance le jeu avec le Game.new.go
            elsif rep == "N" || rep == "n" #Si la réponse est non (N) ou (n)
              puts "Fin de la partie! Bye..." #C'es fini!
            else
              puts "Annulation....."
              exit
            end
            break # on sort de la boucle si c'est le joueur a gagné.
            
            
          end
          
          turns += 1 # On incrémente le turns pour atteindre 9
          
        
          if turns == 9 # Les conditions de victoire n'ont pas été remplies mais on a fini de remplir le plateau, c'est l'égalité
            @grid_board.display_board #Affiche le plateau de l'égalité
            puts "==========================".yellow
            puts " ===== Wow, égalité ===== "
            puts "==========================".yellow
            print "Voulez vous rejouer encore? [O/n]: " #rejouer à une autre partie
            rep = gets.chomp #On demande le oui ou le non
            if rep == "O" || rep == "o"
              Game.new.go
            elsif rep == "N" || rep == "n"
              puts "Fin de la partie! Bye..."
              exit
            else
              puts "Annulation....."
              exit
            end
          break
          
        end
      } #fin des lignes à appliquer à chacun des joueurs inclus dans l'array players
      end #Fin de la boucle while avec l'atteinte de la condition de victoire en true
      
    
  end #fin de turn

end

Game.new.go # On lance le jeu en lançant la classe Game et en lui appliquant la méthode go qui inclus le turn grâce à self
