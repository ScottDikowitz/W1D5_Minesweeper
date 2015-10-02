require_relative 'tile'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(9) { Array.new(9) }
  end

  def populate
    tiles = []
    board.each_index do |i|
      board[i].each_index do |j|
        tiles << [i, j]

      end
    end
    tiles.shuffle!
  end
end
