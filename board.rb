require_relative 'tile'
#require 'byebug'
class Board
  BOARD_SIZE = 9
  NUM_BOMBS = 10
  attr_reader :board

  def initialize()
    # board_size =
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }

    populate
    #byebug
    p @board
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
      if idx < NUM_BOMBS
        self[tiles.last] = Tile.new(true, self, tiles.pop)
      else
        self[tiles.last] = Tile.new(false, self, tiles.pop)
      end
      idx += 1
    end
  end

  def []=(pos, tile)
    x, y = pos
    @board[x][y] = tile
  end
  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def inspect
    "Board populated!"
  end

end

if __FILE__ == $PROGRAM_NAME
  a = Board.new
  p a.board[0][0].neighbors_with_bombs
  p board
end
