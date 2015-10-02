#require 'byebug'
class Tile
  NEIGHBORS = [
    [ 0 ,  1],
    [ 1 ,  1],
    [ 1 ,  0],
    [ 0 , -1],
    [-1 , -1],
    [-1 ,  0],
    [-1 ,  1]
  ]

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
#    byebug
    NEIGHBORS.each do |neighbor|
      position = [neighbor.first + pos.first, neighbor.last + pos.last]
      if position.all? {|x| x.between?(0,8) }
          store << @board[position]
      end
    end

    store
  end

  def neighbors=

  end

  def reveal
    self.revealed = true
  end

  def neighbors_with_bombs
    self.neighbors.select do |neighbor|
      neighbor.has_bomb
    end

  end

  def change_flag
    self.flag = (self.flag ? false : true)
  end

  def to_s
    if @revealed
      if neighbors_with_bombs.count == 0
        "_"
      else
        neighbors_with_bombs.count.to_s
      end
    elsif @flag
      'f'
    else
      '*'
    end
  end

end
