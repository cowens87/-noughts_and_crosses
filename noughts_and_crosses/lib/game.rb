require './lib/board'
require './lib/piece'
require './lib/cell'
require './lib/message'

class Game
  attr_reader   :board,
                :computer_pieces,
                :user_pieces

  def initialize
    @game_board     = Board.new
    @user_piece     = Piece.new('X')
    @computer_piece = Piece.new('O')
    @messages       = Message.new
  end

  def play_the_game
    puts @messages.welcome_message
    user_response = gets.chomp.downcase
    if user_response == 'p'
      start_game
    elsif user_response == 'q'
      exit
    else
      @messages.invalid_response
      play_the_game
    end
  end

  def start_game
    puts @messages.user_instructions
    until game_over?
      display_board
      puts ('-' * 60).to_s
      get_user_space_choice
      computer_space_choice
    end
    win_game
    puts '=============REMATCH?============='
    @game_board = Board.new
    play_the_game
  end

  def game_over?
    end_game? 
    # || win_game?
  end

  def display_board
    puts @game_board.render_board
  end

  def computer_space_choice
    sample = ['1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
    until @game_board.valid_placement?(sample)
      sample = ['1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
    end
    @game_board.place(@computer_piece, sample)
  end

  # def win_game?
  #   @game_board.cells.values.all? { |cell| !cell.piece.nil? }
  # end

  def end_game?
    @game_board.cells.values.all? { |cell| !cell.piece.nil? }
  end

  # def three_count_same_name?
  #   require 'pry'; binding.pry
  #   @user_piece.count == 3 && @user_piece.name == 'X' || @computer_piece.count == 3 && @computer_piece.name == 'O' 
  # end

  def get_user_space_choice
    user_choice = gets.chomp
    until @game_board.valid_placement?(user_choice)
      puts 'This move is not an option, please try again'
      puts 'Please enter a different space 1-9'
      user_choice = gets.chomp
    end
    @game_board.place(@user_piece, user_choice)
  end
end