# Model a Library as a class.
#
# Create a class for a Library that has an array of books. Each book should be a hash with a title, which is a string, and rental details, which is another hash with a student name and due date.

# This should look something like:
#
#   {
#     title: "lord_of_the_rings",
#     rental_details: {
#      student_name: "Jeff",
#      date: "01/12/16"
#     }
#   }
#

# Create a getter for the books

# Create a method that takes in a book title and returns all of the information about that book.

# Create a method that takes in a book title and returns only the rental details for that book.

# Create a method that takes in a book title and adds it to our book list (add a new hash for the book with the student name and date being left as empty strings)

# Create a method that changes the rental details of a book by taking in the title of the book, the student renting it and the date it's due to be returned.

require("minitest/autorun")
require("minitest/rg")
require_relative("../exercise_c_library")
require("Pry")

class TestBook < MiniTest::Test

  def setup
    @my_book = Book.new("lord_of_the_rings", "Jeff", "01/12/16")
  end

  def test_details
    test_hash = {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
        }
      }
  end

end


class TestLibrary < MiniTest::Test

  def setup
    @my_lib = Library.new(
      [
        Book.new("lord_of_the_rings", "Jeff", "01/12/16"),
        Book.new("the_hobbit", "Annie", "18/02/16"),
        Book.new("the_silmarillion", "Shirley", "12/12/12")
      ]
    )
  end

  def test_titles
    assert_equal(["lord_of_the_rings", "the_hobbit", "the_silmarillion"], @my_lib.titles)
  end

  def test_info__found
    assert_equal(
        {
          title: "lord_of_the_rings",
          rental_details: {
           student_name: "Jeff",
           date: "01/12/16"
          }
        },
        @my_lib.info("lord_of_the_rings"))
  end

  def test_info__not_found
    assert_nil(@my_lib.info("a_game_of_thrones"))
  end

  def test_rental_details__found
    assert_equal({student_name: "Jeff", date: "01/12/16"}, @my_lib.rental_details("lord_of_the_rings"))
  end

  def test_rental_details__not_found
    assert_nil(@my_lib.rental_details("a_game_of_thrones"))
  end

  def test_add_book
    @my_lib.add_book("a_game_of_thrones")
    assert_equal(4, @my_lib.titles.length)
  end

  def test_change_rental_details__found
    @my_lib.change_rental_details("lord_of_the_rings", "Dafydd", "12/12/12")
    assert_equal({student_name: "Dafydd", date: "12/12/12"}, @my_lib.rental_details("lord_of_the_rings"))
  end

  def test_change_rental_details__not_found
    @my_lib.change_rental_details("a_game_of_thrones", "Dafydd", "12/12/12")
    assert_nil(@my_lib.rental_details("a_game_of_thrones"))
  end

end
