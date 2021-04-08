require 'rspec'
require './lib/cell'
require './lib/piece'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('1')
    @cell1 = Cell.new('2')
    @cell2 = Cell.new('3')
    @cell3 = Cell.new('4')
    @x = Piece.new('X')
    @o = Piece.new('O')
  end

  it 'exists' do
    expect(@cell).to be_a Cell
    expect(@cell.space).to eq '1'
  end

  it 'can find if a piece is in the cell' do
    expect(@cell.piece).to be_nil
    expect(@cell.empty?).to be true
  end

  it 'can place a piece' do
    @cell.place_piece(@x)

    expect(@cell.piece).to eq @x
    expect(@cell.empty?).to be false
  end
end