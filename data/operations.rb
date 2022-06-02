require 'json'

def get_data(file)
  file_path = "./data/#{file}.json"
  File.new(file_path, 'w+') unless File.exist?(file_path)
  File.write(file_path, '[]') if File.empty?(file_path)
  contents = File.read(file_path)
  JSON.parse(contents)
end

def update_data(file, data)
  opts = {
    array_nl: "\n",
    object_nl: "\n",
    indent: '  ',
    space_before: ' ',
    space: ' '
  }
  json_data = JSON.generate(data, opts)
  File.write("./data/#{file}.json", json_data)
end

def populate_books
  get_data('books').map do |book|
    Book.new(book['publisher'], book['cover_state'], book['publish_date'])
  end
end

def populate_labels
    get_data('labels').map do |label|
      Label.new(label[:title], label[:color])
    end
end