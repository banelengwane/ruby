class Board
    WIDTH = 3
    HEIGHT = WIDTH

    def initialize
        @grid = Array.new(HEIGHT) {Array.new(WIDTH,:" ")}
    end

    def display
        @grid.reduce("\n") { |output, row| output << format_row(row) } << "\n"
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

    def winner?(marker)
        row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
    end

    def diagonal_win?(marker)
        [
            lambda {|i| i},
            lambda {|i| -(i+1)}
        ].any? do |proc|
            (0...HEIGHT).all? do |i|
                @grid[i][proc.call(i)] == marker
            end
        end
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

    private
    def format_row(row )
        row.reduce("") { |row_string, cell| row_string << "[#{cell}]"} << "\n"
    end
end



