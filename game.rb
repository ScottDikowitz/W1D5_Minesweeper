require_relative 'board'
require_relative 'tile'

class Game

  def initialize
      @board = Board.new
  end

  def display
    @board.board.map do |row|
      row.join(|)
    end

  end

end
