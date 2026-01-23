class Player
    attr_reader :name, :letter ,:choice
    def initialize(name, letter)
        @name = name
        @letter = letter
        @choice
    end
    def choose_cell
        get.chomp.to_i
    end
end