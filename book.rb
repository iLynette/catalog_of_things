class Book
    attr_accessor :publisher, :cover_state

    def initialize(publisher, cover_state)
        @publisher = publisher
        @cover_state = cover_state
    end
end