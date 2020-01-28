require 'pry'
require_relative 'player'

class Game < HumanPlayer
  attr_accessor :human_player, :enemies

  def initialize(human_player)
    user = HumanPlayer.new(human_player)
    @human_player = user
    @enemies = [bot = Player.new("bot")]*4
  end

  def kill_player
    @enemies.each do |bot|
      if bot.life_points <= 0
        @enemies.delete(bot)
      end
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def shows_players
    puts "#{@human_player} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    puts "Il reste #{@ennemies.length} enemies."
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "                                "
    puts "a - chercher une meilleur arme"
    puts "b - chercher à se soigner"
    puts "                                "
    puts "attaquer un joueur en vue :"
    @enemies.each do |bot|
      print "#{@enemies.index(bot)} - #{bot.show_state}"
    end
  end

  def menu_choice
    choice = gets.chomp
    if choice == "a"
      user.search_weapon
    elsif choice == "b"
      user.search_health_pack
    elsif choice == ("0".."n")
      @enemies.each do |bot|
          @enemies.delete(bot)
      end
    end
  end

  def de
    rand(1..n)
  end
end
