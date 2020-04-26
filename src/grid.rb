class Grid

attr_reader :row, :column


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
                array.push(GameElement.new("   ", "empty-space", "space"))
              else
                array.push(GameElement.new(" #{count-1} ", "label", "num-label"))
              end
               
            elsif(i == @column)
              #end of row which is last column 
              if(x == 0 || x == @row)
                array.push(GameElement.new("   ", "empty-space", "space"))
              else
                array.push(GameElement.new(" #{count-1} ", "label", "num-label"))
              end
              
            else
              #rest of the row and columns
              if(x == 0 || x == @column)
                array.push(GameElement.new("#{alphabet[i-1]}", "label", "alpha-label"))
              else 
                array.push(GameElement.new(".", "grid-point", "grid-point"))
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


def add(row_column_position, screen_obj)

    row_position = row_column_position[0]

    column_position = row_column_position[1]

    @screen[row_position][column_position] = screen_obj

end


def contains?(row_column_position, type_of)

    row_position = row_column_position[0]

    column_position = row_column_position[1]

    x = @screen[row_position][column_position]
    
    if(x.type == type_of) 
      puts "contains #{x.type}"
      puts "type_of = #{type_of}"
      return true
    else
      return false
    end

end


end #end grid class 

