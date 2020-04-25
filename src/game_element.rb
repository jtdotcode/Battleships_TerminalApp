

class GameElement

    attr_reader :name

    def initialize(string_element, name, position=[0,0])
        @string_element = create(string_element)
        @position = position
        @name = name
        @hit = false
        @visble = false        
        
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