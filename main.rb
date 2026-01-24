require_relative 'lib/game'

def tic_tac_toe
    game = Game.new
    game.run
    puts game.result
end

#play the game
tic_tac_toe()