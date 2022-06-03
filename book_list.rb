require './book'
require './label'
require './data/operations'
require 'json'

class Booklist
  def initialize()
    @books = []
    @labels = [{ title: 'Fiction', color: 'Black' }, { title: 'Non-fiction', color: 'Red' }]
    load_books
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
    stored_books = get_data('books')
    list_labels
    label_index = gets.chomp.to_i
    book = Book.new(publisher, state_selection, date)
    desired_label = @labels[label_index - 1]
    title = desired_label[:title]
    color = desired_label[:color]
    label = Label.new(title, color)
    label.add_item(book)
    desired_label[:ref] = label
    new_book = { publisher: publisher, cover_state: state_selection, publish_date: date, label: book.label.title }
    @books << new_book
    book_data = { publisher: publisher, cover_state: state_selection, publish_date: date, label: book.label.title }
    stored_books.push(book_data)
    update_data('books', stored_books)
    puts 'Book was added successfully'
  end

  def load_books
    @books = populate_books
  end

  def cover_selection(state)
    state_result = 'good'
    case state
    when 'y' then state_result = 'good'
    when 'n' then state_result = 'bad'
    end
    state_result
  end

  def populate_label
    @labels.each do |label|
      Label.new(label[:title], label[:color])
    end
  end

  def list_labels
    puts 'There are no genres available in the system' if @labels.empty?
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) title: #{label[:title]}, color: #{label[:color]}"
    end
  end
end
