require "./board"
require "io/console"
# does player need to be a class?

board = Board.new(40)
current_x = 0
current_y = 0
screen_x = 15
screen_y = 15
offset_x = 0
offset_y = 0


quit = false

while quit == false
    system "cls"

    offset_x = current_x - screen_x/2
    offset_y = current_y - screen_y/2
    if offset_x < 0
        offset_x = 0
    end
    if offset_x > board.size - screen_x
        offset_x = board.size - screen_x
    end
    if offset_y < 0
        offset_y = 0
    end
    if offset_y > board.size - screen_y
        offset_y = board.size - screen_y
    end


    (offset_y...(offset_y + screen_y)).each do |y|
        (offset_x...(offset_x + screen_x)).each do |x|
            if x == current_x && y == current_y
                print "@"
            else
                print board.cell(x, y).to_s
            end
        end
        puts
    end

    
    puts board.touch(current_x, current_y)
    puts "Offset X: #{offset_x}"
    puts "Offset Y: #{offset_y}"
    puts "Current X: #{current_x}"
    puts "Current Y: #{current_y}"

    # get some input, repeat
    input = STDIN.getch
    case input
        when "a"
            if board.can_move_to(current_x - 1, current_y)
                current_x -= 1
            end
        when "s"
            if board.can_move_to(current_x, current_y + 1)
                current_y += 1
            end
        when "d"
            if board.can_move_to(current_x + 1, current_y)
                current_x += 1
            end
        when "w"
            if board.can_move_to(current_x, current_y - 1)
                current_y -= 1
            end
        when "q"
            quit = true
    end
end