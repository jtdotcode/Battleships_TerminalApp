
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
    print "   Options 1-3 reflect how long each game takes\n"
    @screen = [
        {" Start Game" =>-> do start_game("quick") end},
        {" Score Board" =>-> do score_board("average") end},
        {" How to play" =>-> do help_menu() end},
        {" Exit" => -> do exit end}
    ]
    prompt.select("", @screen)

end


#start_screen

# game_element1 = GameElement.new("$", [1,2],"Battleship")
# game_element2 = GameElement.new("*", [1,3], "Distroyer")

# grid1 = Grid.new()

# grid1.create


# grid1.display

# grid1.add(1,1,game_element1)
# grid1.add(1,2,game_element2)
# game_element1.hit = false
# game_element2.hit = true

# grid1.redraw

GameEngine::start


