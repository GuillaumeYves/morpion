# board.rb

require_relative 'board_case'

class Board
  attr_accessor :board_cases

  def initialize
    @board_cases = {}
    ('A'..'C').each do |row|
      (1..3).each do |col|
        position = "#{row}#{col}"
        @board_cases[position] = BoardCase.new(position)
      end
    end
  end

 def display_board
    horizontal_line = "  |---|---|---|"
    puts "    1   2   3 "
    puts "  -------------"
    ('A'..'C').each do |row|
      print "#{row} "
      (1..3).each do |col|
        position = "#{row}#{col}"
        print "| #{@board_cases[position].content} "
      end
      puts "|"
      puts horizontal_line
    end
  end

  def valid_move?(position)
    @board_cases.key?(position) && @board_cases[position].content == " "
  end

  def mark_position(position, symbol)
    if valid_move?(position)
      @board_cases[position].content = symbol
      true
    else
      false
    end
  end

  def board_full?
    @board_cases.all? { |_, board_case| board_case.content != " " }
  end

def check_winner(symbol)
  winning_combinations = [
    ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], # Colonnes
    ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], # Lignes
    ["A1", "B2", "C3"], ["A3", "B2", "C1"] # Diagonales
  ]
  winning_combinations.each do |combo|
    if combo.all? { |position| @board_cases[position].content == symbol }
      return true
    end
  end

  false
 end
end


