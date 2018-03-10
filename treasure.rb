require "./cell"

class Treasure < Cell
    def initialize
        @string_value = "t"
        @passible = true
    end

    def touch
        return "You got a treasure!"
    end
end