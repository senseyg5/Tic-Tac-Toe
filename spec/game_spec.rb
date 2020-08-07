require_relative "../lib/game.rb"
#require "../lib/spec_helper.rb"

describe Game do
    it "Test game" do
        g1 = Game.new(p1)
        g2 = Game.new(p2)
        test0 = g1.go
        test1 = g2.go

        expect(test0).to eq(true)
        expect(test1).to eq(true)
    end
end