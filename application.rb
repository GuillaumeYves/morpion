require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/show'

class Application

  def run

    loop do
      game = Game.new
      game.play
      valid_response = false

      until valid_response
        puts "Voulez-vous rejouer ? (Oui/Non)"
        puts "\n"
        print "> "
        replay = gets.chomp.downcase

        if replay == "oui" || replay == "non"
          valid_response = true

        else
          puts "Désolé je n'ai pas compris. Veuillez répondre avec 'oui' ou 'non'."
        end
      end
      
      break if replay == "non"
    end
    puts "\n"
    puts "Merci d'avoir joué !"
    puts "\n"
  end
end

Application.new.run