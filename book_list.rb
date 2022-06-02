require './book'
require './label'

class Booklist
    def initialize()
        @books = []
        @labels = [{title: 'title', color: 'Black'}, {title: 'title', color: 'Red'}]
    end

    def list_all_books
        puts 'No books available, please add some' if @books.empty?
        @books.each_with_index do |book, index|
          puts ' '
          print "Book(#{index + 1}) => Publisher: #{book[:publisher]} | label: #{book[:label]} | "
          print "cover state: #{book[:cover_state]} | publish date: #{book[:publish_date]} "
        end
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
        new_book = { publisher: publisher, cover_state: state_selection, publish_date: date, label: label}
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