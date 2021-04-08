require 'rspec'
require './lib/piece'

RSpec.describe Piece do
  before(:each) do
    @x = Piece.new('X')
  end

  it 'exists' do
    expect(@x).to be_a Piece
    expect(@x.name).to eq('X')
  end
end