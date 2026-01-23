class Player
    attr_reader :name, :letter 
    attr_writer :choice
    def initialize(name, letter)
        @name = name
        @letter = letter
        @choice
    end
    def choose_cell
        get.chomp.to_i
    end
end