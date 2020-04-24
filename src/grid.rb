class Grid


def initialize(row=6, column=6)
    @row = row
    @column = column
    @screen = create
    
end


def redraw
    system('clear')
    display

end
    
def create
    alphabet = *('a'..'z')
    screen_array = []
    count = 0

    for x in 0..@row
        array = []
        count += 1

        for i in 0..@column
            if(i ==  0)
              #start of row which is first column
              if(x == 0 || x == @row)
                array.push("     ")
              else
                array.push("  #{count-1}  ")
              end
               
            elsif(i == @column)
              #end of row which is last column 
              if(x == 0 || x == @row)
                array.push("     ")
              else
                array.push("  #{count-1}  ")
              end
              
            else
              #rest of the row and columns
              if(x == 0 || x == @column)
                array.push(" #{alphabet[i-1]} ")
              else 
                array.push(" . ")
              end
            end
            
        end
        screen_array.push(array)

    end
    
    return screen_array

end

def display

    for element in @screen

        for item in element
            if(item.kind_of?(GameElement))
            print " #{item.display} "
            else
            print item
            end
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

