require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#player1 = Player.new("Bob")
#player1 = HumanPlayer.new("Bob")
# player2 = Player.new("Joy")

# puts "Bienvenue dans votre jeu de combat 👾 :"
# puts
# puts "⬇️  Voici les combattants ⬇️"
# puts
# print "Notre premier joueur : " 
# puts "#{player1.show_state}"
# print "Notre second joueur : "
# puts "#{player2.show_state}"
# puts
# puts "BON COMBAT ! 🥊"
# puts
 
# while player1.life_points > 0 && player2.life_points > 0

#   puts player2.attacks(player1)
#   if player1.life_points <= 0
#     puts "#{player1.name} a perdu toutes ses vies. #{player2.name} remporte ce combat."
#     break
    
#   end
#   puts player1.attacks(player2)
#   if player2.life_points <= 0
#     puts "#{player2.name} a perdu toutes ses vies. #{player1.name} remporte ce combat."
#     break
#   end

# end  

#player1.search_health_pack
#player1.show_state