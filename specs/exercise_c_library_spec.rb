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

class TestLibrary < MiniTest::Test

  def setup
    @test_library = Library.new(
      [{
        title: "lord_of_the_rings",
        rental_details: {
         student_name: "Jeff",
         date: "01/12/16"
        }
      },
      {
        title: "the_hobbit",
        rental_details: {
         student_name: "Annie",
         date: "18/02/14"
        }
      },
      {
        title: "the_silmarillion",
        rental_details: {
         student_name: "Shirley",
         date: "12/12/12"
        }
      }]
    )
  end

  def test_get_books
    assert_equal(["lord_of_the_rings", "the_hobbit", "the_silmarillion"], @test_library.book_titles)
  end

  def test_book_details__found
    assert_equal(@test_library.books[0], @test_library.book_details("lord_of_the_rings"))
  end

  def test_book_details__not_found
    assert_nil(@test_library.book_details("a game of thrones"))
  end

  def test_rental_details__found
    assert_equal(@test_library.books[0][:rental_details], @test_library.rental_details("lord_of_the_rings"))
  end

  def test_rental_details__not_found
    assert_nil(@test_library.rental_details("a game of thrones"))
  end

  def test_add_book
    @test_library.add_book("a game of thrones")
    assert_equal(4, @test_library.books.length)
  end

  def test_amend_rental__found
    @test_library.amend_rental("lord_of_the_rings", "Dafydd", "01/01/19")
    assert_equal(@test_library.books[0][:rental_details], @test_library.rental_details("lord_of_the_rings"))
  end

  def test_amend_rental__not_found
    assert_nil(@test_library.amend_rental("a game of thrones", "Dafydd", "01/01/19"))
  end



end
