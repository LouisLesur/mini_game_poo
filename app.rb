require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def etat_des_joueurs(player1, player2)
  puts "Voici l'état de nos joueur :"
  player1.show_state
  player2.show_state
end

def phase_attaque(player1, player2)
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  player2.attacks(player1)
end

def combat
  player1 = Player.new("Josianne")
  player2 = Player.new("José")
  loop do
    etat_des_joueurs(player1, player2)
    puts "---------------------------"
    phase_attaque(player1, player2)
    puts "---------------------------"
    break if player1.life_points <= 0 || player2.life_points <= 0
  end
  if player1.life_points <= 0
    puts "Le joueur #{player2.name} a vaincu !"
  elsif player2.life_points <= 0
    puts "Le joueur #{player1.name} a vaincu !"
  end
end

combat
