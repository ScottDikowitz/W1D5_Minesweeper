require_relative 'tile'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(9) { Array.new(9) }

    populate
  end

  def populate
    tiles = []

    board.each_index do |i|
      board[i].each_index do |j|
        tiles << [i, j]
      end
    end
    tiles.shuffle!
    idx = 0
    until tiles.empty?
      if idx < 10
        self[tiles.last] = Tile.new(true, board, tiles.pop)
      else
        self[tiles.last] = Tile.new(false, board, tiles.pop)
      end
      idx += 1
    end
  end

  def []=(pos, tile)
    x, y = pos
    @board[x][y] = tile
  end




end
