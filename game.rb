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

  def game_lost
    puts "Game over!"
  end

  def game_won?
    @board.board.flatten.select{|x| !x.revealed}.all?(&:has_bomb?)
  end

  def move_valid?(pos)

      return true if pos.count == 2 && pos.all?{ |x| (0..8).cover?(x) } &&
      !pos_to_tile(pos).revealed?

      puts "That is an invalid move."
      return false

  end

  def run

    while true

        valid = false
        until move.valid?(pos)
          puts "Please enter your coordinates. ex. 4,2"
          move = gets.chomp
          pos = string.split(',').map(&:to_i)
          valid = move_valid?(pos)
        end
        if pos_to_tile(pos).has_bomb
          self.game_lost
          break
        end

        if game_won?
          p "You won!"
          break
        end


    end
  end

end
