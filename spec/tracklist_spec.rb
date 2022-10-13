require 'tracklist'

RSpec.describe "Test:" do
    it "1. checking blank tracklist" do
        x = Musiclist.new
        expect(x.list_viewer).to eq []
    end

    it "2. checking one track add" do
        x = Musiclist.new
        x.track_adder("first")
        expect(x.list_viewer).to eq ["first"]
    end

    it "3. checking two tracks added" do
        x = Musiclist.new
        x.track_adder("first")
        x.track_adder("drums")
        expect(x.list_viewer).to eq ["first","drums"]
    end

    it "4. checking three tracks inc a duplicate" do
        x = Musiclist.new
        x.track_adder("first")
        x.track_adder("drums")
        x.track_adder("drums")
        expect(x.list_viewer).to eq ["first","drums"]
    end

end