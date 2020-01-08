class Book
  attr_accessor :title, :id, :author

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
    @author = attributes.fetch(:author)

  end

  def save
    result = DB.exec("INSERT INTO books (title, id, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def update(attributes)
    @title = attributes.fetch(:title) || @title
    @author = attributes.fetch(:author) || @author
    DB.exec("UPDATE albums SET title = '#{@title}' WHERE id = #{@id};")
    DB.exec("UPDATE albums SET author = '#{@author}' WHERE id = #{@id};")
  end

  def ==(book_to_compare)
    self.title() == book_to_compare.title()
  end

  def self.all
    self.get_books("SELECT * FROM books;")
  end

  def self.clear
    DB.exec("DELETE FROM books *;")
  end

  def self.find(id)
    book = DB.exec("SELECT * FROM books WHERE id = #{id};").first
    title = book.fetch("title")
    id = album.fetch("id").to_i
    artist = album.fetch("artist")
    Album.new({:title => title, :id => id, :artist => artist})
  end

  def self.get_books(query)
    returned_books = DB.exec(query)
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      id = book.fetch("id").to_i
      author = book.fetch("author")
      books.push(Book.new({:title => title, :id => id, :author => author}))
    end
    books
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{@id};")
  end

  def self.sort
    self.get_books("SELECT * FROM books ORDER BY lower(title);")
    # @albums.values.sort {|a, b| a.name.downcase <=> b.name.downcase}
  end

  def self.search(x)
    self.get_books("SELECT * FROM books WHERE title = '#{x}'")
    # @albums.values.select { |e| /#{x}/i.match? e.name}
  end
end






end
