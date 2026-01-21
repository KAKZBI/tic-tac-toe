class Player
    attr_reader :name, :letter, :actual_choice
    def initialize(name, letter)
        @name = name
        @letter = letter
    end
    def actual_choice=(number)
        @actual_choice = number
    end
end