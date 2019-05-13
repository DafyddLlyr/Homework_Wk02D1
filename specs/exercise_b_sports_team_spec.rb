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

require("minitest/autorun")
require("minitest/rg")
require_relative("../exercise_b_sports_team")

class TestSportsTeam < MiniTest::Test

  def setup
    @test_team = SportsTeam.new("The Avengers", ["Ironman", "Hulk", "Captain America", "Black Widow", "Thor", "Hawkeye"], "Nick Fury")
  end

  def test_get_team_name
    assert_equal("The Avengers", @test_team.team_name)
  end

  def test_get_players
    assert_equal(["Ironman", "Hulk", "Captain America", "Black Widow", "Thor", "Hawkeye"], @test_team.players)
  end

  def test_get_coach
    assert_equal("Nick Fury", @test_team.coach)
  end

  def test_set_coach
    @test_team.coach = "Professor X"
    assert_equal("Professor X", @test_team.coach)
  end

  def test_add_player
    @test_team.add_player("Spider-Man")
    assert_equal(7, @test_team.players.length) #Have I really checked Spiderman has been added?
  end

  def test_include_player__true
    assert_equal(true, @test_team.include_player?("Hulk"))
  end

  def test_include_player__false
    assert_equal(false, @test_team.include_player?("Wolverine"))
  end

  def test_play_game__win
    @test_team.play_game("win")
    assert_equal(1, @test_team.points)
  end

  def test_play_game__lose
    @test_team.play_game("lose")
    assert_equal(0, @test_team.points)
  end

end
