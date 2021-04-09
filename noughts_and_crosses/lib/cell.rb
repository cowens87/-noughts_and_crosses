class Cell 
  
  attr_reader :space, :piece

  def initialize(space)
    @space = space
    @piece = piece
  end

  def empty?
    @piece.nil?
  end

  def place_piece(piece)
    @piece = piece
  end

  def render
    if !empty? && @piece.name == 'X'
      'X'
    elsif !empty? && @piece.name == 'O'
      'O'
    else
      @space
    end
  end
end