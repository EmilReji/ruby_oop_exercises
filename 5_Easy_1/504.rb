class Book
  attr_accessor :title, :author
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
The seperation of creation and initialization mean there are more individual steps when setting up an object. While this gives more flexibility (can create an object without instance variables), it also means more romm for error. If you create an object without the instance variables and try to access them, you will get an unexpected output.
The previous method of combining creation and initializiation reduces this chance of error but also has more rigidity.
=end