require 'rspec'
require './lib/cell'
require './lib/piece'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new('1')
    @x = Piece.new('X')
    @o = Piece.new('O')
  end

  it 'exists' do
    expect(@cell).to be_a Cell
    expect(@cell.space).to eq '1'
  end
end