def points_per_player(player, hashketball)
  player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:stats][:points]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:stats][:points]
  else
   "No player found."
  end
end

puts points_per_player("blanko", hashketball)

#

# Return the shoe size for any player:

def player_shoe_size(player, hashketball)
  player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:shoe_size]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:shoe_size]
  else
   "No player found."
  end
end

puts player_shoe_size("taz", hashketball)


#

# Return both colors for any team:

def team_colors(team, hashketball)
  sym = team.to_sym
  if hashketball.include?(sym)
   hashketball[sym][:colors]
  else
   "Try home or away."
  end
end

puts team_colors("away", hashketball)

#

# Return both teams names:

def team_names(hashketball)
  puts "The #{hashketball[:home][:team_name]} welcome the #{hashketball[:away][:team_name]}"
  puts 
end

puts team_names(hashketball)

#

# Return all the player numbers for a team:

def player_nums(team, hashketball)
    sym = team.to_sym
    player_numbers = []
    
      hashketball[sym][:players].each_value do |x|
      player_numbers << x[:number]
  end
    player_numbers
end

puts player_nums("away", hashketball)


# Return all the stats for a player:

def player_stats(player_name, hashketball)
  player_name.capitalize!
  if hashketball[:home][:players].include?(player_name)
    hashketball[:home][:players][player_name][:stats]
  elsif hashketball[:away][:players].include?(player_name)
    hashketball[:away][:players][player_name][:stats]
  else
    "No player found."
  end
end

puts player_stats("Daffy", hashketball)

#

# Return the rebounds for the player with the largest shoe size

def biggest_shoe(hashketball)
  player_number_with_biggest_shoe = ""
  biggest_shoe_size = 0
  
  hashketball[:home][:players].each do |name, player|
    if player[:shoe_size] > biggest_shoe_size
      player_number_with_biggest_shoe = name
      biggest_shoe_size = player[:shoe_size]
    end
  end
  hashketball[:away][:players].each do |name, player|
    if player[:shoe_size] > biggest_shoe_size
      player_number_with_biggest_shoe = name
      biggest_shoe_size = player[:shoe_size]
    end
  end
  
  " #{player_number_with_biggest_shoe} : #{biggest_shoe_size} "
end

puts biggest_shoe(hashketball)
  