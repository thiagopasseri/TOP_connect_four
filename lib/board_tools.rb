CONNECT_NUMBER = 4
module BoardTools
  
  def array_group(board)
    possible_columns(board) + possible_lines(board) + group_possible_four(total_diagonals(board)) + group_possible_four(total_diagonals(self.horizontal_flip(board)))
  end

  def horizontal_flip(board)
    n = board.length
    m = board[0].length

    new_board = Array.new(n) {Array.new(m)}
    board.each_with_index do |line, i_line|
      line.each_with_index do |col, i_col|
        # puts "board[#{i_line}][#{m - i_col - 1}] = #{board[i_line][m - i_col - 1]} <-> board[#{i_line}][#{i_col}] = #{board[i_line][i_col]} "
        new_board[i_line][i_col] = board[i_line][m-i_col-1]
        # puts "board[#{i_line}][#{i_col}] = #{new_board[i_line][i_col]}"

        # DEUGAR AQUI: por que não está gerando uma matriz flipada?

      end
    end
    new_board
  end

  def possible_columns(board)
    n = board.length
    m = board[0].length
    
    possible_columns = []
    m.times do |col|
      possible_columns += possible_four(board.transpose[col])
    end
    possible_columns
  end

  def possible_lines(board)
    n = board.length
    possible_lines = []
    n.times do |line|
      possible_lines += possible_four(board[line])
    end
    possible_lines
  end

  def possible_four(array)
    return array.each_cons(CONNECT_NUMBER).to_a
  end

  def group_possible_four(array_group)
    group = []
    array_group.each do |array|
      group += possible_four(array)
    end
    group
  end

  def debug_display(array)
    game = ConnectGame.new()
    array.each do |item|
      line = item[0].to_i
      col = item[1].to_i
      game.board[line][col] = "*"
      # puts "line: #{line}, col: #{col}, board: #{game.board[line][col]}"
    end
    game.display_board
  end
  

  def side_diagonals(board)
    n = board.length
    array = []
    (1..(n - 1)).each do |index|
      diag = []
      step = 0
      while (board[index+step] != nil && board[index+step][step] != nil) do
        diag << (board[index + step][step])
        step += 1
      end
      array << diag 
    end
    array
  end
  
  def top_diagonal(board) 
    
    n = board[0].length
    board = board.transpose
    array = []
    (1..n).each do |index|
      diag = []
      step = 0
      while (board[index+step] != nil && board[index+step][step] != nil) do
        diag << (board[index + step][step])
        step += 1
      end
      array << diag
    end
    array
  end

  def center_diagonals(board)
    n = board.length
    m = board[0].length
    possible_diagonals = []

    (0..m-n).each do |index|
      diagonal = []
      n.times do |step|
        diagonal << board[step][step + index]
      end
      possible_diagonals << diagonal
    end
    possible_diagonals
  end

  def total_diagonals(board)
    side_diagonals(board) + top_diagonal(board) + center_diagonals(board) 
  end
end


