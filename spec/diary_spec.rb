require 'diary'

RSpec.describe "diary checks" do
    it "make_snippet > 5 words" do
        expect(make_snippet("jeff is a great guy isn't he?")).to eq "jeff is a great guy..."
    end
    it "make_snippet <= 5 words test" do
        expect(make_snippet("jeff is a")).to eq "jeff is a"
    end

    it "count_words is correct A" do
        expect(count_words("hello there")).to eq 2
    end

    it "count_words is correct B" do
        expect(count_words("")).to eq 0
    end

    it "count_words is correct C" do
        expect(count_words("My god what a lot of words!")).to eq 7
    end

    it "check text length reader of 1 digit" do
        expect(read_time("0")).to eq "0.005m"
    end

    it "check text length reader of 200 words" do
        expect(read_time("hello "*200)).to eq "1.0m"
    end

    it "check text length reader of 500 words" do
        expect(read_time("hello "*500)).to eq "2.5m"
    end

    context "string given checks" do
        it "check grammer_check A" do
            expect(grammar_check("hello there sir!")).to eq false
        end

        it "check grammer_check B" do
            expect(grammar_check("Hello there sir")).to eq false
        end

        it "check grammer_check C" do
            expect(grammar_check("Hello there sir?")).to eq true
        end

        it "check grammer_check D" do
            expect(grammar_check("Hello There Sire!")).to eq true
        end

        it "check grammer_check E" do
            expect(grammar_check("hello There Sire.")).to eq false
        end
    end

    context "if empty string?" do
        it "no input check" do
            expect{grammar_check("")}.to raise_error "NOT VALID"
        end
    end

end