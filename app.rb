require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/author')
require("pg")

DB =PG.connect({:dbname => "library_system"})

get('/') do
  @books = Book.all
  erb(:books)
end

get('/books') do
  if params["clear"]
    @books = Book.clear()
  elsif params["search_input"]
    @books = Book.search(params["search_input"])
  elsif params["sort_list"]
    @books = Book.sort()

  else
    @books = Book.all
  end
  erb(:books)
end

get('/books/new') do
  erb(:new_book)
end

post('/books') do
  title = params[:title]
  book = Book.new(:title => title, :id => nil)
  book.save()
  @books = Book.all()
  erb(:books)
end

get('/books/:id') do
  @book = Book.find(params[:id].to_i())
  erb(:book)
end

get('/books/:id/edit') do
@book = Book.find(params[:id].to_i())
erb(:edit_book)
end

patch('/books/:id') do
@book  = Book.find(params[:id].to_i())
@book.update(params[:title])
@books = Book.all
erb(:books)
end

delete('/books/:id') do
  @book = Book.find(params[:id].to_i())
  @book.delete()
  @books = Book.all
  erb(:books)
end

#Authors Routing¡! - -- - -- - - - - - - - >

get('/authors/new') do
  erb(:new_author)
end

get('/authors') do
  if params["clear"]
    @authors = Author.clear()
  elsif params["search_input"]
    @authors = Author.search(params["search_input"])
  elsif params["sort_list"]
    @authors = Author.sort()
  else
    @authors = Author.all
  end
  erb(:authors)
end

get('/authors/:id') do
  @author = Author.find(params[:id].to_i())
  erb(:author)
end

get('/authors/:id/edit') do
@author = Author.find(params[:id].to_i())
erb(:edit_author)
end

post('/authors') do
  name = params[:name]
  author = Author.new(:name => name, :id => nil)
  author.save()
  @authors = Author.all()
  erb(:authors)
end

patch('/authors/:id') do
@author  = Author.find(params[:id].to_i())
@author.update(params[:name])
@authors = Author.all
erb(:authors)
end

delete('/authors/:id') do
  @author = Author.find(params[:id].to_i())
  @author.delete()
  @authors = Author.all
  erb(:authors)
end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end
