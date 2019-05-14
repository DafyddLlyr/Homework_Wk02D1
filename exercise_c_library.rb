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

  attr_reader :book_list
  def initialize(book_list)
    @book_list = book_list
  end

  def titles
    result = []
    for book in @book_list
      result.push(book.details[:title])
    end
    return result
  end

  def info(book_name)
    for book in @book_list
      return book.details if book_name == book.title
    end
    return nil
  end

  def rental_details(book_name)
    book = info(book_name)
    return book[:rental_details] if book != nil
  end

  def add_book(new_book)
    @book_list.push(Book.new(new_book))
  end

  def change_rental_details(book_name, name, date)
    for book in @book_list
      if book.title == book_name
        book.student_name = name
        book.date = date
      end
    end
    return nil
  end

end


class Book

  attr_reader :title
  attr_accessor :student_name, :date
  def initialize(title, student_name = "", date = "")
    @title = title
    @student_name = student_name
    @date = date
  end

  def details
    return {
      title: @title,
      rental_details: {
        student_name: @student_name,
        date: @date
      }
    }
  end

end
