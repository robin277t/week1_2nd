require 'todocomplex'

RSpec.describe "todo complex challenge tests: " do
    
    context "UNIT tests Todo class: " do
        
        it "Initialize a task but blank" do
            expect {item1 = Todo.new("")}.to raise_error "you input nothing..."
        end

        it "basic task return works" do
            item1 = Todo.new("get bread")
            expect(item1.task).to eq "get bread"
        end

        it "basic task data type return" do
            item1 = Todo.new(5)
            expect(item1.task).to eq "5"
        end

        it "check on done? method" do
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milk")
            item1.mark_done!
            expect(item1.done).to eq true
        end
    
    end

    context "UNIT tests TodoList class: " do
        
        it "check on blank list not done" do
            list1 = TodoList.new
            expect(list1.incomplete).to eq []
        end

        it "check on blank list done" do
            list1 = TodoList.new
            expect(list1.complete).to eq []
        end


    
    end

    context "INTEGRATION tests: " do
        
        it "checks adding of a single Todo to the list as undone" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            list1.add(item1)
            expect(list1.incomplete).to eq ["get milk"]
        end

        it "checks adding of multiple Todo's to the list as undone" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            expect(list1.incomplete).to eq ["get milk", "get milky", "get mylk"]
        end

        it "checks marking of all Todo's to the list from undone to done 1" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            list1.give_up!
            expect(list1.complete).to eq ["get milk", "get milky", "get mylk"]
        end

        it "checks marking of all Todo's to the list from undone to done 2" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            list1.give_up!
            expect(list1.incomplete).to eq []
        end

        it "checks marking of a single item from undone to done list" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            item2.mark_done!
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            expect(list1.incomplete).to eq ["get milk", "get mylk"]
        end

        it "checks multiple items from undone to done list 1" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            item1.mark_done!
            item3.mark_done!
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            expect(list1.incomplete).to eq ["get milky"]
        end

        it "checks multiple items from undone to done list 2" do
            list1 = TodoList.new
            item1 = Todo.new("get milk")
            item2 = Todo.new("get milky")
            item3 = Todo.new("get mylk")
            item1.mark_done!
            item3.mark_done!
            list1.add(item1)
            list1.add(item2)
            list1.add(item3)
            expect(list1.complete).to eq ["get milk", "get mylk"]
        end
    end
end