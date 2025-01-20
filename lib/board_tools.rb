module BoardTools
  
  def array_group(board)
    possible_columns(board) + possible_lines(board) + total_diagonal(board)
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
    return array.each_cons(3).to_a
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
    
    n = board.length
    board = board.transpose
    array = []
    (n - 1).times do |index|
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

  def total_diagonal(board)
    side_diagonals(board) + top_diagonal(board) + center_diagonals(board) 
  end
end


