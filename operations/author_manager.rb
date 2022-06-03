require_relative '../author'
require_relative '../item'

def list_authors
  puts 'There are no authors yet!' if @authors.empty?
  @authors.each do |author|
    puts "first name: #{author.first_name}, last name: #{author.last_name}"
  end
end
