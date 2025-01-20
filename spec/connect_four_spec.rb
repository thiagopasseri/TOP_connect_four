require_relative '../lib/connect_four'

describe ConnectGame do

  describe '#playpiece' do

    context 'when putting a piece in column 3 with empty board' do
      let(:game) {ConnectGame.new}

      it "@board[5][2] retorna #{BALL} para player 0" do
        puts "primeiro teste"
        game.play_piece(2, 0)

        expect(game.board[5][2]).to eq(BALL)
      end
      
      it "@board[5][2] retorna #{SQUARE} para player 1" do
        puts "segundo teste"
        game.play_piece(2, 1)

        expect(game.board[5][2]).to eq(SQUARE)
      end
    end
  
    context 'when putting a piece in column 1 with almost filled column 0' do
      let(:game_partial) {ConnectGame.new(ALMOST_FILLED_BOARD)}


      it "@board[0][0] retorna #{BALL} com player 0" do
        puts "terceiro"

        game_partial.play_piece(0, 0)

        expect(game_partial.board[0][0]).to eq(BALL)
      end
      
      it "@board[0][0] retorna #{SQUARE} com player 1" do
        puts "quarto:"

        game_partial.play_piece(0, 1)

        expect(  game_partial.board[0][0]).to eq(SQUARE)
      end
    end
  end

  describe '# target_line' do
    context 'when putting a piece in a column with 0 pieces' do
      let(:empty_column) {ConnectGame.new}
      it 'returns 5' do
        expect(empty_column. target_line(0)).to eq(5)
      end

    end

    context 'when putting a piece in a column with 3 pieces' do
      let(:empty_column) {ConnectGame.new}

      it 'returns 2' do 
        empty_column.board[5][0] = '◯'
        empty_column.board[4][0] = '◯'
        empty_column.board[3][0] = '◯'

        expect(empty_column. target_line(0)).to eq(2)
      end


    end

    context 'when putting a piece in a column with 6 pieces' do
      let(:empty_column) {ConnectGame.new}

      it 'returns nil' do 
        empty_column.board[5][0] = '◯'
        empty_column.board[4][0] = '◯'
        empty_column.board[3][0] = '◯'
        empty_column.board[2][0] = '◯'
        empty_column.board[1][0] = '◯'
        empty_column.board[0][0] = '◯'

        expect(empty_column. target_line(0)).to eq(nil)
      end
    end
  end
end