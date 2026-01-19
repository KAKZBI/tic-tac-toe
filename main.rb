require_relative 'lib/game'
require_relative 'lib/person'

def playGame
    puts "\e[1;4;35m Tick-Tack-Toe\e[0m"
    print "\nWhat is the name of player #1>> "
    name = gets.chomp
    player_1 = Player.new(name, "X") # player1 will use X
    print "\nWhat is the name of player #2>> "
    name = gets.chomp
    player_2 = Player.new(name, "O") # player2 will use O
    aGame = Game.new # Create a new game
    puts aGame
    while(!aGame.endGame? && !aGame.has_won?(player_1.letter) && !aGame.has_won?(player_2.letter))
        print "\n#{player_1.name}, please choose a valid number>> "
        choosen_number = gets.chomp.to_i
        while(!aGame.valid_turn?(choosen_number, player_1.letter))
            puts "\e[1;31m Sorry, this number is invalid \e[0m"
            print "\n#{player_1.name}, please choose a valid number>> "
            choosen_number = gets.chomp.to_i
        end
        puts aGame
        break if aGame.has_won?(player_1.letter) || aGame.endGame?
        print "\n#{player_2.name}, please choose a valid number>> "
        choosen_number = gets.chomp.to_i
        while(!aGame.valid_turn?(choosen_number, player_2.letter))
            puts "\033[1;31m Sorry, this number is invalid \033[0m"
            print "\n#{player_2.name}, please choose a valid number>> "
            choosen_number = gets.chomp.to_i
        end
        puts aGame
        # break if aGame.has_won?(player_2.letter)
        # puts " Game end? #{aGame.endGame?}"
        
    end

    # Print the result of the game
    if aGame.has_won?(player_1.letter) 
        puts "\e[;32m Match end. #{player_1.name} is the winner\033[0m"
    elsif aGame.has_won?(player_2.letter)
        puts "\e[;34m Match end. #{player_2.name} is the winner\033[0m"
    else
        puts "\e[;33m Match end. DRAW\033[0m"
    end
end

#play the game
playGame()