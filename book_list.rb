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
        puts 'Which label should the book have'
        book = Book.new(publisher, state_selection, date)
        new_book = { publisher: publisher, cover_state: state_selection, publish_date: date}
        @books << new_book
        puts 'Book was added successfully'
      end

      def cover_selection(state)
        state_result = 'good'
        case state
        when 'y' then state_result = 'good'
        when 'n' then state_result = 'bad'
        end
        state_result
      end  
end