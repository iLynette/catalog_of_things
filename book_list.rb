require './book'
require './label'

class Booklist
    def initialize()
        @books = []
    end

    def add_book
        print 'Publisher: '
        publisher = gets.chomp
        print 'Cover state good (y) or bad (n): '
        state = gets.chomp
        state_selection = cover_selection(state)
        print 'Publish date(yyyy-mm-dd): '
        date = gets.chomp
      end  
end