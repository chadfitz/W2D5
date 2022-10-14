class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(name)
        if !self.full?
            @passenger = name
            if @passenger.has_flight?(@flight_number)
                @passengers << @passenger
            end
        end
    end

    def list_passengers
        list = []
        @passengers.each { |passenger| list << passenger.name }
        list
    end

    def [](index)
        @passengers[index]
    end

    def <<(name)
        self.board_passenger(name)
    end
end

