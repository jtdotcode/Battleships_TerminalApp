
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
    print "   to destroy all of their ships before they get yours\n"
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

score_board

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


end

start_game()

