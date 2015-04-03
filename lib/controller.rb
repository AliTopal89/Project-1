require 'active_record'
require 'pry'
require_relative 'battleship'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :database => "battleship_db"
)


def battleship_games 
	ActiveRecord::Base.connection.tables.each do |table|
		ActiveRecord::Base.connection.drop_table(table)
	end
end

class BattleshipDB < ActiveRecord::Migration
	def initialize 
 		create_table :games do |column|
 			column.boolean :completeness #win or no win
 			column.integer :score
 			column.string :position
 			column.string :player	
 			column.boolean :hit		

 		end

 		create_table :movements do |column|
 			column.belongs_to :game # so that the games that I play are also displayed in the movements table
 			column.string :position
 			column.boolean :hit #hit or miss
 			column.string :moves #A1..J10
 			

 		end
 	end
end
binding.pry

