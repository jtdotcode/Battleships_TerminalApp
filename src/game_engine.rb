
$LOAD_PATH << '.'
require_relative "grid.rb"
require_relative "game_element.rb"
require "readline"

module GameEngine

    @@ships = { }
    @@game_turns = 5


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

    not_empty_types.each do |x|
        if(collision?(grid, position, x)) 
            puts "Unable to place ship please try again!"
            return false
        end
    end

    grid.add(position, element)

end

def quit_game
    exit
end


def player_board(player_grid)

    input = ""
    ship_count = @@ships.length
    continue = true

    while(continue == true)
        
        player_grid.display
        
        if(ship_count != 0 )
            @@ships.each do |k,v|
                puts "Where would you like to place the #{k}(#{v.icon})"
                puts "Type the Grid Coordinates to place the ship. e.g 1b for the location on the Grid"
                puts "You have #{ship_count} ship left to place! Type quit to exit anytime"
                input = gets.chomp
                if(input.downcase == "quit")
                    continue = false
                    quit_game
                    break
                end
                if(place_ships(player_grid, convert_coordinates(input), @@ships[k]))
                    puts "Placing ships...."
                    ship_count -= 1
                    player_grid.redraw
                else
                    puts "Invalid selection please place that ship again"
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
    puts "Please wait the computer is Placing its ships"

    ships = @@ships.dup
    continue = true

    while(true)
    ships.each do |k,v|
        v.hidden(true)
        computer_grid.display
        if(place_ships(computer_grid,random_grid_position(computer_grid.row, computer_grid.column), ships[k]))
            puts "Computer is placing ship #{k}(#{v.icon})...."
            puts "please wait thinking...."
            sleep(1)
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
    sleep(5)
    puts a    

    return a

end

def computer_ai(player_gid)

    puts "Computer says, take your turn filthy human!"
    row = player_gid.row
    column = player_gid.column

    return random_grid_position(row, column)

end

def human_player(computer_grid, input)
    
        puts "Please enter the Grid location"
        input = convert_coordinates(input)
        if(hit?(computer_grid,input))
            puts "You sunk an Enemy battleship"
            sleep(5)
            computer_grid.redraw
            return true 
        else
            sleep(5)
            puts "Missed"
            computer_grid.redraw
            return false
        end


end

def computer_player(player_grid)
    if(hit?(player_grid,random_grid_position(player_grid.row, player_grid.column)))
        puts "Battleship hit!, You are mine, meat bag!"
        sleep(5)
        player_grid.redraw
        return true 
    else
        sleep(5)
        puts "Battleship Missed!, Dam it wish I was a PC"
        player_grid.redraw
        return false
    end


end


def hit?(grid, position)
    x = grid.get_element(position)
    if(grid.contains?(position, "ship"))
        
        x.hit(true)
        return true
    else
        x.missed(true)
        return false
    end

end



def play_game(player_gid, computer_grid)

    turns = @@game_turns
    total_ships = @@ships.length
    human_score = 0
    computer_score = 0
    
    while(turns >  0 || quit == false)

        
        puts "Where would you like to fire at the enemy?"
        input = gets.chomp
        if(input.downcase == "quit")
            quit = true
            quit_game
            break
        end
        human_player(computer_grid, input) == true ? human_score += 1 : "Missed"
        computer_player(player_gid) == true ? computer_score += 1 : "Missed"

    end   


end


def game_finished(winner)




end


def start
    puts "starting Game...."
    puts "creating ships"
    create_ships("Carrier",GameElement.new("@","Carrier","ship"))
    # create_ships("Battleship",GameElement.new("$","Battleship", "ship"))
    # create_ships("Cruiser", GameElement.new("%","Cruiser", "ship"))
    # create_ships("Submarine", GameElement.new("*","Submarine", "ship"))
    # create_ships("Destroyer", GameElement.new("&","Destroyer", "ship"))
    
    
    player_grid = Grid.new("Player: Battle Grid")
    computer_grid = Grid.new("Computer: Battle Grid")
   
  
    player_board(player_grid)
    computer_board(computer_grid)
    play_game(player_grid, computer_grid)

end



end #end of module