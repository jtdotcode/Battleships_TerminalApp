
$LOAD_PATH << '.'
require_relative "grid.rb"
require_relative "game_element.rb"
require "readline"
require 'colorize'
require "csv"

module GameEngine

    @@ships = { }
    @@game_turns = 5
    @@color = true
    @@score_file = "score.csv"


def start_screen
    print "Welcome to the ship placement Screen\n"
    print "Please choose a position on the grid to place your ship"
    print ""
end

def no_colour
    String.disable_colorization = true
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

def input_ok?(input)
    
    
    if(input.match?(/^[1-9][a-zA-Z]$/))
        return true
        else
            return false
        end

end


def player_board(player_grid)

    input = ""
    ship_count = @@ships.length
    continue = true
    ships = @@ships.dup
    message = ""

    while(continue == true)
        
        player_grid.display
        
        if(ship_count != 0 )
            ships.each do |k,v|
                puts "#{message}"
                puts "Type the Grid Coordinates to place the ship. e.g 1b for that location"
                puts "You have #{ship_count} ship left to place! Type quit to exit anytime"
                puts "Where would you like to place the #{k}(#{v.icon})?"
                input = gets.chomp
                    if(input.downcase == "quit")
                        continue = false
                        quit_game
                        break
                    elsif(input_ok?(input) == false)
                        message = "Invalid Input, Please enter row letter then column number".colorize(:red)
                        system('clear')
                        break
                    end
                if(place_ships(player_grid, convert_coordinates(input), @@ships[k]))
                    puts "Placing ships...."
                    ship_count -= 1
                    ships.delete(k)
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
        v.hidden(false)
        #computer_grid.display
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

def human_player(computer_grid, player_grid, input)
        system('clear')
        player_grid.redraw
        input = convert_coordinates(input)
        if(hit?(computer_grid,input))
            system('clear')
            computer_grid.bottom_banner = "You sunk an Enemy battleship! \n Computer says; NO!".colorize(:red)
            sleep(1)
            computer_grid.redraw
            return true 
        else
            system('clear')
            sleep(1)
            computer_grid.bottom_banner = "Missed!, \n Computer says; Yes! Take that meat bag!".colorize(:blue)
            computer_grid.redraw
            return false
        end


end

def computer_player(player_grid, computer_grid)

    if(hit?(player_grid,random_grid_position(player_grid.row, player_grid.column)))
        
        player_grid.bottom_banner = "Battleship hit!, You are mine, meat bag!".colorize(:blue)
        player_grid.redraw
        sleep(5)
        computer_grid.redraw
        return true 
    else
       
        player_grid.bottom_banner = "Battleship Missed!, \n Computer says; Dam it!".colorize(:red)
        player_grid.redraw
        sleep(5)
        computer_grid.redraw
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



def play_game(player_grid, computer_grid)

    turns = @@game_turns
    total_ships = @@ships.length
    player_score = 0
    player_misses = 0
    computer_score = 0
    computer_misses = 0
    
    
    while(turns >  0 || quit == false)

        if(player_score == total_ships)
            system('clear')
            puts "Congratulations you sunk all the Enemies Battle Ships"
            score_telly("player", computer_score, player_score)
            break
        elsif(computer_score == total_ships)
            system('clear')
            puts "Computer Says; I won!, Sorry not sorry you lost"
            score_telly("computer", computer_score, player_score)
            break
        end
        
        
        puts "Where would you like to hit your enemy?"
        input = gets.chomp
        if(input.downcase == "quit")
            quit = true
            quit_game
            break
        elsif(input_ok?(input) == false)
            puts "Invalid Input, Please enter row letter then column number".colorize(:red)
            system('clear')
        else
            if(human_player(computer_grid, player_grid, input))
                player_score += 1
            else
                computer_grid.bottom_banner = "Missed"
            end
            if(computer_player(player_grid, computer_grid))
                computer_score += 1
            else
                player_grid.bottom_banner = "Missed"
            end

        end
    

    end   


end

def save_score(score)
    puts "Please enter your name"
    name = gets.chomp
    puts "Thanks #{name}, writing your score to the score file"
    begin
        if(File.file?(@@score_file))
            CSV.open(@@score_file, "a+") do |csv|
                csv << [name.to_s, score.to_s]
              end
        else
            CSV.open(@@score_file, "wb") do |csv|
                csv << ["Name", "Score"]
                csv << [name, score]
              end
        end
        
    rescue IOError => e
        puts "Unable to write to the score file"
        puts "Error #{e.message}"
    else
        exit
    end


end

def read_scores

    scores = []

    begin
        if(File.file?(@@score_file))
        CSV.foreach(@@score_file) do |row|
            scores.push(row)
          end
        else
            system('clear')
            scores.push(["No Score file Available", "Please play the game"])
        return scores
        end
    rescue IOError => e
        puts "Unable to read to the score file"
        puts "Error #{e.message}"
    end
    
    return scores

end


def score_telly(winner, computer_score, player_score)

        if(winner == "player")
            puts "You are the winner!"
            puts "**********************************"
            puts "Final Score is:"
            puts "Computer = #{computer_score} "
            puts "You = #{player_score}"
            puts "Would you like to save your score?, yes or no"
            input = gets.chomp
            input.downcase == "yes" ? save_score(player_score) : exit
        else
            puts "You lost!, return to the start menu?, yes or no"
            input = gets.chomp
            input.downcase == "yes" ? start_menu : exit
        end


end


def start
    #puts "starting Game...."
    #puts "creating ships"
    create_ships("Carrier",GameElement.new("@".colorize(:blue),"Carrier","ship"))
    create_ships("Battleship",GameElement.new("$".colorize(:red),"Battleship", "ship"))
    create_ships("Cruiser", GameElement.new("%","Cruiser".colorize(:green), "ship"))
    create_ships("Submarine", GameElement.new("*","Submarine".colorize(:orange), "ship"))
    create_ships("Destroyer", GameElement.new("&","Destroyer".colorize(:yellow), "ship"))
    
    
    player_grid = Grid.new("Your: Battle Grid")
    computer_grid = Grid.new("Computer: Battle Grid")
   
  
    player_board(player_grid)
    computer_board(computer_grid)
    play_game(player_grid, computer_grid)

end



end #end of module