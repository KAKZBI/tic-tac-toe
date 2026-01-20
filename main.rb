require_relative 'lib/game'
require_relative 'lib/person'

def create_player(rank, letter)
    print "\nPlayer #{rank}, please enter your name: "
    name = gets.chomp
    player = Player.new(name, letter)
    player
end

def tic_tac_toe
    puts "\e[1;4;35m Tick-Tack-Toe\e[0m"
    player_1 = create_player(1, 'X') # player1 will use X
    player_2 = create_player(2, 'O') # player2 will use O
    a_game = Game.new # Create a new game
    puts a_game
    until a_game.end_game? || a_game.has_won?(player_1.letter) || a_game.has_won?(player_2.letter)
        print "\n#{player_1.name}, please choose a valid number>> "
        player_choice = gets.chomp.to_i
        until a_game.valid_choice?(player_choice, player_1.letter)
            puts "\e[1;31m Sorry, this number is invalid \e[0m"
            print "\n#{player_1.name}, please choose a valid number>> "
            player_choice = gets.chomp.to_i
        end
        puts a_game
        break if a_game.has_won?(player_1.letter) || a_game.end_game?
        print "\n#{player_2.name}, please choose a valid number>> "
        player_choice = gets.chomp.to_i
        until a_game.valid_choice?(player_choice, player_2.letter)
            puts "\033[1;31m Sorry, this number is invalid \033[0m"
            print "\n#{player_2.name}, please choose a valid number>> "
            player_choice = gets.chomp.to_i
        end
        puts a_game
        # break if a_game.has_won?(player_2.letter)
        # puts " Game end? #{a_game.end_game?}"
        
    end

    # Print the result of the game
    if a_game.has_won?(player_1.letter) 
        puts "\e[;32m Match end. #{player_1.name} is the winner\033[0m"
    elsif a_game.has_won?(player_2.letter)
        puts "\e[;34m Match end. #{player_2.name} is the winner\033[0m"
    else
        puts "\e[;33m Match end. DRAW\033[0m"
    end
end

#play the game
tic_tac_toe()