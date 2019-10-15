#require 'rubygems'
#-------Pour le scrapping-------
#require 'nokogiri'
#require 'open-uri'
#-------Pour simuler un navigateur-------
#require 'watir'
#require 'launchy'
#-------Pour les tests------
require 'pry'



class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name.to_s
    @life_points = 10
  
  end

  def show_state
    puts "#{name} has #{life_points} point(s) of life."
  end

  def gets_damage(damage)
    damage = damage.to_i
    @life_points -= damage
    if life_points <= 0
      puts "#{name} is dead.⚰️"
    else 
      return show_state
    end
  end

  def attacks(victim)
    puts "#{name} attacks #{victim.name}"
    victim_damage = compute_damage

    puts "He/She gives a loss of #{victim_damage} point(s)."
    victim.gets_damage(victim_damage)
  end

  def compute_damage
    return rand(1..6)
  end

end



class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end
  
  def show_state
    puts "#{name} has #{life_points} point(s) of life and a weapon of level #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "You found a weapon of level #{new_weapon}"

    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "YEAH ! It is better than your. You take it !"
    
    elsif new_weapon <= weapon_level
      puts "This weapon has the same level that your present weapon."
    end    
  end

  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "You didn't find anything"

    elsif result.between?(2,5)
      @life_points += 50
      @life_points = 100 if @life_points > 100
      puts "CONGRATULATION ! You found a 50 pack of point of life."

    else result == 6
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "OMG !! You found a 80 pack of point of life."
    end
  end
end
