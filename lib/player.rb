class Player
  attr_reader :name, :letter
  attr_accessor :choice

  def initialize(name, letter)
    @name = name
    @letter = letter
    @choice = nil
  end

  def choose_cell
    gets.chomp.to_i
  end
end
