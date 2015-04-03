require 'spec_helper'
require 'pry'
require_relative '../lib/controller'
# require_relative'../lib/battleship'

describe Grid do 
	it "can be instantiated" do
		grid = Grid.new
		expect(grid.class).to be(Grid)
	end
end



# describe "#score" do
# 	context "puts in a score" do
# 		score = self.score
# 		it "has an updated score" do
# 			expect(score).to be(self.score)
# 		end
# 	end
# end