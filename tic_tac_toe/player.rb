class Player 
    ROW_MAP = (:A..:C).zip(0..2).to_h

    attr_reader :marker

    def initialize(name, marker)
        @name = name
        @marker = marker
        @score = 0
    end

    def get_move
        [get_row, get_col]
    end

    def get_row
        loop do 
            choice_prompt("Row")
            input = gets
            choice = translate_row(input)
            return choice if in_bounds?(choice)
            puts "Invalid row."
        end
    end
    
    def get_col
        loop do
            choice_prompt("Column")
            input = gets 
            choice = translate_column(input)
            return choice if in_bounds?(choice) 
            puts "Invalid column."
        end
    end
    
    def translate_row(input)
        ROW_MAP[input[0].upcase.to_sym]
        #todo: return false if choice not valid
    end

    def translate_column(input)
        input.to_i - 1
    end 

    def choice_prompt(string)
        puts "Pick a #{string}:"
        print "> "
    end

    def in_bounds?(choice)
        (0...3).include?(choice)
    end
end