class Player 
    ROW_MAP = (:A..:C).zip(0..2).to_h
    TRANSLATIONS = {
        row: ->(input) { ROW_MAP[input[0].upcase.to_sym]},
        column: ->(input) { input.to_i - 1 }
    }

    attr_reader :marker
    attr_reader :name

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        [get_coordinate(:row), get_coordinate(:column)]
    end

    def get_coordinate(row_or_column)
        loop do 
            choice_prompt(row_or_column)
            input = gets 
            choice = TRANSLATIONS[row_or_column].call(input)
            return choice if in_bounds?(choice)
            puts "Invalid #{row_or_column}"
        end
    end

    def choice_prompt(string)
        puts "Pick a #{string}:"
        print "> "
    end

    def in_bounds?(choice)
        (0...3).include?(choice)
    end
end