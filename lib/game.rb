require_relative 'board'
require_relative 'player'

class Game
    attr_reader :board
    def initialize()
        @board = Board.new
        first_player = initialize_player(1, 'X')
        second_player = initialize_player(2, 'O')
        @winner = nil
        self.display_player_letters
    end
    def display_player_letters
        puts "#{@first_player.name}  will use #{@first_player.letter}."
        puts "#{@second_player.name}  will use #{@second_player.letter}."
    end
    def initialize_player(rank, letter)
        puts "Player #{rank}, please enter your name: "
        name = gets.chomp
        Player.new(name, letter)
    end
    def result
        if winner?
            "Match end - #{@winner.name} is the winner"
        else
            "Match end - Draw"
        end
    end
    
    def display_board # Display the board
        puts @board
    end

    def end_game?
        @board.all_cells_occupied?
    end
    #Determine if a player's choice is valid
    def valid_choice?(choice)
        @board.cell_free?(choice)
    end
    def get_player_choice(player)
        choice = 0
        attemps = 3
        until self.valid_choice?(choice) || attemps <= 0
            puts "#{player.name}, make your choice - #{attemps} left: "
            choice = player.choose_cell
            attemps -= 1
        end
        choice
    end
    def update_board(player, player_choice)
        @board.update_cell(player_choice, player.letter)
    end
    def winner?
        # returns true or false
        !!@winner
    end
    def has_won?(player)
        won = false
        won = true if player.letter == @board.at_cell(1) && player.letter == @board.at_cell(2) && player.letter == @board.at_cell(3)
        won = true if player.letter == @board.at_cell(1) && player.letter == @board.at_cell(4) && player.letter == @board.at_cell(7)
        won = true if player.letter == @board.at_cell(1) && player.letter == @board.at_cell(5) && player.letter == @board.at_cell(9)
        won = true if player.letter == @board.at_cell(2) && player.letter == @board.at_cell(5) && player.letter == @board.at_cell(8)
        won = true if player.letter == @board.at_cell(3) && player.letter == @board.at_cell(6) && player.letter == @board.at_cell(9)
        won = true if player.letter == @board.at_cell(3) && player.letter == @board.at_cell(5) && player.letter == @board.at_cell(7)
        won = true if player.letter == @board.at_cell(4) && player.letter == @board.at_cell(5) && player.letter == @board.at_cell(6)
        won = true if player.letter == @board.at_cell(7) && player.letter == @board.at_cell(8) && player.letter == @board.at_cell(9)
        return won
    end
end