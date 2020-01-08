require 'rspec'
require 'book'
# require 'author'
require 'spec_helper'

describe '#Book' do

  before(:each) do
    Book.clear()
  end


describe('#==') do
it("is the same book if it has the same attributes as another book") do
  book = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
  book2 = book.new({ :title => "Blue", :id => nil :author => "Prince"})
  expect(book).to(eq(book2))
  end
end

describe('#save') do
it("saves an book") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"}) # nil, nil added as second argument
  book.save()
  book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"}) # nil, nil added as second argument
  book2.save()
  expect(book.all).to(eq([book, book2]))
  end
end

describe('#delete') do
it("deletes an book by id") do
  book = book.new({:title => "Giant Steps", :author => "Johnny"})
  book.save()
  book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
  book2.save()
  book.delete()
  expect(book.all).to(eq([book2]))
  end
end

describe('.all') do
it("returns an empty array when there are no books") do
  expect(book.all).to(eq([]))
  end
end

describe('.clear') do
it("clears all books") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"})
  book.save()
  book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
  book2.save()
  book.clear()
  expect(book.all).to(eq([]))
  end
end

describe('.find') do
it("finds an book by id") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"})
  book.save()
  book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
  book2.save()
  expect(book.find(book.id)).to(eq(book))
  end
end

describe('#update') do
it("updates an book by id") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"})
  book.save()
  book.update("Blue")
  expect(book.title).to(eq("Blue"))
  end
end

describe('#sort') do
it("Sort list of books by title") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"})
    book.save()
    book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
    book2.save()
    book3 = book.new({ :title => "Yellow", :id => nil, :author => "COlors"})
    book3.save()
  expect(book.sort).to(eq([book2, book, book3]))
  end
end

describe('.search') do
it("search book on list of books") do
  book = book.new({:title => "Giant Steps", :id => nil, :author => "Johnny"})
  book.save()
  book2 = book.new({ :title => "Blue", :id => nil, :author => "Prince"})
  book2.save()
  expect(book.search("Blue")).to(eq([book2]))
  end
end


end
