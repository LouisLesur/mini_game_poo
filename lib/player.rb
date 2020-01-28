class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
  end

  def attacks(other_player)
    puts "#{@name} attaque #{other_player.name}"
    damage = compute_damage
    other_player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages."
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name)
    super(player_name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleur que ton arme actuelle : tu la prends."
    elsif new_weapon <= @weapon_level
      puts "Bof... elle n'est pas mieux que ton arme actuelle : tu la laisses."
    end
  end

  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "Tu n'as rien trouver..."
    elsif result = 1..5
      puts "Bravo, tu as trouver un pack de +50 points de vie !"
      @life_points = @life_points + 50
    elsif result == 80
      puts "Woaw, tu as trouver un pack de +80 points de vie !"
      @life_points = @life_points +  80
    end
    to_much
  end

  def to_much
    if @life_points > 100
      @life_points = 100
    end
  end
end
