class Player
    attr_reader :name, :letter
    def initialize(name, letter)
        @name = name
        @letter = letter
    end
    def choose_digit
        get.chomp.to_i
    end
end