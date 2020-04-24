

class GameElement

    def initialize(string_element, position=[0,0], name, hit)
        @string_element = create(string_element)
        @position = position
        @name = name
        @hit = hit
        
        
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

    def display
        @string_element
    end



end