require_relative './lib/connect_four'

BOARD = [["00", "01", "02", "03", "04", "05", "06"], ["10", "11", "12", "13", "14", "15", "16"], ["20", "21", "22", "23", "24", "25", "26"], ["30", "31", "32", "33", "34", "35", "36"], ["40", "41", "42", "43", "44", "45", "46"], ["50", "51", "52", "53", "54", "55", "56"]]
x = ["00", "01", "02", "03", "04", "05", "06", "07"]

# (6+7-1).times do |index|
#   next if index < 4 || 12 - index < 4

# end





board = ConnectGame.new(BOARD)
board.display_board
# p board.side_diagonals(1)


puts "center diagonal"
p ConnectGame.center_diagonals(BOARD)


# puts "possible lines:"
# p possible_lines.flatten(1)


# puts "possible columns:"
# p possible_columns.flatten(1)

# possible_columns.flatten(1).each do |item|
#   ConnectGame.debug_display(item)
# end




# p possible_columns
# 



# array = Array.new(6) {Array.new(7)}
# 6.times do |line|
#   7.times do |col|
#     array[line][col] = "#{line}#{col}"
#   end
# end






# p possible_fours x
# p x.each_cons(4).to_a