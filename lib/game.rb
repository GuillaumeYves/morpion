# game.rb
require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @players = [Player.new("Joueur 1", "x"), Player.new("Joueur 2", "o")]
    @current_player = @players[0]
    @board = Board.new
  end

  def switch_player
    @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
  end


  def play
    puts "\n"
    puts " - Bienvenue dans le jeu du Morpion!"
    puts "\n"

    current_player = @players[0]

    loop do
      @board.display_board
      puts "\n"
      puts "\n"
      puts " - #{current_player.name}, c'est à vous de jouer. Choisissez une case (exemple: A1) :"
      puts "\n"
      print ">"
      position = gets.chomp.upcase
      puts "\n"

      if @board.valid_move?(position)
        @board.mark_position(position, current_player.symbol)
        if @board.check_winner(current_player.symbol)
          @board.display_board
          puts "\n"
          puts " - #{current_player.name} a gagné !"
          puts "\n"
          break

        elsif @board.board_full?
          @board.display_board
          puts "\n"
          puts " - Match nul !"
          puts "\n"
          break

        else
          current_player = (current_player == @players[0]) ? @players[1] : @players[0]
        end

      else
        puts " - Mouvement invalide. Réessayez."
        puts "\n"
        print ">"
        puts "\n"
      end
    end
  end
end


