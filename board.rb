require_relative 'tile'

class board
  attr_reader :board

  def initialize
    @board = Array.new(9) { Array.new(9) }
  end

  def populate
    board.each_index
  end

end
