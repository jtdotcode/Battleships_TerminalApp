
#this is the main file for the battleships application.
    require "tty-prompt"
    # require_relative "grid.rb"
    # require_relative "game_element.rb"
    require_relative "game_engine.rb"
    include GameEngine

    def help_cmd
      puts "Usage: [no-colour] [help]"
      puts "To run this game use ruby battleships.rb"
      puts "If the game has not not been install with the install.sh script,"
      puts "You will need to install the the gems tty-prompt and colorize"
      puts "You can install the colorize gem with the gem install colorize"
      puts "You can install the tty-prompt gem with the gem install tty-prompt"
      puts "If your console doesnt support colour you can use the no-colour option"
      puts "no colour example: ruby battleships no-color"
      exit 0

    end

    

    for arg in ARGV

      puts arg
      case arg
      when "h"
        help_cmd
      when "help"
        help_cmd
      when "no-colour"
        no_colour
      end
      
   end

  def no_colour
    GameEngine::no_colour
    start_screen
  end


  


$game_heading = "
    '########::::'###:::'########'########'##::::::'########:'######:'##::::'##'####'########::'######::
     ##.... ##::'## ##::... ##..:... ##..::##:::::::##.....:'##... ##:##:::: ##. ##::##.... ##'##... ##:
     ##:::: ##:'##:. ##:::: ##:::::: ##::::##:::::::##:::::::##:::..::##:::: ##: ##::##:::: ##:##:::..::
     ########:'##:::. ##::: ##:::::: ##::::##:::::::######::. ######::#########: ##::########:. ######::
     ##.... ##:#########::: ##:::::: ##::::##:::::::##...::::..... ##:##.... ##: ##::##.....:::..... ##:
     ##:::: ##:##.... ##::: ##:::::: ##::::##:::::::##::::::'##::: ##:##:::: ##: ##::##:::::::'##::: ##:
     ########::##:::: ##::: ##:::::: ##::::########:########. ######::##:::: ##'####:##:::::::. ######::
    ........::..:::::..::::..:::::::..::::........:........::......::..:::::..:....:..:::::::::......:::⠀\n"

def start_screen
    prompt = TTY::Prompt.new
    system "clear"
    print $game_heading
    # print $game_logo
    print "\n"
    print "   Welcome to Battleships!\n"
    print "   Battleships a game where you try and outsmart the enemies computer AI by attempting\n"
    print "   to destroy all of their ships before they get your ships\n"
    print "   *******Please choose a menu item to start***********\n"
    @screen = [
        {" Start Game" =>-> do start_game() end},
        {" Score Board" =>-> do score_board() end},
        {" How to play" =>-> do help_menu() end},
        {" Exit" => -> do exit end}
    ]
    prompt.select("", @screen)

end


def start_game()

system('clear')

GameEngine::start

end


def score_board

  scores = GameEngine::read_scores
  puts "*********Score Board*************"
  scores.each_with_index do |x, idxs|
      
      x.each_with_index do |i, idxx|
      if(idxs == 0)
        print "  #{i} "
      else
        if(idxx == 0)
          print "  #{i} "
        else
          print " | #{i} "
        end
        
      end
      
      end
      puts "\n"
  end
  puts "Return to main menu?, yes or no to exit"
  input = gets.chomp
  input.downcase == "yes" ? start_screen : exit 

end


def help_menu
  system('clear')
  puts "********************************Help Menu**********************************\n"
  puts "In battleships you take turns guessing where the computer player has placed their ships on a grid and viceversa."
  puts "You enter the grid coordinates marked on the side of the grid, first the row letter and then the column number."
  puts "If you guess where all the computers ships are first you win."
  puts "When the game first starts you will see your grid this is when you place your ships."
  puts "Each round you will see the computers grid while you are attacking and your grid while you are being attacked."
  puts "A successful hit will be marked with an X and a miss is marked with a 0"
  puts "You can quit the game any time by type quit."
  puts "The score is calculated from your total successful hits."
  puts "\n"
  puts "Return to main menu?, yes or no/enter to exit\n"
  
  input = gets.chomp
  input.downcase == "yes" ? start_screen : exit 

end


start_screen()

