require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

 

puts "-------------------------------------------------"
puts "|        ⭐ WELCOME TO THE FIGHT GAME ⭐️        |" 
puts "|           Who will be the last one ⁉️          |"
puts "-------------------------------------------------"
puts
puts
puts "Choose your name"
new_player = HumanPlayer.new(gets.chomp.to_s)
puts "Welcome #{new_player.name} !"
enemies = [player1 = Player.new("Bob"), player2 = Player.new("Joy")]

while new_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "#{new_player.show_state}"
  puts "What do you want to do ?"
  puts "a - seek a better weapon"
  puts "s - cure"
  puts
  puts "Attack enemies :"
  puts "0 - #{player2.name} a #{player2.life_points} point(s) of life."
  puts "1 - #{player1.name} a #{player1.life_points} point(s) of life."

  strategy = gets.chomp.to_s
  case

  when strategy == "a"
    new_player.search_weapon 
  when strategy == "s"
    new_player.search_health_pack
  when strategy == "0"
    new_player.attacks(player2)
  when strategy == "1"
    new_player.attacks(player1)
  end
  puts

  if player1.life_points > 0 || player2.life_points > 0
  puts "The enemies attack you !"
  end
  
  enemies.each do |enemy|
    enemy.attacks(new_player) if enemy.life_points > 0
  end 

  if new_player.life_points <= 0
  puts "😔 YOU LOOSE - YOU DEAD 😔"    
    break
  end
  if player1.life_points <= 0 && player2.life_points <= 0
    puts "🤩 YOU WIN - THE ENEMIES ARE DEAD 🤩"
    break
  end

end
puts "❌ GAME OVER ❌"


