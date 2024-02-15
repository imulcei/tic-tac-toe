class Players
  attr_accessor :name, :symbol

  #initialize the player class
  def initialize(name, symbol, board)
    @name = name
    @symbol = symbol
    @board = board
  end

  #update the board
  def move(cell)
    @board.update_cell(cell, self.symbol)
  end

  #winning combinations + checking tokens in array
  def winner?
    winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    winning.each do |win|
      values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.symbol.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
    end
    false
  end

  #link the cells to player class
  private
  def cells
    @board.cells
  end
end
