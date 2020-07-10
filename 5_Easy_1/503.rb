class Book
  attr_reader :author, :title
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
attr_reader is used instead of the other options as only getter methods are needed. The setters are not used and therefore unessaccary.
The use of explicit getter methods won't change the behaviour of the class in this instance. However it has one primary advantage in that additions can be made to the methods. Say you want the getter to only return the title in capitalized format. This can be done with explicit getters easily. The downside of this is the additional code.
=end