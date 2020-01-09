require 'rspec'
require 'book'
require 'spec_helper'
require 'author'

describe '#Author' do

  before(:each) do
    Author.clear()
    Book.clear()
  end

  describe('#==') do
    it("is the same author if it has the same attributes as another author") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author2 = Author.new({:name => "John Coltrane", :id => nil})
      expect(author).to(eq(author2))
    end
  end

  describe('#save') do
    it("saves an author") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()
      author2 = Author.new({:name => "Billie Holiday", :id => nil})
      author2.save()
      expect(Author.all).to(eq([author, author2]))
    end
  end

  describe('#delete') do
    it("deletes an author by id") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()
      author2 = Author.new({:name => "Billie Holiday", :id => nil})
      author2.save()
      author.delete()
      expect(Author.all).to(eq([author2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no authors") do
      expect(Author.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all authors") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()
      author2 = Author.new({:name => "Billie Holiday", :id => nil})
      author2.save()
      Author.clear()
      expect(Author.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an author by id") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()
      author2 = Author.new({:name => "Billie Holiday", :id => nil})
      author2.save()
      expect(Author.find(author.id)).to(eq(author))
    end
  end

  describe('#sort') do
    it("Sort list of authors by name") do
      author = Author.new({:name => "John Coltrane", :id => nil})
      author.save()
      author2 = Author.new({:name => "Billie Holiday", :id => nil})
      author2.save()
      author3 = Author.new({:name => "Zoe Appleseed", :id => nil})
      author3.save()
      expect(Author.sort).to(eq([author2, author, author3]))
    end
  end


describe('#update') do
  it("adds an book to an author") do
    author = Author.new({:name => "John Coltrane", :id => nil})
    author.save()
    book = Book.new({:title => "A Love Supreme", :id => nil})
    book.save()
    author.update({:book_name => "A Love Supreme"})
    expect(author.books).to(eq([book]))
  end
end
end
