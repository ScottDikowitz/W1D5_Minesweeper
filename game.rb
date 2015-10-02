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

  end

end
