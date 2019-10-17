def game_hash
    home_team = 'Alan Anderson	Reggie Evans	Brook Lopez	Mason Plumlee	Jason Terry
    Number	0	30	11	1	31
    Shoe	16	14	17	19	15
    Points	22	12	17	26	19
    Rebounds	12	12	19	11	2
    Assists	12	12	10	6	2
    Steals	3	12	3	3	4
    Blocks	1	12	1	8	11
    Slam Dunks	1	7	15	5	1'
    away_team = 'Jeff Adrien	Bismack Biyombo	DeSagna Diop	Ben Gordon	Kemba Walker
    Number	4	0	2	8	33
    Shoe	18	16	14	15	15
    Points	10	12	24	33	6
    Rebounds	1	4	12	3	12
    Assists	1	7	12	2	12
    Steals	2	22	4	1	7
    Blocks	7	15	5	1	5
    Slam Dunks	2	10	5	0	12'
    
    home_team_arr = home_team.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(" ")
    away_team_arr = away_team.gsub(/\s+/m, ' ').gsub(/^\s+|\s+$/m, '').split(" ")
    hash = {}
    hash[:home] = {:team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => []}
    hash[:away] = {:team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"],
      :players => []}
      j = 0
      
      while j < 5
      hash[:home][:players][j] = {}
      hash[:home][:players][j][:players_name] = home_team_arr[j*2] +" " + home_team_arr[j*2+1]
      hash[:home][:players][j][:number] = home_team_arr[11+j].to_i
      hash[:home][:players][j][:shoe] = home_team_arr[17+j].to_i
      hash[:home][:players][j][:points] = home_team_arr[23+j].to_i
      hash[:home][:players][j][:rebounds] = home_team_arr[29 +j].to_i
      hash[:home][:players][j][:assists] = home_team_arr[35 +j].to_i
      hash[:home][:players][j][:steals] = home_team_arr[41 +j].to_i
      hash[:home][:players][j][:blocks] = home_team_arr[47 +j].to_i
      hash[:home][:players][j][:slam_dunks] = home_team_arr[54 +j].to_i
      j += 1
      end
    
      j = 0
      while j < 5
        hash[:away][:players][j] = {}
        hash[:away][:players][j][:players_name] = away_team_arr[j*2] +" " + away_team_arr[j*2+1]
        hash[:away][:players][j][:number] = away_team_arr[11+j].to_i
        hash[:away][:players][j][:shoe] = away_team_arr[17+j].to_i
        hash[:away][:players][j][:points] = away_team_arr[23+j].to_i
        hash[:away][:players][j][:rebounds] = away_team_arr[29 +j].to_i
        hash[:away][:players][j][:assists] = away_team_arr[35 +j].to_i
        hash[:away][:players][j][:steals] = away_team_arr[41 +j].to_i
        hash[:away][:players][j][:blocks] = away_team_arr[47 +j].to_i
        hash[:away][:players][j][:slam_dunks] = away_team_arr[54 +j].to_i
        j += 1
        end
        return hash
    end
    
    def num_points_scored(name)
      j = 0
      while j < 5
      if game_hash[:home][:players][j][:players_name] == name
        return game_hash[:home][:players][j][:points].to_i
      end
      j += 1
    end 
    j = 0
    while j < 5
      if game_hash[:away][:players][j][:players_name] == name
        return game_hash[:away][:players][j][:points].to_i
      end
      j += 1
    end
    end
    
    def shoe_size(name)
      j = 0
      while j < 5
      if game_hash[:home][:players][j][:players_name] == name
        return game_hash[:home][:players][j][:shoe].to_i
      end
      j += 1
    end 
    j = 0
    while j < 5
      if game_hash[:away][:players][j][:players_name] == name
        return game_hash[:away][:players][j][:shoe].to_i
      end
      j += 1
    end
    end
    
    def team_colors(team)
      if game_hash[:away][:team_name] == team
        return game_hash[:away][:colors]
      elsif game_hash[:home][:team_name] == team 
        return game_hash[:home][:colors]
      end
    end
    
    def team_names
      return [game_hash[:away][:team_name], game_hash[:home][:team_name]]
    end
    
    def player_numbers(team)
       if game_hash[:away][:team_name] == team
        j = 0 
        arr = []
        while j < 5 
        arr << game_hash[:away][:players][j][:number].to_i
        j +=1 
      end
      elsif game_hash[:home][:team_name] == team 
        j = 0 
        arr = []
        while j < 5 
        arr << game_hash[:home][:players][j][:number].to_i
        j +=1 
      end
    end
      return arr
      end
    def player_stats(name)
       j = 0
      while j < 5
      if game_hash[:home][:players][j][:players_name] == name
        arr = game_hash[:home][:players][j]
        arr.delete(:players_name)
      end
      j += 1
    end 
    j = 0
    while j < 5
      if game_hash[:away][:players][j][:players_name] == name
        arr = game_hash[:away][:players][j]
        arr.delete(:players_name)
      end
      j += 1
    end
    return arr
    end
    
  def big_shoe_rebounds
    max = 0
    rebounds = 0
       j = 0
      while j < 5
      if game_hash[:home][:players][j][:shoe] > max
        max = game_hash[:home][:players][j][:shoe]
        rebounds = game_hash[:home][:players][j][:rebounds]
      end
      j += 1
    end 
    j = 0
    while j < 5
     if game_hash[:away][:players][j][:shoe] > max
        max = game_hash[:away][:players][j][:shoe]
        rebounds = game_hash[:away][:players][j][:rebounds]
      end
      j += 1
    end
    return rebounds
  end
