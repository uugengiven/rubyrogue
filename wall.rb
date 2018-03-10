require "./cell"

class Wall < Cell
    def initialize
        @string_value = "*"
        @passible = false
    end
end