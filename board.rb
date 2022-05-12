class Board
  attr_accessor :grid
  attr_reader :top_left, :top, :top_right
  
  def initialize
    @grid = []
    create_board()
    show_board()
  end
  
  def create_board
    3.times do |x|
      row = []
      3.times { |y| row.push(" ") }
      grid.push(row)
    end
  end

  def show_board
    print "Column   1    2    3\n"
    print "Row 1: #{grid[0]}\nRow 2: #{grid[1]}\nRow 3: #{grid[2]}\n"
  end

  def get_current_board
    @grid
  end

  def update_board(row, column, pawn)
    @grid[row - 1][column - 1] = pawn
    show_board()
  end

  def self.print_available_choices
    p top_left
  end
end

