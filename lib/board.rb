class Board
  attr_accessor :cells
  
  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end

  #update the array according to the player's inputs while ensuring the cell is empty
  def update_cell(number, symbol)
    if cell_free?(number)
      self.cells[number - 1] = symbol.to_s
      display_board
    else
      puts "The cell is taken !"
      return false
    end
  end

  #display the board
  def display_board
    row1 = " " + self.cells[0..2].join(" ")
    row2 = " " + self.cells[3..5].join(" ")
    row3 = " " + self.cells[6..8].join(" ")
    system("clear")
    puts row1
    puts row2
    puts row3
  end

  #update the board's cell with player's choice
  def cell_free?(number)
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end
end
