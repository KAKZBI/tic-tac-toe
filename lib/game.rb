require_relative 'board'
require_relative 'player'

class Game
    attr_reader :board
    def initialize()
        @board = Board.new
    end
    def to_s # Display the board
         "#{board[1]}  | #{board[2]} | #{board[3]}\n" +
         "---+---+---\n" +
         "#{board[4]}  | #{board[5]} | #{board[6]}\n" +
         "---+---+---\n" +
         "#{board[7]}  | #{board[8]} | #{board[9]}\n"
    end

    def end_game?
        self.board.all_cells_occupied?
    end
    #Determine if a player's choice is valid
    def valid_choice?(player_choice, letter)

        if self.board[player_choice] == player_choice
            self.board[player_choice] = letter
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