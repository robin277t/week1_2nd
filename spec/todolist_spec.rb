require 'todolist'

RSpec.describe "TODO list tests" do
    context "check for blanks" do
        it "failing hard" do
            expect{todo_checker("")}.to raise_error "INVALID INPUT"
        end
    end

    context "string match tests" do
        it "no todo no. 1" do
            expect(todo_checker("this is a string")).to eq false
        end  
        
        it "wrong todo" do
            expect(todo_checker("#todo this task dude")).to eq false
        end 

        it "todo at start" do
            expect(todo_checker("#TODO this task dude")).to eq true
        end 

        it "todo in mid string" do
            expect(todo_checker("this task will need a #TODO my friend")).to eq true
        end 
    end

end