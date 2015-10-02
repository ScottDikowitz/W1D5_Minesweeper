require_relative 'board'
require_relative 'tile'

class Game

  def initialize
      @board = Board.new
  end

  def display
    puts "  #{(0..8).to_a.join('   ')}"
    @board.board.each.with_index do |row, index|
      puts "#{index} #{row.join(' | ')}"
      puts " " + ("-" * 35)
    end
    nil
  end

  def pos_to_tile(pos)
    @board[pos]
  end

  def reveal(tile)
    unless tile.has_bomb

      tile.reveal
        unless tile.neighbors_with_bombs.count > 0
          tile.neighbors.each do |neighbor|
            reveal(neighbor) unless neighbor.revealed
          end
        end
    end

    nil
  end

  def game_lost
    puts "Game over!"
  end

  def game_won?
    var = @board.board.flatten.select{|x| !x.revealed}.all?(&:has_bomb)
    if var == true
      p "You won!"
      system('clear')
      display
      return true
    end
    false
  end

  def move_valid?(pos)

      return true if (pos.count == 2) && (pos.all?{ |x| (0..8).cover?(x) }) &&
      (!pos_to_tile(pos).revealed)

      puts "That is an invalid move."
      return false

  end

  def get_input
    valid = false

    until valid
      puts "Please enter your coordinates. ex. 4,2"
      move = gets.chomp
      pos = move.split(',').map(&:to_i).reverse!
      valid = move_valid?(pos)
    end

    pos
  end

  def run

    until game_won?
      system('clear')
      display
      pos = get_input

      if pos_to_tile(pos).has_bomb
        self.game_lost
        break
      else
        reveal(pos_to_tile(pos))
      end
    end
  end
end
