require_relative 'lib/connect_four'

game = ConnectGame.new()

game.display_board

game.play(3, 0)
# p game.board

game.display_board
