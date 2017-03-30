require './src/game'
require './src/field'
require './src/player/human'

FIELD_SIZE = 3
MATCH_TO_WIN = 3
PLAYERS_CHIPS = ['X', 'O']

field = Field.new(FIELD_SIZE)

players = []
PLAYERS_CHIPS.each_with_index do |chip, i|
  players << Player::Human.new("Player_#{i + 1}", chip)
end

game = Game.new(field, players, MATCH_TO_WIN)
game.run
