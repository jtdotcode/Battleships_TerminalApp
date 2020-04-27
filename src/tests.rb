#These tests are essential for the game as they validate and convert the 
#input from the player and stop them from entering a non-grid location. 
# The first test test_convert_coordinates method takes a String and converts it to a corresponding array position on the Grid, e.g. a = 1 so 
# a1 would return [1,1].
# The second test test_input_ok? Checks if the length of the String is no longer than two characters and that there is a letter first 
# then a number, it will return true if the correct String is entered.
# The third test is fundamental to the gameplay as the collision? method is used when the ships objects are being placed onto the grid.     

require "test/unit"
require_relative "game_engine.rb"
require_relative "grid.rb"
require_relative "game_element.rb"
include GameEngine

class GameTest < Test::Unit::TestCase
    #This test checks if the convert coordinates method which takes a string of grid coordinates returns
    #the corresponding position on the grid e.g a1 should return an array [1,1]
    def test_convert_coordinates
        
        assert_equal([1,1], GameEngine::convert_coordinates("a1"), "Should return an array of [1,1]" )
        assert_equal([2,1], GameEngine::convert_coordinates("b1"), "Should return an array of [2,1]" )
    end

    #This test checks if the grid input string is formated so the row number is first then the column number.
    #e.g 1b should return true, b1 should return false
    def test_input_ok?
        
        # this test should return true as is contains a letter then a number and is no longer the 2 chars.
        assert(GameEngine::input_ok?("1a"))

        # this test should return false as is contains a number then and a letter.
        assert(GameEngine::input_ok?("a1") == false)

        # this test should return false as is contains a number then and a letter more then 2 chars.
        assert(GameEngine::input_ok?("a122") == false)

        # this test should return false as is contains all numbers and more then 2 chars.
        assert(GameEngine::input_ok?("11122") == false)
        
    end

    #This test checks if there is already a game element object of the same type on the game grid.
    #This is fundamental to the gameplay as the method is used when the ships objects are being placed onto the grid 
    #and it stops the overwriting of already placed objects on the game grids and without you could override and existing game element placement. 
    #collision takes 3 args (grid, position, type_of) and returns a true or false.

    def test_collision?

        # create new test grid
        test_grid = Grid.new("Test-Grid")

        # create game element to place on grid
        test_game_element0 = GameElement.new("@", "test-ship0", "ship", [0,0])
        test_game_element1 = GameElement.new("@", "test-ship1", "grid-point", [0,0])

        # one of the ships elements to the grid
        test_grid.add([1,1],test_game_element0)
        test_grid.add([1,3],test_game_element1)

        # this test should return true as we have already placed an ship element on the 
        # grid with a posistion of [1,1] and we are trying to do the same thing again.
        assert(GameEngine::collision?(test_grid, [1,1], "ship"))

        # this test should return false as there is no ship element on the 
        # grid with at posistion of [1,0] and we are trying to do the same thing again.
        assert(GameEngine::collision?(test_grid, [1,0], "ship") == false)

        # this test should return false as there is no element type of "ship" on this grid location at the 
        # grid posistion of [1,3].
        assert(GameEngine::collision?(test_grid, [1,3], "ship") == false )

    end


end