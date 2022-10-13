require 'grammar'

RSpec.describe "checks on check method" do
   
        it "message fail lol" do
            x = GrammarStats.new
            expect{x.check("")}.to raise_error "NOT VALID"
        end

        it "caps check 1" do
            x = GrammarStats.new
            expect(x.check("hello!")).to eq false
        end

        it "caps check 2" do
            x = GrammarStats.new
            expect(x.check("Hello!")).to eq true
        end

        it "punctuation check 1" do
            x = GrammarStats.new
            expect(x.check("Hello")).to eq false
        end

        it "punctuation check 2" do
            x = GrammarStats.new
            expect(x.check("Hello?")).to eq true
        end

        it "percentage check 1" do
            x = GrammarStats.new
            x.check("Hello?")
            expect(x.percentage_good).to eq 100
        end

        it "percentage check 1a" do
            x = GrammarStats.new
            x.check("ello?")
            expect(x.percentage_good).to eq 0
        end

        it "percentage check 2" do
            x = GrammarStats.new
            x.check("Hello?")
            x.check("Hello")
            expect(x.percentage_good).to eq 50
        end

        it "percentage check 3" do
            x = GrammarStats.new
            x.check("Hello?")
            x.check("Hello!")
            x.check("hello!")
            expect(x.percentage_good).to eq 66
        end
    
end