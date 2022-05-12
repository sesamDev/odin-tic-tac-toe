class Board
  attr_accessor :grid
  attr_reader :top_left, :top, :top_right
  
  def initialize
    @grid = []
    create_board()
    show_board()
  end
  
  def create_board
    n = 0
    9.times do |x|
      grid.push("#{n}")
      n += 1
    end

  end

  def show_board
    print "#{grid[0..2]}\n#{grid[3..5]}\n#{grid[6..9]}\n"
  end

  def get_grid
    grid
  end

  def update_board(position, pawn)
    grid[position] = pawn
    show_board()
  end

  def self.print_available_choices
    p top_left
  end
end

