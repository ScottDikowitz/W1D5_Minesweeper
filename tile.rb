class Tile
  attr_reader :has_bomb
  attr_accessor :flag :revealed

  def initialize(has_bomb)
    @has_bomb = has_bomb
    @flag = false
    @revealed = false
  end

  def reveal
    self.revealed = true
  end

  def change_flag
    self.flag = (self.flag ? false : true)
  end

end
