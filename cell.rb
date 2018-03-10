class Cell
    attr_reader :passible

    def initialize
        @string_value = "."
        @passible = true
    end
    def to_s
        @string_value
    end
    def touch
        "There is nothing here but dust."
    end
end