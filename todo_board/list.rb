require_relative 'item.rb'

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        # @new_item = Item.new(title, deadline, description)
        if !Item.valid_date?(deadline)
            return false
        else
            @items << Item.new(title, deadline, description)
            return true
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >= 0 && index < @items.length
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        else
            return false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts "-".ljust(40, "-")
        puts self.label
        puts "-".ljust(40, "-")
        puts "Index |  " + "Item".ljust(15) + "|  " + "Deadline"
        puts "-".ljust(40, "-")
        @items.each_with_index { |item, index| puts index.to_s + "     |  " + item.title.ljust(15) + "|  " + item.deadline }
        puts "-".ljust(40, "-")
    end

    def print_full_item(index)
        if self.valid_index?(index)
            puts "-".ljust(40, "-")
            puts @items[index].title.ljust(30) + @items[index].deadline
            puts @items[index].description
            puts "-".ljust(40, "-")
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        if self.valid_index?(index)
            amount.times do 
                if index > 0
                    @items[index], @items[index-1] = @items[index-1], @items[index]
                    index -= 1
                end
            end
        else
            return false
        end
    end

    def down(index, amount=1)
        if self.valid_index?(index)
            amount.times do 
                if index < @items.length-1
                    @items[index], @items[index+1] = @items[index+1], @items[index]
                    index += 1
                end
            end
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end
end