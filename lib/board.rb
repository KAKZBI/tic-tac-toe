class Board
  # attr_reader :board
  def initialize
    @board = Array(1..9).each_with_object({}) { |key, hash| hash[key] = key }
  end

  # Display the board
  def to_s
    "#{@board[1]}  | #{@board[2]} | #{@board[3]}\n" \
      "---+---+---\n" \
      "#{@board[4]}  | #{@board[5]} | #{@board[6]}\n" \
      "---+---+---\n" \
      "#{@board[7]}  | #{@board[8]} | #{@board[9]}\n"
  end

  # Verify if a cell is available
  def cell_free?(cell)
    @board[cell] == cell
  end

  # Check if all the cells have been assigned
  def all_cells_occupied?
    @board.keys.all? { |key| @board[key] != key }
  end

  def update_cell(position, symbol)
    @board[position] = symbol
  end

  def at_cell(position)
    @board[position]
  end
end
