
require_relative "grid.rb"
require_relative "game_element.rb"
require "readline"

module GameEngine

    
    
    @@ships = {"Carrier" => [], "Battleship" => [], "Cruiser" => [], "Submarine" => [], "Destroyer" => [] }
    @@ship_labels = {"Carrier" => "$", "Battleship" => "@", "Cruiser" => "*", "Submarine" => "#", "Destroyer" => "&" }
    


def start_screen
    print "Welcome to the ship placement Screen\n"
    print "Please choose a position on the grid to place your ship"
    print ""
    
end

def create_ships(name, amount)
    ship_array = []

    for i in 1..amount
        
        puts "creating ship #{i}"
        

        ship_array.push(GameElement.new(@@ship_labels[name], name))

    end
    
    @@ships[name] << ship_array

end



def ships_available(name)

    ship_count = @@ships[name].length

    return ship_count

end

def convert_coordinates(position)

    #abc = *('a'..'z')
    abc = *('a'..'z')

    position = position.chars
    
    position.map do |x|
        if(abc.include?(x))
            x = abc.index(x) -1
        else
            x = x
        end 
    end

    return position

end


def place_ships(grid, position)
    
    
    grid.add()

    return position

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
    create_ships("Carrier", 1)
    create_ships("Battleship", 1)
    create_ships("Cruiser", 1)
    create_ships("Submarine", 1)
    create_ships("Destroyer", 1)

    #get_input("Hello")
    player_grid = Grid.new()
    #player_grid.add()
    
    puts convert_coordinates("a1")


end



end #end of module