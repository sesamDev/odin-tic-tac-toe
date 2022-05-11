class Board
  def initialize
    @@grid = []
    create_board()
    show_board()
  end

  def create_board
    n = 1
    3.times do |x|
      row = []
      3.times { |y| row.push(" ") }
      @@grid.push(row)
    end
  end

  def show_board
    p @@grid[0]
    p @@grid[1]
    p @@grid[2]
  end
  
end

