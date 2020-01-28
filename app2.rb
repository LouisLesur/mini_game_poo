require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def message_intro
  puts " _________________________"
  puts "|     Entrez dans le      |"
  puts "|     DONJON  MORTEL      |"
  puts " -------------------------"
  puts "| Survivrez-vous a cette  |"
  puts "|       Aventure ?        |"
  puts "|_________________________|"
end

def start
  puts "Entrer votre nom de guerrier :"
  print "> "
  user_name = gets.chomp
  return user_name
end


def end_of_the_game(user, player1, player2)
  if user.life_points <= 0
    puts "Game Over"
  elsif player1.life_points <= 0 && player2.life_points <= 0
    puts "Bravo tu as vaincu le DONJON MORTEL !"
  end
end

def etat_du_joueurs(user)
  puts "Voici l'état de notre guerrier :"
  user.show_state
end

def action_user(user, player1, player2)
  puts "Quelle action veux-tu effectuer ?"
  puts "                                "
  puts "a - chercher une meilleur arme"
  puts "b - chercher à se soigner"
  puts "                                "
  puts "attaquer un joueur en vue :"
  if player1.life_points <= 0
    puts "#{player1.name} est mort"
  else
    puts "0 - #{player1.show_state}"
  end
  if player2.life_points <= 0
    puts "#{player2.name} est mort"
  else
    puts "1 - #{player2.show_state}"
  end
  choice = gets.chomp
  if choice == "a"
    user.search_weapon
  elsif choice == "b"
    user.search_health_pack
  elsif choice == "0"
    user.attacks(player1)
    puts "___"
  elsif choice == "1"
    user.attacks(player2)
    puts "___"
  else
    puts "Entre les touches demander, fdp"
  end
end

def action_ennemie(user, enemies)
  enemies.each do |mob|
    if mob.life_points > 0
      mob.attacks(user)
      puts "___"
    end
  end
end

def game
  enemies = []
  enemies << player1 = Player.new("Josianne")
  enemies << player2 = Player.new("José")
  message_intro
  user_name = start
  user = HumanPlayer.new(user_name)
  loop do
    etat_du_joueurs(user)
    puts "---------------"
    action_user(user, player1, player2)
    action_ennemie(user, enemies)
    break if player1.life_points <= 0 && player2.life_points <= 0 || user.life_points <= 0
  end
  end_of_the_game(user, player1, player2)
end

game
