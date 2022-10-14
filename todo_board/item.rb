class Item
    attr_accessor :title, :description
    attr_reader :deadline

    def self.valid_date?(date_str)
        arr = date_str.split("-")
        return arr[0].length == 4 && arr[1].to_i <= 12 && arr[2].to_i <= 31
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        if !Item.valid_date?(deadline)
            false
            raise 'That is not a valid date'
        else
            @deadline = deadline
            true
        end
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise 'That is not a valid date'
        else
            @deadline = new_deadline
        end
    end

end