#These tests are essential for the game as they validate and convert the 
#input from the player and stop them from entering a non-grid location. 
# The first test test_convert_coordinates method takes a String and converts it to a corresponding array position on the Grid, e.g. a = 1 so 
# a1 would return [1,1].
# The second test test_input_ok? Checks if the length of the String is no longer than two characters and that there is a letter first 
# then a number, it will return true if the correct String is entered.

require "test/unit"
require_relative "game_engine.rb"
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
        
        assert(GameEngine::input_ok?("1a"))
        assert(GameEngine::input_ok?("a1") == false)
        assert(GameEngine::input_ok?("a122") == false)
        assert(GameEngine::input_ok?("11122") == false)
    end
end