require "./treasure"
require "./wall"
# size
# cells
# maybe at edge?

class Board
    attr_reader :size

    def initialize size
        @size = size
        @cells = Array.new(size){Array.new(size){Cell.new}}
        @cells[1][4] = Treasure.new
        @cells[9][9] = Treasure.new

        @cells[2][2] = Wall.new
        @cells[2][3] = Wall.new
        @cells[2][4] = Wall.new
        @cells[2][5] = Wall.new
        @cells[2][6] = Wall.new
    end

    def touch row, column
        result = @cells[row][column].touch
        @cells[row][column] = Cell.new
        result
    end

    def cell row, column
        return @cells[row][column]
    end

    def can_move_to row, column
        if row > -1 && row < @size && column > -1 && column < @size
            if @cells[row][column].passible
                return true
            else
                return false
            end
        else
            false
        end
    end

end