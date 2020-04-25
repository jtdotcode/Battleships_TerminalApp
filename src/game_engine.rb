
require_relative "grid.rb"
require_relative "game_element.rb"
require "readline"

module GameEngine

    
    
    # @@ships = {"Carrier" => , "Battleship" => , "Cruiser" => , "Submarine" => , "Destroyer" => }
    @@ships = { }
    #@@ship_labels = {"Carrier" => "$", "Battleship" => "@", "Cruiser" => "*", "Submarine" => "#", "Destroyer" => "&" }
    


def start_screen
    print "Welcome to the ship placement Screen\n"
    print "Please choose a position on the grid to place your ship"
    print ""
    
end

def create_ships(name, object)
    
        @@ships[name] = object   

end



def ships_available(name)

    ship_count = @@ships[name].length

    return ship_count

end

def convert_coordinates(position)

    
    abc = *('a'..'z')

    position = position.chars
    position_array = [] 

    position.each do |x|
        if(abc.include?(x)) 
           position_array.push(abc.index(x) + 1)
        else
            position_array.push(x.to_i)
        end
    end

    return position_array

end




def collision?(grid, position, element)
    
    if(grid.contains?(position, element))
        return true
    else
        return false
    end
    
end 


def place_ships(grid, position, element)
    abc = *('a'..'z')
    i = 0

    if(grid.row > grid.column)
        i = grid.row
    elsif(grid.row < grid.column)
        i = grid.column
    else
        i = grid.row
    end

    nums = *(1..i)
    
    items = nums + abc 
    
    items.push(element)

    items.each do |x|
        if(collision?(grid, position, x)) 
            puts "Unable to place plese try again"
            return false
        end
          
    end

    grid.add(position, element)

end


def get_input(message, method)

    
    # input readline
    while buf = Readline.readline("> ", true)
        print message

        p buf
      end

end


def game_finished


end


def start
    puts "starting Game...."
    puts "creating ships"
    create_ships("Carrier",GameElement.new("@","Carrier"))
    create_ships("Battleship",GameElement.new("$","Battleship"))
    create_ships("Cruiser", GameElement.new("%","Cruiser"))
    create_ships("Submarine", GameElement.new("*","Submarine"))
    create_ships("Destroyer", GameElement.new("&","Destroyer"))
    
    

   

    #get_input("Hello")
    player_grid = Grid.new()
    if(place_ships(player_grid, [1,0], @@ships["Carrier"]))
        puts "placing ships"
    else
        puts "cant place ships"
    end

    # player_grid.add([3,2], @@ships["Carrier"])

    

    
    player_grid.display
    
    



end



end #end of module