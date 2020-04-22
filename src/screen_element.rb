

class ScreenElement
    def initialize(string_element, row_length, column_lenght, padding_char, direction)
        @string_element = string_element
        @row_length = row_length
        @column_lenght = column_lenght
        @padding_char = padding_char
        @direction = display
    end

    def create
        screen_array = []
        count = 0
        char_array = @string_element.char
        lenght1 = 0
        lenght2 = 0

            if(@direction == "row")
                if(@row_length > @char_array )
                    raise("Lenght of Row longer then string")
                else
                    lenght1 = @row_length
                    lenght2 = @column_lenght
                end
            end
            if(@direction == "column")
                if(@columnlength > @char_array )
                    raise("Lenght of Column longer then string")
                else
                    lenght1 = @column_lenght 
                    lenght2 = @row_length
                end
            end
            
    
        for x in 1..length1
            array = []
            count += 1
    
            for i in 1..lenght2
                array.push(".#{i}c")    
                
                
            end
            screen_array.push(array)
    
        end
        
        return screen_array
    
    end

    def direction(value1, value2)



    end




end