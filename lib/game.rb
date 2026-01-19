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
