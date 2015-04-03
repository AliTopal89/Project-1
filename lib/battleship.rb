class Ship
    attr_accessor :position
    def initialize (position)
        @position = position # => ["A1", "A2", "A3", "A4", "A5"]
    end
    # ship.position[:x]
    # ship.position[:x]


end

class Grid
    # standard size for grid 10x10
    attr_accessor :grid
    def initialize
        @grid = []
        10.times do
            @grid << [".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
        end
        # @grid = [
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     ...
        # ]
    end
    
    def print_grid
        row_label = ["1", "2", "3","4", "5", "6", "7", "8", "9", "10"]
        column_label = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]

        puts "~ #{row_label.inspect}"
        
        @grid.each_with_index do |letter, index|
            puts "#{column_label[index]} #{@grid[index]}"
        end
    end
    
    def add_ship (ship)
        # ship[:x] # => 3
        # ship[:y] # => 5
        # @grid = [
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", "S", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     [".", ".", ".", ".", ".", ".", ".", ".", ".", "."],
        #     ...
        # ]
        # x = get_number_from_letter(ship.position[:x]) # => "A" => 1
        # y = ship.position[:y] - 1
        # @grid[x][y] = "S"
        ship.position.each do |coordinate| # => [ "A", 2 ]
            x = get_number_from_letter(coordinate[0])
            y = coordinate[1] - 1
            #@grid[x][y] = "S"
        end
    end

    def add_hit
        converter_hash = {
            "A" => 0,
            "B" => 1,
            "C" => 2,
            "D" => 3,
            "E" => 4,
            "F" => 5,
            "G" => 6,
            "H" => 7,
            "I" => 8,
            "J" => 9
        }
        puts "Where is the ship"
        coordinate = gets.chomp.to_s
        hit = "X"
        miss = "M"
        shippy =["A1", "A2", "A3", "A4", "A5", "J1", "J2", "J3", "J4", "J5", "D3", "E3", "F3", "G3", "H3","A6", "B6", "C6", "D6", "E6","C1","C2", "C3", "C4", "C5", "E10", "F10", "G10", "H10", "I10"]
       
        x_coord = coordinate.split(//)[0] 
        y_coord = coordinate.split(//)[1].to_i #&& y_coord = coordinate.split(//)[2].to_i && y_coord = coordinate.split(//)[3].to_i
        
        if shippy.include?(coordinate)
            @grid[converter_hash[x_coord]][y_coord-1] = "X"
            puts "you have hit the ship"

    
        else 
        # binding.pry
            @grid[converter_hash[x_coord]][y_coord-1] = "M"
            puts "miss :("
        end
        print_grid
    end
    
    private
    def get_number_from_letter(letter)
        letter_array = []
        ("A".."Z").each do |l|
            letter_array << l
        end
        return letter_array.index(letter)
    end
    
end

# class Player < ActiveRecord::Base
#  	def initialize
#  		@player = player
#     end
# end


# class Ship #<ActiveRecord::Base
# 	def valid_ships(shuffled_ships)
# 	@shuffled_ships = shuffled_ships
# 	end

# end
# end
# class Game < ActiveRecord::Base
    
#     def score
#         num_of_turns = 100 
        
#         score = self.score + 1
    
#         Game.update(score: score)
#     end
#         #CREATE TABLE "games" ("id" serial primary key, "completeness" boolean, "score" integer, "position" character varying, "player" character varying)

#     has_many :games, :score
#     validates :completeness, inclusion: {in: [true,false] }
#     validates :hit, inclusion: {in: [true,false] } 
# end

# class Movement < ActiveRecord::Base

#     def hit 
#         puts "please enter a coordinate"
#         input = gets.chomp
#         @hit.find_by(position: input)
#         belongs_to :games
#         has_many :positions #presence: true 
#         validates :hit, inclusion: {in: [true,false] }
#         Movement.create( game_id: 2, position: input, hit: false)
#     end
# end



grid = Grid.new
ship1 = Ship.new([["A", 1], ["A", 2], ["A", 3], ["A", 4], ["A", 5]])

all_ships = [
    Ship.new([["A", 1], ["A", 2], ["A", 3], ["A", 4], ["A", 5]]),
    Ship.new([["D", 3], ["E", 3], ["F", 3], ["G", 3], ["H", 3]]),
    Ship.new([["J", 1], ["J", 2], ["J", 3], ["J", 4], ["J", 5]]),
    Ship.new([["A", 6], ["B", 6], ["C", 6], ["D", 6], ["E", 6]]),
    Ship.new([["C", 1], ["C", 2], ["C", 3], ["C", 4], ["C", 5]]),
    Ship.new([["E", 10], ["F", 10], ["G", 10], ["H", 10], ["I", 10]])
]

selected_ships = []
while selected_ships.length < 2 do
    random = rand(0..all_ships.length-1)
    if !selected_ships.index(all_ships[random]) #! so that it passes the ar
        selected_ships << all_ships[random]
    end
end

grid.add_ship(selected_ships[0])
grid.add_ship(selected_ships[1])
grid.print_grid
grid.add_hit

# puts "wanna play?"

# answer = gets.chomp

# if answer == 'yes'
#     game = Game.create
# end
