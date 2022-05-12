require "./board.rb"
require "./player.rb"

class TicTacToe
  attr_accessor :player_1, :player_2
  attr_reader :board

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
    board.update_board(position, current_player.pawn)
    check_for_three_in_a_row(board, player)
    play_round(next_player(current_player))
    

  end

  def next_player(player)
    player == @player_1 ? @player_2 : @player_1

  end

  def choose_position(player)
    position = ""
    puts "#{player.name}, choose position"
    print "Select position: "
    position = gets.to_i

    position

  end

  def check_for_three_in_a_row(board, player)
    pawn = player.pawn
    grid = board.grid
    grid[0..2].all? {|x| x == pawn } ? game_over(player) : nil
    grid[3..5].all? {|x| x == pawn } ? game_over(player) : nil
    grid[6..8].all? {|x| x == pawn } ? game_over(player) : nil
    grid[0] == pawn && grid[3] == pawn && grid[6] == pawn ? game_over(player) : nil
    grid[1] == pawn && grid[4] == pawn && grid[7] == pawn ? game_over(player) : nil
    grid[2] == pawn && grid[5] == pawn && grid[8] == pawn ? game_over(player) : nil
    grid[0] == pawn && grid[4] == pawn && grid[8] == pawn ? game_over(player) : nil
    grid[2] == pawn && grid[4] == pawn && grid[6] == pawn ? game_over(player) : nil
  end

  def game_over(player)
    p "#{player.name} Won!"
    exit
  end

end

tic_tac_toe = TicTacToe.new
tic_tac_toe.start_game(tic_tac_toe.player_1)

