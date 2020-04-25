
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




def collision?(grid, position, type_of)
    
    if(grid.contains?(position, type_of))
        return true
    else
        return false
    end
    
end 


def place_ships(grid, position, element)
    not_empty_types = [ "alpha-label", "num-label", "space"]

    not_empty_types = not_empty_types.push(element.type)

    # abc = *('a'..'z')
    # i = 0

    # if(grid.row > grid.column)
    #     i = grid.row
    # elsif(grid.row < grid.column)
    #     i = grid.column
    # else
    #     i = grid.row
    # end

    # nums = *(1..i)
    
    # items = nums + abc 
    
    # items.push(element)

    not_empty_types.each do |x|
        if(collision?(grid, position, x)) 
            puts "Unable to place ship please try again!"
            return false
        end
        
          
    end

    grid.add(position, element)

    # if(collision?(grid, position, type_of))
    #     puts "cant place #{type_of}"
    #     return true
    # else
    #     grid.add(position, element)
    #     return false
    # end

end


def player_board(player_grid)

    input = ""
    ship_count = @@ships.length
    continue = true

    while(continue)
        
        player_grid.display
        
        if(ship_count != 0)
            @@ships.each do |k,v|
                puts "Where would you like to place the #{k}(#{v.icon})"
                puts "You have #{ship_count} left to place" 
                input = gets.chomp
                if(input.downcase == 'quit')
                    continue = false
                    break
                end
                if(place_ships(player_grid, convert_coordinates(input), @@ships[k]))
                    puts "Placing ships...."
                    ship_count -= 1
                    player_grid.redraw
                else
                    puts "invalid selection please place that ship again"
                end
            end
        else
            system("clear")
            player_grid.display
            continue = false
            
        end
        
      end

end


def computer_board(computer_grid)
    puts "placing computer ships"

    ships = @@ships.dup
    continue = true

    while(true)
    ships.each do |k,v|

        computer_grid.display
        if(place_ships(computer_grid,random_grid_position(computer_grid.row, computer_grid.column), ships[k]))
            puts "Computer is placing ship #{k}(#{v.icon})...."
            puts "please wait thinking...."
            sleep(5)
            ships.delete(k)
            
            puts "The computer has #{ships.length} left to place"
            system('clear')
        end

        

    end
    puts ships.length

    if(ships.length == 0)
            puts "All ships placed"
            continue = false
            system('clear')
            computer_grid.display
        break
    end
    

    end

end

def random_grid_position(row, column)

    a = []
    a.push(rand(1..row-1)) 
    a.push(rand(1..column-1))

    return a

end

def computer_ai




end


def game_finished


end


def start
    puts "starting Game...."
    puts "creating ships"
    create_ships("Carrier",GameElement.new("@","Carrier","ship"))
    create_ships("Battleship",GameElement.new("$","Battleship", "ship"))
    create_ships("Cruiser", GameElement.new("%","Cruiser", "ship"))
    create_ships("Submarine", GameElement.new("*","Submarine", "ship"))
    create_ships("Destroyer", GameElement.new("&","Destroyer", "ship"))
    
    

   

    
    
    player_grid = Grid.new()
    computer_grid = Grid.new()
   
    #player_board("Please place your ship\n", player_grid)
    # player_grid.add([3,2], @@ships["Carrier"])

    player_board(player_grid)
    #computer_board(computer_grid)

    
    
    
    



end



end #end of module