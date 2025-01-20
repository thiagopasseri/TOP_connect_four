require_relative './lib/connect_four'

BOARD = [["00", "01", "02", "03", "04", "05", "06"], ["10", "11", "12", "13", "14", "15", "16"], ["20", "21", "22", "23", "24", "25", "26"], ["30", "31", "32", "33", "34", "35", "36"], ["40", "41", "42", "43", "44", "45", "46"], ["50", "51", "52", "53", "54", "55", "56"]]
x = ["00", "01", "02", "03", "04", "05", "06", "07"]



board = ConnectGame.new
board.display_board
board.init

# board2 = ConnectGame.new(BOARD)
# board2.display_board

# y = board2.board
# p ConnectGame.array_group(y)
