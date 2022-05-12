require "./board.rb"
require "./player.rb"

class TicTacToe
  attr_accessor :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = Player.new("Ruby", "X")
    @player_2 = Player.new("JS", "O")
  end

  def start_game(starting_player)
    player = starting_player
    play_round(player)

  end

  def play_round(player)
    current_player = player
    position = choose_position(current_player)
    @board.update_board(position[0], position[1], position[2])
    #check_for_three_in_a_row(@board.get_current_board) ? game_over(player) : play_round(next_player(current_player))
    play_round(next_player(current_player))
    

  end

  def next_player(player)
    player == @player_1 ? @player_2 : @player_1

  end

  def choose_position(player)
    position = []
    puts "#{player.name}, choose position"
    print "Row: "
    row = gets.to_i
    print "Column: "
    column = gets.to_i

    position[0] = row
    position[1] = column
    position[2] = player.pawn

    position

  end

  def check_for_three_in_a_row(board)
    #some logic ? game_over(player) : next_player(player)
  end

  def game_over(player)
    p "#{player.name} Won!"
    exit
  end

end

tic_tac_toe = TicTacToe.new
tic_tac_toe.start_game(tic_tac_toe.player_1)

