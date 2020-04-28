

# Battleships

Github Link:

[Github](https://github.com/jtdotcode/Battleships_TerminalApp)


#### Statement of Purpose and Scope

Battleships is a turn-based Command-Line game where the player and computer place 3 different types of battleships on grids and you take turns trying to hit each other’s battleships by trying to guess each other's ship location. 

A successful grid hit is marked by an X and unsuccessful one a 0. The goal is to sink the computer’s battleships before it gets yours. 

Why develop it?

There doesn’t seem to be many ruby command-line battleship games. I think that my version of this game could be an improvement over the original battleships gameplay. 

Who is this game for? Battleships is a game anyone who enjoys playing games but especially for adults or children who enjoyed playing the paper board game and would like to try a more interactive digital version of the game. 

What’s the purpose of Battleships? Battleships is just a game for enjoyment. 

How is the game is played? The player takes turns to fire hits from their battleship onto the computer player grid and vice versa. 

Each round the player is asked to enter a grid location to attempt to destroy the computer enemies Battleships if a successful hit is made the grid will be marked with an X or 0 for a missed hit. 

The player will see the computer enemy grid as they are attacking and their grid as the computer is attacking. The game will continue until all the ships are destroyed, whoever destroys all the ships first wins. 



#### Features

###### A command-line arguments help and no-colour

The help feature allows the player to display the help text before playing the game. 
The help option contains information about how to run the game and information about the no-colour option and how to use options are available, it also gives a brief description of the gameplay game purpose.
The no colour options allow you to turn off the default grid colour if your console doesn’t support colours.
These arguments are implemented using the ARGV variable. ARGV gets values passed from the command line. ARVG is an array so I will access it by iterating over it and matching its elements to methods for each option.



###### A game selection menu

When the game is started the player is greeted with a menu. The menu contains these options:

1. Start Game 
2. Score Board
3. How to Play
4. Exit

The help menu option will display a brief description of gameplay and information about the different game options. The Exit menu option terminates the application with a successful exit code 0 taking the player back to the terminal. 
The menu system will be implemented with a gem called tty-promt
The menu screen will prompt the user to choose an option.
The prompt will be: Please choose a menu item to start:
The player can choose an item by pressing the up and down keys of the keyboard.



###### **A battleship selection and placement option**

When a player has chosen a game option from the previous menu the next screen they will see is the battleship grid placement screen, this is where they place their ships onto the grid. 

The grid will be created with a 2d array with the first two array elements utilized for the column and row labels on the grid. The input prompt will then ask the player to choose where they would like to place their ships. The player must enter the grid coordinates row then column or e.g a1 for example. 

Before each placement is complete **The Grid and Ship Collision** feature is used to avoid the ship going outside of the grid or colliding with an existing ship. If the collision?() method returns false then the placement is successful and the next ship can be placed but only ship per grid reference placed anywhere on the player’s Grid excluding existing locations.  

Once all 3 ships have been placed the grid will be populated. The application will advance to the next screen which is the Computer Ship-placement screen. 



###### **Computers Ship-placement**

This screen will display that computer is placing its ships…. Please wait. 

This feature will just randomly select a grid location that is obfuscated from the player and place ships. 

As the ships are being placed on the grid **Collision feature** is being called. If any ships collide with the grid or other ships they will be placed again. Once all ships have been placed the feature will pause for 10 seconds And display this message: "All computer ships have been placed!” and then move to the next screen which is the Gameplay grids. 



###### Gameplay grid 

The player will see the computer enemy grid as they are attacking and their grid as the computer is attacking. The game will continue until all the ships are destroyed, whoever destroyed all the ships first wins. Misses are marked on the grid with a zero integer (0) for no hits and a successful hit being marked as an X.



###### Game Play

Each player takes turns the attacking the other player until all the ships on either side have been destroyed. 
Once a player has destroyed the other player ships a message will be displayed that states which ship was destroyed. 
Each round the human player is asked to choose a grid location and enter it in the prompt.  
When its the computers turn the screen says that the computer is now taking its turn please wait.
Once the computer takes its turn the hit or miss is displayed on the player’s grid.
The computer player makes it guesses randomly excluding previous attempts the computer uses the Computer AI feature to demine where it best might strike again.
The game continues in a loop asking each player for grid coordinates until all the ships are sunk.
When the game is complete it moves to the scoring screen. 



###### Computer AI

The computer AI chooses a random location on the player Grid to attack, it will do this by using a random method and excluding previous location.



###### A scoring system

The scoring screen shows the results from the match once the game is over.  
If you lose you will see a new screen that says sorry you lost would you like to play again? yes or no to exit.
If the player chooses yes the game returns the home screen otherwise game exits. 

If you win a game you will get the number of total points for the game.
If you win the game the game asks you to enter your name and your score is added to a scoreboard telly. This telly is then saved to a CSV file for retrieval next time the scoreboard is accessed. 

The telly screen shows the previous players names and scores. 
If the player chooses to play again by typing yes the game will go back to the main menu where you can choose the game type again or else the game will exit. 

Once you have finished looking a the scoreboard the game returns to the home game screen.



###### How to Play Screen

This screen show the user how to play the game it has an example layout of the game and instructions on 
How the game is operated and information about how the game is scored.

The player can return to the home screen whenever they like by choosing yes on the return the home screen option prompt at the bottom of the screen.



###### The Grid and Ship Collision feature 

This method to detect the edges of the grid or existing ship placements must be run while the ship placement is happening if the method detects an element of the same type on the grid it returns a 
Boolean true for a collision.





#### User Interaction and Experience

###### User Story

- The Player chooses the game type
- The Player begins game
- Welcome banner and instructions displayed
- Game starts
- The player chooses which battleships to place on the grid
- The computer is placing its battleships message is displayed
- The player is asked where on the computer’s grid they would like to take a hit.
  “Now its the computer players turn” message is displayed
- The computer randomly takes a hit on the player’s grid
- The player and computer take turns until one player has lost all the of ships
- When the game is over a banner is displayed with who has won the game.
- The game asks whether you would like the save the score or press q to quit.
- If q has been pressed you return to the start menu
- The player can choose to start a new game or quit.



#### Control Flow Diagram

![Control Flow Diagram](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/Battleships_Game_flow_chart.png)



#### Implementation Plan

The plan for the game was to make the game as OOP as possible. 
I knew I had to make the player grids a multi-dimensional array that would hold the game element objects so that I could change their states as a hit or missed was marked at their position which would make it easy to control the display of the game board.

I thought the best way to approach the problems was to create a class for the grids and a class for the elements of the game i.e the ships or grid markers and one module to glue everything together. 

The large module would be called something like the game engine and it would control all the creation of both player and computer grids, ships objects and gameplay logic, it would basically run the game.

I would also need an entry point for the game this would just be the name of the application and it could handle things like the menus and command-line arguments.

I went about implementing these feature by utilising my Trello board to keep track of each feature as I made progress and moving them to the relevant columns as I completed or started a task. 

I only really had a rough idea of how I wanted to build each method as I had never programmed a game before. 

I knew that the important methods would be things like checking for collisions so that a player couldn’t place a ship in the same location, checking whether the player has entered valid input, checking whether an element on the grid was hit or not, converting coordinates from the row letter and column numbers to a position on the grid array.

When creating classes I knew that one would have to be for the grid and the other would be the elements that would be included in the grid.

The grid elements would need to have attributes so that I could check their states from the game engine module, things that I thought they would need where a display_string which would be shown on the grid, a position array so that I know where it was on the grid, a name for reference, hit a boolean so I check if it was hit, a hidden option so I could hide it, and a missed attribute so it would display I missed shot.

The grid class would need to create a multidimensional array and population itself with game element objects it would also have to create game elements that would be the labels for the rows and columns of the grid, the grid would also need the be able to display or redraw its contents to the screen so I would need to create methods the would print and format the output to the screen.

So this is how I went about implementing my application.

Below are some screenshots of my Trello boards as I worked through implementing my ideas outlined above.

You can see my live Trello board here:

[My Trello Board](https://trello.com/b/kbDN4cvb)

**First Project Day:**

![First Project Day](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/trello1.PNG)

**As I progressed:**

![As I progressed](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/trello2.PNG)

![As I progressed](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/trello5.PNG)



#### Tests

The 3 tests I conducted are essential for the game as they validate and convert the Input from the player and stop them from entering a non-grid location. 

The first test test_convert_coordinates method takes a String and converts it to a corresponding array position on the Grid, e.g. a = 1 so 
a1 would return [1,1].

The second test test_input_ok? Checks if the length of the String is no longer than two characters and that there is a letter first then a number, it will return true if the correct String is entered.

The third test is fundamental to the gameplay, as the collision?() method is used when the ships objects are being placed onto the grid.

All tests were conducted with the Ruby unit test library and can be viewed in the tests.rb file. 

![Unit Tests](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/tests.PNG)



#### Game Help File

Welcome to Battleships! A game that is inspired by the original paper game from the 1930’s.  
In battleships, you take turns guessing where the computer player has placed their ships on a grid and vice-versa until someone destroys the ships on the Grid. 



**Brief gameplay overview:** 
When the game first starts you will see your grid this is when you place your ships.
Each round you enter the grid coordinates marked on the side of the grid, first the row letter and then the column number you will then see the computer’s grid while you are attacking and your grid while you are being attacked. A successful hit will be marked with an X and a miss is marked with a 0.

The game is over once all the enemies ships have been destroyed. The score is calculated from your total successful hits

**Start Menu**


![Start Menu](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/start_menu.PNG)


**Player Gameplay Grid**

![Player Gameplay Grid](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/battle_grid_player.PNG)

**Computer Grid**

![Computer Grid](https://github.com/jtdotcode/Battleships_TerminalApp/blob/master/docs/battle_grid_computer.PNG)



**System Requirements:** Ruby 2.0+ and a terminal capable of running the Ruby 2.0+ interpreter (tested on WSL Ubuntu 18.04 LTS). As this is a terminal application no special video card hardware required. This application utilizes two libraries (Gems) these Gems can be installed via Bundle or from with the run.sh script, as detailed below.

If you’re going to run this application on Linux/Unix the easiest way to start the application is by using the run.sh script this script will automatically check for the correct versions of bundle and Git and continue to install and then run the application once all dependencies are satisfied. 

To install and Run automatically use the:

```
bash ./run.sh
```

Or

```
Chmod run.sh +x
```

```
./run.sh
```

If you’re installing the application from windows or would like to install it manually please navigate to the src folder once you cloned the game and use the “bundle install” command (the Bundle Gem must be installed first).

```
Bundle install
```

Or if you don’t have Bundle Gems installed you can just manually install the gems.

```
gem install colorizegem 
```



```
gem install tty-prompt
```

And to run the game use the:

```
ruby ./battleships
```

Battleships also has two command-line options

Usage: [no-colour] [help] 

```
ruby ./battleships help 
```

These are to display basic help information about the game and no-colour which turns off all colour from the console.

```
ruby ./battleships no-colour
```

**Strategies for Game Play**

Not really this game is just for fun it and doesn't require much thought. You could try and spread all your ship across the grid this will make it harder the enemy to find them all.