def most_points_scored
  max = 0
  name = ""
       j = 0
      while j < 5
      if game_hash[:home][:players][j][:points] > max
        max = game_hash[:home][:players][j][:points]
        name = game_hash[:home][:players][j][:players_name]
      end
      j += 1
    end 
    j = 0
    while j < 5
     if game_hash[:away][:players][j][:points] > max
        max = game_hash[:away][:players][j][:points]
        name = game_hash[:away][:players][j][:players_name]
      end
      j += 1
    end
    return name
end
    
  def winning_team
    home_points = 0 
    away_points = 0 
    
    j = 0
    while j < 5
      home_points += game_hash[:home][:players][j][:points]
      j += 1
    end 
    j = 0
    while j < 5
      away_points += game_hash[:away][:players][j][:points]
      j += 1
    end
    if home_points > away_points
      return game_hash[:home][:team_name]
    else return game_hash[:away][:team_name]
    end
  end
  
  def player_with_longest_name
     max = 0
  name = ""
       j = 0
      while j < 5
      if game_hash[:home][:players][j][:players_name].length > max
        max = game_hash[:home][:players][j][:players_name].length
        name = game_hash[:home][:players][j][:players_name]
      end
      j += 1
    end 
    j = 0
    while j < 5
     if game_hash[:away][:players][j][:players_name].length > max
        max = game_hash[:away][:players][j][:players_name].length
        name = game_hash[:away][:players][j][:players_name]
      end
      j += 1
    end
    return name
  end
  
  def long_name_steals_a_ton?
    long_name = player_with_longest_name
    max = 0
  name = ""
       j = 0
      while j < 5
      if game_hash[:home][:players][j][:steals] > max
        max = game_hash[:home][:players][j][:steals]
        name = game_hash[:home][:players][j][:players_name]
      end
      j += 1
    end 
    j = 0
    while j < 5
     if game_hash[:away][:players][j][:steals] > max
        max = game_hash[:away][:players][j][:steals]
        name = game_hash[:away][:players][j][:players_name]
      end
      j += 1
    end
    if name == long_name
      return true 
    else 
      return false
  end
  end