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

class Library

  attr_reader :book_titles, :books
  def initialize(books)
    @books = books
    @book_titles = []

    for book in books
      @book_titles.push(book[:title])
    end
  end

  def book_details(book_name)
    if book_titles.include?(book_name)
      for book in @books
        return book if book_name == book[:title]
      end
    end
    return nil
  end

  def rental_details(book_name)
    if book_titles.include?(book_name)
      for book in @books
        return book[:rental_details] if book_name == book[:title]
      end
    end
    return nil
  end

  def add_book(book_name)
    @books.push(
      {
      title: book_name,
      rental_details: {
        student_name: "",
        date: ""
      }
      } )
  end

  def amend_rental(book_name, student, date)
    if book_titles.include?(book_name)
      for book in @books
        if book_name = book[:title]
          book[:rental_details][:student] = student
          book[:rental_details][:date] = date
        end
      end
    end
    return nil
  end

end
