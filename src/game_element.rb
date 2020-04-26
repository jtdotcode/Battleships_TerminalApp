

class GameElement

    attr_reader :name, :icon, :type

    def initialize(string_element, name, type="grid-point", position=[0,0] )
        @string_element = create(string_element)
        @position = position
        @name = name
        @hit = false
        @visble = false
        @icon = @string_element
        @empty = true
        @missed = false      
        @type = type
    end


    def position=(position)
    
        position.each_with_index do |x, idx|  
            @position[idx] = x
        end

        @position = position

    end


    def create(string)

      return string.to_s

    end


    def position

        return @position

    end


    def hit=(hit)

        @hit = hit
        if(hit == true)
            @string_element = "X"
        end

    end


    def hit
      return @hit
    end

    def empty
        return @empty
    end


    def empty=(empty)
        @empty = empty
        if(empty == true)
            @string_element = "."
        end

    end


    def missed=(missed)
        @missed = missed
        if(missed == true)
            @string_element = "0"
        end

    end


    def missed
        return @missed
    end


    def display
        @string_element
    end

end #end game_element class