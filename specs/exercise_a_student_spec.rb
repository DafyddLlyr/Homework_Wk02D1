# For this part we want you to make a class that represents a CodeClan student.

# Create a class called Student that takes in a name (String) and a cohort (string - e.g "E18", "G6", etc) when an new instance is created.

# Create a couple of Getter methods, one that returns the name property and one that returns the cohort property of the student.

# Add in Setter methods to update the students name and what cohort they are in.

# Create a method that gets the student to talk (eg. Returns "I can talk!).

# Create a method that takes in a students favourite programming language and returns it as part of a string (eg. student1.say_favourite_language("Ruby") -> "I love Ruby").

require("minitest/autorun")
require("minitest/rg")
require_relative("../exercise_a_student")

class TestStudent < MiniTest::Test

  def setup
    @student = Student.new("Dafydd", "G13")
  end

  def test_get_name
    assert_equal("Dafydd", @student.get_name)
  end

  def test_get_cohort
    assert_equal("G13", @student.get_cohort)
  end

  def test_set_name
    @student.set_name("Bob")
    assert_equal("Bob", @student.get_name)
  end

  def test_set_cohort
    @student.set_cohort("E13")
    assert_equal("E13", @student.get_cohort)
  end

  def test_talk
    assert_equal("I can talk!", @student.talk)
  end

  def test_say_favourite_language
    assert_equal("I love Ruby", @student.say_favourite_language("Ruby"))
  end

end
