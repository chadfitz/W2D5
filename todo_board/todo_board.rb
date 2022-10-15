require "byebug"
require_relative "item.rb"
require_relative "list.rb"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts 'Please enter a command.'
        cmd, *args = gets.chomp.split

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args)
        when 'down'
            @list.down(*args)
        when 'swap'
            @list.swap(*args)
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when'print'
            @list.print(*args)
        when 'quit'
            return false
        else
            print 'Sorry, that command is not recognized.'
        end
        true
    end

    def run
        until false
            self.get_command    
        end
        #swap is not working here but works in list.rb
    end
end