
VOID = " "
BALL = "\u25EF"
SQUARE = "\u25FC"
TEMPLATE = <<-HEREDOC
      
 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 
 1 2 3 4 5 6 7
    HEREDOC


class ConnectGame

  attr_accessor :board
  
  def initialize(board = Array.new(6){ Array.new(7, ' ')})
    @board = board
  end


  def play(col_index, player)
    p @board

    @board[col_index][target_index(col_index)] = player == 0 ? BALL : SQUARE
    p @board
  end

  def target_index(col_index)
    columns = @board.transpose
    columns[col_index].each_with_index do |item, index|
      return index if item != " "
    end
    return 5
  end

  def display_board

    message = @board.each_with_index.reduce("") do |acc, (line, index)| 
      new_line = index == 5 ? "|" : "|\n"
      acc + line.reduce("") { |acc, element| acc + '|' + element} + new_line
    end

    puts message + TEMPLATE
  end





end