class Game
    attr_reader :board
    def initialize()
        @board = {}
        @board[1] = 1
        @board[2] = 2
        @board[3] = 3
        @board[4] = 4
        @board[5] = 5
        @board[6] = 6
        @board[7] = 7
        @board[8] = 8
        @board[9] = 9
    end
    def to_s # Overide to_s
         "#{board[1]}  | #{board[2]} | #{board[3]}\n" +
         "---+---+---\n" +
         "#{board[4]}  | #{board[5]} | #{board[6]}\n" +
         "---+---+---\n" +
         "#{board[7]}  | #{board[8]} | #{board[9]}\n"
    end

    def endGame?
        self.board.keys.all? {|key| self.board[key] != key}
    end
    #Determine if a player's turn is valid
    def valid_turn?(choosen_number, letter)

        if self.board[choosen_number] == choosen_number
            self.board[choosen_number] = letter
            return true
        end
        return false
    end

    def has_won?(letter)
        won = false
        won = true if letter == board[1] && letter == board[2] && board[2] == board[3]
        won = true if letter == board[1] && letter == board[4] && board[4] == board[7]
        won = true if letter == board[1] && letter == board[5] && board[5] == board[9]
        won = true if letter == board[2] && letter == board[5] && board[5] == board[8]
        won = true if letter == board[3] && letter == board[6] && board[6] == board[9]
        won = true if letter == board[3] && letter == board[5] && board[5] == board[7]
        won = true if letter == board[4] && letter == board[5] && board[5] == board[6]
        won = true if letter == board[7] && letter == board[8] && board[8] == board[9]
        return won
    end
end
class Player
    attr_reader :name, :letter
    def initialize(name, letter)
        @name = name
        @letter = letter
    end
end

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