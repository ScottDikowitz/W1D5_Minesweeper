class Tile
  NEIGHBORS = [[0,1], [1, 1], [1, 0], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
  attr_reader :has_bomb
  attr_accessor :flag, :revealed, :pos

  def initialize(has_bomb, board, pos)
    @has_bomb = has_bomb
    @flag = false
    @revealed = false
    @board = board
    @pos = pos
  end

  def neighbors
    store = []
    NEIGHBORS.each do |neighbor|
      position = [neighbor.first + pos.first, neighbor.last + pos.last]
      if position.all? {|x| x.between?(0,8) }
          store << position
      end
    end

    store
  end

  def reveal
    self.revealed = true
  end

  def change_flag
    self.flag = (self.flag ? false : true)
  end



end
