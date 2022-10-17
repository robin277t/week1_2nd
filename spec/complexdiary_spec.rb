require 'complexdiary'

describe Diary do
    context 'Pair integration tests diary output' do
        it 'returns the diary entry list object - no entries' do
        diary = Diary.new
        expect(diary.all).to eq([])
        end
        it 'returns the diary entry list object - one entry' do
        diary = Diary.new
        thought1 = DiaryEntry.new("tuesday thoughts",("hello "*20))
        diary.add(thought1)
        expect(diary.all).to eq([thought1])
        end
        it 'returns the diary entry list object - two entries' do
        diary = Diary.new
        thought1 = DiaryEntry.new("tuesday thoughts",("hello "*20))
        thought2 = DiaryEntry.new("wednesday thoughts",("bye "*20))
        diary.add(thought1)
        diary.add(thought2)
        expect(diary.all).to eq([thought1, thought2])
        end
    end
    context 'Pairs integration tests count words output' do
        it "returns 1 word from single integer diary entry" do
        diary = Diary.new
        thought1 = DiaryEntry.new("tuesday thoughts","5")
        diary.add(thought1)
        expect(diary.count_words).to eq(1)
        end

        it "returns 21 words from single diary entry 'tuesday thoughts','hello '*21" do
        diary = Diary.new
        thought1 = DiaryEntry.new("tuesday thoughts",("hello "*21))
        diary.add(thought1)
        expect(diary.count_words).to eq(21)
        end

        it "returns 41 words from multiple diary entries" do
        diary = Diary.new
        thought1 = DiaryEntry.new("tuesday thoughts",("hello "*21))
        thought2 = DiaryEntry.new("wednesday thoughts",("bye "*20))
        diary.add(thought1)
        diary.add(thought2)
        expect(diary.count_words).to eq(41)
        end
    end

    context "solo unit tests" do
        
        it "constructs1" do
            diary = Diary.new
        end

        it "constructs2" do
            diary = Diary.new
            thought3 = DiaryEntry.new("A","B")
        end

        it "basic data 1" do
            thought3 = DiaryEntry.new("A","B")
            expect(thought3.title).to eq "A"
        end

        it "basic data 2" do
            thought3 = DiaryEntry.new("A","B")
            expect(thought3.contents).to eq "B"
        end

        it "basic data calc 1" do
            thought3 = DiaryEntry.new("A","B, B C")
            expect(thought3.count_words).to eq 3
        end

        it "basic data calc 2 - reading time integer" do
            thought3 = DiaryEntry.new("A","B, B C GG")
            expect(thought3.reading_time(2)).to eq 2
        end

        it "basic data calc 2 - reading time float(ceil)" do
            thought3 = DiaryEntry.new("A","B, B C GG KK")
            expect(thought3.reading_time(2)).to eq 3
        end

        it "basic data calc 2 - reading time float(ceil)" do
            thought3 = DiaryEntry.new("A","B, B C GG KK")
            expect(thought3.reading_time(2)).to eq 3
        end
    end

    context "solo unit reading_chunk tests" do
        it "first 10 words" do
            example = DiaryEntry.new("","c c c c c c c d e f g")
            result = example.reading_chunk(10,1)
            expect(result).to eq "c c c c c c c d e f"
        end
    
        it "2nd 4 words" do
            example = DiaryEntry.new("","c c c c c c c d e f g h i j k l m n")
            example.reading_chunk(10,1)
            result = example.reading_chunk(2,2)
            expect(result).to eq "g h i j"
            end
    
        it "3rd 2 words" do
            example = DiaryEntry.new("","c c c c c c c d e f g h i j k l m n")
            example.reading_chunk(10,1)
            example.reading_chunk(2,2)
            result = example.reading_chunk(4,1)
            expect(result).to eq "k l m n"
        end
    
        it "last 2 words" do
            example = DiaryEntry.new("","c c c c c c c d e f g h i j k l m n")
            example.reading_chunk(10,1)
            example.reading_chunk(2,2)
            example.reading_chunk(4,1)
            result = example.reading_chunk(4,1)
            expect(result).to eq "c c c c"
        end

#=begin
        it "extra check on split length string 1" do
            example = DiaryEntry.new("nae","c c c c c c c d e f g h i j k l m n p")
            example.reading_chunk(10,1)
            example.reading_chunk(2,2)
            example.reading_chunk(4,1)
            result = example.reading_chunk(4,1)
            expect(result).to eq "p"
        end
#=end
        it "extra check on split length string 2" do
            example = DiaryEntry.new("","c c c c c c c d e f g h i j k l m n p")
            example.reading_chunk(10,1)
            example.reading_chunk(2,2)
            example.reading_chunk(4,1)
            example.reading_chunk(20,1)
            result = example.reading_chunk(2,1)
            expect(result).to eq "c c"
        end
    
    end

    context "solo integration tests for reading" do

        it "total diary reading time from 1 entry" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*21))
            diary.add(thought1)
            expect(diary.reading_time(2)).to eq 11
        end

        it "total diary reading time from 3 entries" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*21))
            thought2 = DiaryEntry.new("weds thoughts",("hey "*200))
            thought3 = DiaryEntry.new("thurs thoughts",("yo "*6398))
            diary.add(thought1)
            diary.add(thought2)
            diary.add(thought3)
            expect(diary.reading_time(100)).to eq 67
        end

        it "find best entry 1" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*22))
            thought2 = DiaryEntry.new("weds thoughts",("hey "*23))
            thought3 = DiaryEntry.new("thurs thoughts",("yo "*29))
            diary.add(thought1)
            diary.add(thought2)
            diary.add(thought3)
            expect(diary.find_best_entry_for_reading_time(5,6)).to eq [thought3]
        end

        it "find best entry 2" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*201))
            thought2 = DiaryEntry.new("weds thoughts",("hey "*303))
            thought3 = DiaryEntry.new("thurs thoughts",("yo "*404))
            diary.add(thought1)
            diary.add(thought2)
            diary.add(thought3)
            expect(diary.find_best_entry_for_reading_time(398,1)).to eq [thought2]
        end

        it "find best entry 3" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*201))
            thought2 = DiaryEntry.new("weds thoughts",("hey "*303))
            thought3 = DiaryEntry.new("thurs thoughts",("yo "*404))
            diary.add(thought1)
            diary.add(thought2)
            diary.add(thought3)
            expect(diary.find_best_entry_for_reading_time(290,1)).to eq [thought1]
        end

        it "find best entry 4" do
            diary = Diary.new
            thought1 = DiaryEntry.new("tuesday thoughts",("hello "*201))
            thought2 = DiaryEntry.new("weds thoughts",("hey "*303))
            thought3 = DiaryEntry.new("thurs thoughts",("yo "*404))
            diary.add(thought1)
            diary.add(thought2)
            diary.add(thought3)
            expect{diary.find_best_entry_for_reading_time(100,1)}.to raise_error "nothing short enough"
        end



    end


end