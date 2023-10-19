# show.rb
require 'bundler'
Bundler.require

class Show
  def display_board(board)
    puts "  1 2 3"
    ('A'..'C').each do |row|
      print "#{row} "
      (1..3).each do |col|
        position = "#{row}#{col}"
        print "#{board.board_cases[position].content} "
      end
      puts
    end
  end
end
