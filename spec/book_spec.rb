require 'rspec'
require 'book'
require 'author'
require 'spec_helper'

describe '#Book' do

  before(:each) do
    Book.clear()
    Author.clear()    
  end


describe('#==') do
it("is the same book if it has the same attributes as another book") do
  book = Book.new({ :title => "Blue", :id => nil})
  book2 = Book.new({ :title => "Blue", :id => nil})
  expect(book).to(eq(book2))
  end
end

describe('#save') do
it("saves an book") do
  book = Book.new({:title => "Giant Steps", :id => nil}) # nil, nil added as second argument
  book.save()
  book2 = Book.new({ :title => "Blue", :id => nil}) # nil, nil added as second argument
  book2.save()
  expect(Book.all).to(eq([book, book2]))
  end
end

describe('#delete') do
it("deletes an book by id") do
  book = Book.new({:title => "Giant Steps", :id => nil})
  book.save()
  book2 = Book.new({ :title => "Blue", :id => nil})
  book2.save()
  book.delete()
  expect(Book.all).to(eq([book2]))
  end
end

describe('.all') do
it("returns an empty array when there are no books") do
  expect(Book.all).to(eq([]))
  end
end

describe('.clear') do
it("clears all books") do
  book = Book.new({:title => "Giant Steps", :id => nil})
  book.save()
  book2 = Book.new({ :title => "Blue", :id => nil})
  book2.save()
  Book.clear()
  expect(Book.all).to(eq([]))
  end
end

describe('.find') do
it("finds an book by id") do
  book = Book.new({:title => "Giant Steps", :id => nil})
  book.save()
  book2 = Book.new({ :title => "Blue", :id => nil})
  book2.save()
  expect(Book.find(book.id)).to(eq(book))
  end
end

describe('#update') do
it("updates an book by id") do
  book = Book.new({:title => "Giant Steps", :id => nil})
  book.save()
  book.update("Blue")
  expect(book.title).to(eq("Blue"))
  end
end

describe('#sort') do
it("Sort list of books by title") do
  book = Book.new({:title => "Giant Steps", :id => nil})
    book.save()
    book2 = Book.new({ :title => "Blue", :id => nil})
    book2.save()
    book3 = Book.new({ :title => "Yellow", :id => nil})
    book3.save()
  expect(Book.sort).to(eq([book2, book, book3]))
  end
end

describe('.search') do
it("search book on list of books") do
  book = Book.new({:title => "Giant Steps", :id => nil})
  book.save()
  book2 = Book.new({ :title => "Blue", :id => nil})
  book2.save()
  expect(Book.search("Blue")).to(eq([book2]))
  end
end


end
