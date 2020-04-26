
#this is the main file for the battleships application.
    require "tty-prompt"
    # require_relative "grid.rb"
    # require_relative "game_element.rb"
    require_relative "game_engine.rb"
    include GameEngine



$game_heading = "
    '########::::'###:::'########'########'##::::::'########:'######:'##::::'##'####'########::'######::
     ##.... ##::'## ##::... ##..:... ##..::##:::::::##.....:'##... ##:##:::: ##. ##::##.... ##'##... ##:
     ##:::: ##:'##:. ##:::: ##:::::: ##::::##:::::::##:::::::##:::..::##:::: ##: ##::##:::: ##:##:::..::
     ########:'##:::. ##::: ##:::::: ##::::##:::::::######::. ######::#########: ##::########:. ######::
     ##.... ##:#########::: ##:::::: ##::::##:::::::##...::::..... ##:##.... ##: ##::##.....:::..... ##:
     ##:::: ##:##.... ##::: ##:::::: ##::::##:::::::##::::::'##::: ##:##:::: ##: ##::##:::::::'##::: ##:
     ########::##:::: ##::: ##:::::: ##::::########:########. ######::##:::: ##'####:##:::::::. ######::
    ........::..:::::..::::..:::::::..::::........:........::......::..:::::..:....:..:::::::::......:::⠀\n"

$game_logo = " 
                        r..`b
                ..,    	M^,P%g          -,        /@W                  w
				g' @g   *@C    %g  r %, \'/*       ]Pk                 /
               mgg'  *m,  '%,   '@, 'w 'w *w \ /M%**`                 ]F
                 '%Ng  `%g   %g   'm   'w *,j, , '*L j          `*%Nm@@g,,
                    `*N,  'm   *g   *g    %=  *.  ^. `              ]@*'''''`
                        *%,  *,  'm   %g ,`}'j~.     ;             j$
               g,,,,       *m, `w   %,  %,   `'*w,'w               @
               $@     `'*mw,,'%g  ^,] %, '%        *$             #F
               ]$@g            ''Mw,'{  'v '['*6,     k          g@
               ]@$$@                   'w ``     `'%,  F  ~.,   gW
               ]$']@%w                   '@Mw,,      '%  @,  T ,@F
               ]&ML* #g      .            '^w,  'M,     F *%N  @P
                $@g@$$$g                   ]  ,`*w, `*w#w  ,` @@
                 '%l$lMlg                        m  'x,   \[ g$`
                   '%%$$$L                            g *,` '%P
                     '%@W$                                 *,  W
                       '$$@                                  '\/ k
                         %M@    ,,,,,                           V,@
                      *%MNMQ,g*   ,g,www,,                        b
                   ''*G,'  ''     F   /'''J%NNgmwwg@w              'w
                 j$`   ,`      .,     *-              ''**mg,      /
                  '%,                      .                 `,$g,/
                     '%w,    `    ` '-     ,                      `|Mw \n "



def start_screen
    prompt = TTY::Prompt.new
    system "clear"
    print $game_heading
    print $game_logo
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

#GameEngine::start

help_menu


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
  puts "********************************Help Menu**********************************\n"
  puts "In battleships you take turns guessing where the computer player has placed their ships on a grid and viceversa."
  puts "You enter the grid coordinates marked on the side of the grid, first the row letter and then the column number."
  puts "If you guess where all the computers ships are first you win."
  puts "When the game first starts you will see your grid this is when you place your ships."
  puts "Each round you will see the computers grid while you are attacking and your grid while you are being attacked."
  puts "You can quit the game any time by type quit."
  puts "The score is calculated from your total successful hits."
  puts "\n"
  puts "Return to main menu?, yes or no/enter to exit\n"
  
  input = gets.chomp
  input.downcase == "yes" ? start_screen : exit 

end

def args


end



start_game()

