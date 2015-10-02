require_relative 'board'
require_relative 'tile'

class Game

  def initialize
      @board = Board.new
  end

  def display
    puts "  #{(0..8).to_a.join('   ')}"
    @board.board.map.with_index do |row, index|
      puts "#{index} #{row.join(' | ')}"
      puts " " + ("-" * 35)
    end
    nil
  end

  def pos_to_tile(pos)
    @board[pos]
  end

  def reveal(tile)
    tile.reveal unless tile.has_bomb

    tile.neighbors.each do |neighbor|
      reveal(neighbor) unless neighbor.reveal
    end

    nil
  end

  def move_valid?(pos)

      return true if pos.count == 2 && pos.all?{ |x| (0..8).cover?(x) } &&
      !pos_to_tile(pos).revealed?

      return false

  end

  def run
    valid = false
    until valid
      puts "Please enter your coordinates. ex. 4,2"
      move = gets.chomp
      pos = string.split(',').map(&:to_i)
      move_valid?(pos)
    end
  end

end
