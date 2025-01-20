require_relative 'lib/connect_four'

game = ConnectGame.new()

def test_board(n, m)
  array = Array.new(n) {Array.new(m)}
  n.times do |line|
    m.times do |col|
      # puts "line: #{line} - col:#{col}"
      array[line][col] = line.to_s + col.to_s
    end
  end
  array
end



x = test_board(4,6)

game = ConnectGame.new(x)
game2 = ConnectGame.new(x.transpose)

game.display_board
p ConnectGame.side_diagonals(x)
p ConnectGame.top_diagonal(x)

puts
game2.display_board
p ConnectGame.side_diagonals(x.transpose)


# p ConnectGame.top_diagonal(x)

# p ConnectGame.center_diagonals(x)
# game2.display_board


# def side_diagonals(board)
#   n = board.length
#   array = []
#   (1..(n - 1)).each do |index|
#     diag = []
#     (n - index).times do |step|
#       diag << (board[index + step][step])
#     end
#     array << diag
#   end
#   array
# end


