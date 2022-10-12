require 'test_driving'

RSpec.describe "DiaryEntry class tests" do
  context "check initialize title" do
    it "should return empty title" do
      example = DiaryEntry.new("","")
      result = example.title
      expect(result).to eq ""
    end
    it "should return empty contents" do
      example = DiaryEntry.new("","")
      result = example.contents
      expect(result).to eq ""
    end
  end

  context "check title and contents with arguments" do
    it "should return title 'title'" do
      example = DiaryEntry.new("title","")
      result = example.title
      expect(result).to eq "title"
    end
    it "should return content 'contents'" do
      example = DiaryEntry.new("","contents")
      expect(example.contents).to eq "contents"
    end
    it "should return content 'contents' and title 'title'" do
      example = DiaryEntry.new("title","contents")
      expect([example.title,example.contents]).to eq ["title","contents"]
    end
  end

  context "checking word counts" do
    it "checking 2 words" do
        example = DiaryEntry.new("","contents, more contents, contentsagain")
        result = example.count_words
        expect(result).to eq 4
    end
  end

  context "reading time checks" do
    it "checking 2 words" do
        example = DiaryEntry.new("","contents, more contents, contentsagain")
        result = example.reading_time(2)
        expect(result).to eq 2
    end

    it "checking many words" do
        example = DiaryEntry.new("","contents "*5000)
        result = example.reading_time(100)
        expect(result).to eq 50
    end

    it "checking many words" do
      example = DiaryEntry.new("","contents "*100)
      result = example.reading_time(3)
      expect(result).to eq 34
  end

  end

  context "reading_chunk tests" do
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

  end

end