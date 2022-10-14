test 1: x=DiaryEntry.new("tuesday thoughts","hello "*20), call diary.all => x
test 2: as above, but no instances of diary entry
test 3: as above, but 2 instances of diary entry

test4: create diaryentry instance once "tuesday thoughts","hello "*21) => 21
test5: create 2 diaryentry instances "tuesday thoughts","hello " *21,"wednesday thoughts",("bye "*20)  => 41

test6: basic check