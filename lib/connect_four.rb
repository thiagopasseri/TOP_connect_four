
VOID = " "
BALL = "\u25EF"
SQUARE = "\u25FC"
# N = 6
# M = 7

TEMPLATE = <<-HEREDOC

 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 
 1 2 3 4 5 6 7
    HEREDOC

ALMOST_FILLED_BOARD = [[" ", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "]]
COLUMN_FILLED_BOARD = [["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "]]

require_relative 'board_tools'
class ConnectGame

  extend BoardTools
  attr_accessor :board, :n, :m
  

  def initialize(board = Array.new(6){ Array.new(7, ' ')})
    @board = board.map(&:dup)
    @n = board.length
    @m = board[0].length
  end


  def play_piece(col_index, player)
    line_index =  target_line(col_index)
    @board[line_index][col_index] = player == 0 ? BALL : SQUARE if line_index != nil
  end

  def target_line(col_index)
    columns = @board.transpose
    columns[col_index].each_with_index do |item, index|
      if item != ' ' && index == 0
        return nil
      else
        return index - 1 if item != ' '
      end
    end
    return n - 1
  end

  
  def display_board

    message = @board.each_with_index.reduce("") do |acc, (line, index)| 
      new_line = index == n - 1 ? "|" : "|\n"
      acc + line.reduce("") { |acc, element| acc + '|' + element} + new_line
    end

    puts message + TEMPLATE
  end
end

GEN_BOARD = <<-HEREDOC

| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |
| | | | | | | |      
 ▲ ▲ ▲ ▲ ▲ ▲ ▲ 
 1 2 3 4 5 6 7
a[i][j]

a[i][j, j + 4]

tentar escrever a lógica de end_game? do board com um array de arrays de 4 elementos,
sendo esse array o espaço amostral de todos os possiveis 4 quadradinhos (horizontal, vertical e diagonal)



 
    HEREDOC



  # def self.possible_columns(board)
  #   n = board.length
  #   m = board[0].length
    
  #   possible_columns = []
  #   m.times do |col|
  #     possible_columns += possible_four(board.transpose[col])
  #   end
  #   possible_columns
  # end

  # def self.possible_lines(board)
  #   n = board.length
  #   possible_lines = []
  #   n.times do |line|
  #     possible_lines += possible_four(board[line])
  #   end
  #   possible_lines
  # end

  # def self.possible_four(array)
  #   return array.each_cons(3).to_a
  # end


  # def self.debug_display(array)
  #   game = ConnectGame.new()
  #   array.each do |item|
  #     line = item[0].to_i
  #     col = item[1].to_i
  #     game.board[line][col] = "*"
  #     # puts "line: #{line}, col: #{col}, board: #{game.board[line][col]}"
  #   end
  #   game.display_board
  # end
  

  # def self.side_diagonals(index, board)
  #   n = board.length

  #   diag = []
  #   (n - index).times do |step|
  #     diag << (board[index + step][step])
  #   end
  #   diag
  # end
  
  # def self.top_diagonal(index, board)
  #   board = board.transpose
  #   n = board.length

  #   diag = []
  #   (n - index).times do |step|
  #     diag << (board[index + step][step])
  #   end
  #   diag
  # end

  # def self.center_diagonals(board)
  #   n = board.length
  #   m = board[0].length
  #   possible_diagonals = []

  #   (0..m-n).each do |index|
  #     diagonal = []
  #     n.times do |step|
  #       diagonal << board[step][step + index]
  #     end
  #     possible_diagonals << diagonal
  #   end
  #   possible_diagonals
  # end
