require_relative 'lib/board'
require_relative 'lib/players'

class Game
  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @player_turn = 0
  end

  #start the game + winning conditions
  def start_game
    names = get_names
    @player1 = Players.new(names[0], :X, @board)
    @player2 = Players.new(names[1], :O, @board)
    @current_player = @player1
    @board.display_board
    player_turn until @winner || @player_turn == 9
    if @winner
      puts "#{@winner.name} wins!"
    else
      puts "Tie Game!"
    end
  end

  #the player choose a number between 1 and 9
  private
  def player_turn
    puts "#{@current_player.name}\', please choose your cell (1-9) :"
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "A number between 1 and 9 please."
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @player_turn += 1
      switch_player
    end
  end

  #player changes
  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  #get the players names
  def get_names
    puts "Put a name for the Player X :"
    name1 = gets.chomp
    puts "Put a name for the Player O :"
    name2 = gets.chomp
    [name1, name2]
  end
end

game = Game.new
game.start_game