require 'rspec'
require './lib/board'
require './lib/piece'
require './lib/cell'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cell  = Cell.new('1')
    @x     = Piece.new('X')
    @o     = Piece.new('O')
  end

  it 'exists' do
    expect(@board).to be_a Board
  end

  it 'can create board cells' do
    expected = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    expect(@board.cells.keys).to eq(expected)
    expect(@board.cells.count).to eq(9)
  end

  it 'is a valid space' do
    expect(@board.valid_space?('1')).to be true
    expect(@board.valid_space?('6')).to be true
    expect(@board.valid_space?('8')).to be true
    expect(@board.valid_space?('10')).to be false
    expect(@board.valid_space?('20')).to be false
  end

  it 'can place a piece in a space on the board' do
    @board.place(@o, '1')
    @board.place(@x, '4')
    expect(@board.cells['1'].piece.name).to eq('O')
    expect(@board.cells['4'].piece.name).to eq('X')
  end

  it 'can render a board' do
    expected = "1 2 3 \n4 5 6 \n7 8 9 \n"

    expect(@board.render_board).to eq(expected)

    @board.place(@o, '1')
    @board.place(@x, '4')

    expected = "O 2 3 \nX 5 6 \n7 8 9 \n"
    
    expect(@board.render_board).to eq(expected)
  end

  # it 'can find a winning combination' do
  #   @board.place(@o, '1')
  #   @board.place(@x, '4')
  #   @board.place(@x, '5')
  #   @board.place(@x, '6')

  #   expect(@board.its_a_winner('4')).to eq(true)
  # end
end