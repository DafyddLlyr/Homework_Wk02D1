# Now we would like you to make a class that represents a sports team.
#
# Make a class to represent a Team that has the properties Team name (String), Players (array of strings) and a Coach (String).

# For each property in the class make a getter method than can return them.

# Create a setter method to allow the coach's name to be updated.

# Refactor the class to use attr_reader or attr_accessor instead of your own getter and setter methods.

# Create a method that adds a new player to the players array.

# Add a method that takes in a string of a player's name and checks to see if they are in the players array.

# Add a points property into your class that starts at 0.

# Create a method that takes in whether the team has won or lost and updates the points property for a win.

class SportsTeam

  attr_reader :team_name
  attr_accessor :coach, :players, :points
  def initialize(team_name, players, coach)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = 0
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def include_player?(player)
    return @players.include?(player)
  end

  def play_game(result)
    @points += 1 if result == "win"
  end

# Refactored the below way to use attr_reader and attr_accessor
  # def get_name
  #   return @team_name
  # end
  #
  # def get_players
  #   return @players
  # end
  #
  # def get_coach
  #   return @coach
  # end
  #
  # def set_coach(new_coach)
  #   @coach = new_coach
  # end


end
