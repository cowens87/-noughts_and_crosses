class Board
  attr_reader :cells

  def initialize
    @cells = generate_cells
  end

  def generate_cells
    spaces = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    spaces.each_with_object({}) { |space, cells_hash| cells_hash[space] = Cell.new(space) }
  end

  def valid_space?(space)
    @cells.keys.include?(space)
  end

  def valid_placement?(space)
    valid_space?(space) && @cells[space].empty? 
  end

  def place(piece, space)
    @cells[space].place_piece(piece) if valid_placement?(space)
  end

  # def find_all_taken_cells_x
  #   @cells.values.select { |cell| !cell.piece.nil? && cell.piece.name == 'X'}
  # end

  # def winning_combos 
  #       [
  #   ['1', '2', '3'],
  #   ['4', '5', '6'],
  #   ['7', '8', '9'],
  #   ['1', '4', '7'],
  #   ['2', '5', '8'],
  #   ['3', '6', '9'],
  #   ['1', '5', '9'],
  #   ['3', '5', '7']
  # ]
  # end

  # def its_a_winner(space)
  #   u = []
  #   find_all_taken_cells_x.each do |cell|
  #     winning_combos.each do |combo|
  #      u << combo if combo.include?(space)
  #     end
  #   end
  #   require 'pry'; binding.pry
  # end

  def render_board
    "#{@cells["1"].render} #{@cells["2"].render} #{@cells["3"].render} \n" +
    "#{@cells["4"].render} #{@cells["5"].render} #{@cells["6"].render} \n" +
    "#{@cells["7"].render} #{@cells["8"].render} #{@cells["9"].render} \n" 
  end
end