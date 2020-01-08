require 'rspec'
require 'pg'
require 'returned_books'
# require 'author'
require 'pry'


DB = PG.connect({:dbname => 'library_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end 
