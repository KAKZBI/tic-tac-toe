require_relative 'board'
require_relative 'player'
require 'pry-byebug'
require 'colorize'

WINNING_COMBOS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # Rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # Cols
  [1, 5, 9], [3, 5, 7]             # Diagonals
].freeze

class Game
  # attr_reader :board
  def initialize
    puts ' Welcome to Tick-Tack-Toe'.colorize(:green)
    @board = Board.new
    @first_player = initialize_player(1, 'X'.colorize(:blue))
    @second_player = initialize_player(2, 'O'.colorize(:yellow))
    @winner = nil
    display_player_letters
    display_board
  end

  def result
    sleep(1)
    return 'Match end - Draw'.colorize(:red) unless winner?

    # Check which color to use based on the winner's identity
    color = @winner == @first_player ? :blue : :yellow

    "Match end - #{@winner.name} is the winner".colorize(color)
  end

  def run
    current_player = @first_player
    next_player = @second_player
    until end_game? || winner?
      current_player.choice = get_player_choice(current_player)
      @winner = next_player unless valid_choice?(current_player.choice)
      update_board(current_player, current_player.choice) if valid_choice?(current_player.choice)
      @winner = current_player if won?(current_player)
      display_board
      current_player, next_player = next_player, current_player
    end
  end

  private

  def display_player_letters
    puts
    puts "#{@first_player.name}  will use #{@first_player.letter}."
    puts "#{@second_player.name}  will use #{@second_player.letter}."
  end

  def initialize_player(rank, letter)
    print "Player #{rank}, please enter your name: "
    name = gets.chomp
    Player.new(name.capitalize, letter)
  end

  def display_board
    puts
    puts @board
    puts
  end

  def end_game?
    @board.all_cells_occupied?
  end

  # Determine if a player's choice is valid
  def valid_choice?(choice)
    @board.cell_free?(choice)
  end

  def get_player_choice(player)
    choice = 0
    attemps = 3
    until valid_choice?(choice) || attemps <= 0
      color = player == @first_player ? :blue : :yellow
      warning = attemps < 3 ? "#{attemps} attempts left".colorize(:red) : "#{attemps} attempts left"
      print "#{player.name.colorize(color)}, make your choice - #{warning}: "
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

  def won?(player)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |pos| @board.at_cell(pos) == player.letter }
    end
  end
end
