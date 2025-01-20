
VOID = " "
BALL = "\u25EF"
SQUARE = "\u25FC"


TEMPLATE = <<-HEREDOC

 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 \u25B2 
 1 2 3 4 5 6 7
    HEREDOC

ALMOST_FILLED_BOARD = [[" ", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "]]
COLUMN_FILLED_BOARD = [["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "], ["◯", " ", " ", " ", " ", " ", " "]]

require_relative 'board_tools'
class ConnectGame

  extend BoardTools
  attr_accessor :board, :n, :m, :player
  

  def initialize(board = Array.new(6){ Array.new(7, ' ')})
    @board = board.map(&:dup)
    @n = board.length
    @m = board[0].length
    @player = 0
  end

  def init 
    until(end_game?)
      get_play
      display_board
    end
    puts "Player #{player - 1} WINS"
  end

  def get_play

    puts "player #{player} -> play (1 a 7)"
    answer = gets.chomp
    if answer.to_i.between?(1,7)
      play_piece(answer.to_i - 1, player)
      puts "player: #{player}"
      @player = 1 - @player
    end
  end

  def end_game?
    group = self.class.array_group(board)
    group.any? do |array|
      array == Array.new(CONNECT_NUMBER, BALL) || array == Array.new(CONNECT_NUMBER, SQUARE)
    end
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

