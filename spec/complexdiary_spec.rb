require 'complexdiary'

describe Diary do
  describe 'Diary.all' do
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
  describe 'Diary.count_words' do
    it "returns 1 word from single integer diary entry" do
      diary = Diary.new
      thought1 = DiaryEntry.new("tuesday thoughts",(5))
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
end