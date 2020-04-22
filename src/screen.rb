class Screen


def initialize(size_x=25, size_y=25)
    @size_x = size_x
    @size_y = size_y
    @screen = create
end


def redraw
    system('clear')
    display

end
    
def create
    screen_array = []
    count = 0

    for x in 1..@size_x
        array = []
        count += 1

        for i in 1..@size_y
            array.push(".#{i}c")    
            
            
        end
        screen_array.push(array)

    end
    
    return screen_array

end

def display

    for element in @screen

        for item in element
            print item
        end
        print "\n"
    end


end

def update


end


def add(row_position, column_position, screen_obj)


    @screen[row_position][column_position] = screen_obj

end




end

