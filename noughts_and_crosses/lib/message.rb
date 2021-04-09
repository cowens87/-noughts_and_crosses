class Message
  def welcome_message
    "Welcome to Tic Tac Toe\n" +
    "Enter p to play. Enter q to quit."
  end

  def user_instructions
    puts ('-' * 60).to_s
    puts 'You are playing a computer'
    puts "I will be 'O' pieces and you will be 'X' pieces"
    puts 'The first player to get 3 of their pieces in a row (up, down, across, or diagonally) is the winner.'
    puts 'When all 9 squares are full, the game is over'
    puts 'You have the first move.'
    puts 'Please enter a number 1-9:'
    puts ('-' * 60).to_s
  end

  def invalid_response
    puts ('-' * 60).to_s
    puts "That is not a valid choice, please input 'p' or 'q'"
    puts ('-' * 60).to_s
  end
end