class Board
    WIDTH = 3
    HEIGHT = WIDTH

    def initialize
        @grid = Array.new(HEIGHT) {Array.new(WIDTH,:" ")}
    end

    def winner?(marker)
        row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
    end

    # getter
    def [](y,x)
        @grid[y][x]
    end

    #setter
    def []=(y,x, something)
        #this will prevent a box that is already occupied from being re-occupied
        # that is stopping the user from playing the same box twice
        if @grid[y][x] == :" " && [:X, :O].include?(something)
            @grid[y][x] = something
        else 
            false
        end
    end

    def display
        output = "\n"
        output << generate_header
        #TODO : GENERATE grid with letter for each row
        output << generate_rows
        output << "\n"
    end

    private

    def format_row(row, letter)
        row.reduce("  #{letter} ") { |string, cell| string << "[#{cell}]"} << "\n"
    end

    def generate_header
        (1..WIDTH).reduce("   ") { |header, n| header << "  #{n}"} << "\n"
    end

    def generate_rows
        letter = "@"
        @grid.reduce("") do |output, row| 
            letter = letter.next
            output << format_row(row, letter) 
        end
        
    end 

    def row_win?(marker)
        @grid.any? do |row|
            row.all? do |cell|
                cell == marker
            end
        end
    end

    def column_win?(marker)
        (0...WIDTH).any? do |column|
            @grid.all? do |row|
                row[column] == marker
            end
        end
    end

    def diagonal_win?(marker)
        [
            #stabby lambda syntax
            ->(i) { i },
            ->(i) { -(i+1) }
        ].any? do |proc|
            (0...HEIGHT).all? do |i|
                @grid[i][proc.call(i)] == marker
            end
        end
    end
end



