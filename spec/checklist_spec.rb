require 'checklist'

RSpec.describe "test" do
    
    it "array push works 1?" do
        x = Todolist.new
        x.add_tasks("get milk") 
        expect(x.view_tasks).to eq ["get milk"]
    end

    it "array push works 2?" do
        x = Todolist.new
        x.add_tasks("get milk") 
        x.add_tasks("get cheese") 
        expect(x.view_tasks).to eq ["get milk","get cheese"]
    end

    it "empty array test" do
        x = Todolist.new
        expect(x.view_tasks).to eq "[], nothing to do... great!"
    end

    it "empty Input test 1" do
        x = Todolist.new
        expect{x.add_tasks}.to raise_error
    end

    it "empty Input test 2" do
        x = Todolist.new
        expect{x.add_tasks("")}.to raise_error "entered a blank string"
    end

    it "completion/removal test 1" do
        x = Todolist.new
        x.add_tasks("get milk")
        x.complete_tasks("get milk")
        expect(x.view_tasks).to eq "[], nothing to do... great!"
    end

    it "completion/removal test 2" do
        x = Todolist.new
        x.add_tasks("get milk")
        x.add_tasks("get cheese") 
        x.complete_tasks("get milk")
        expect(x.view_tasks).to eq ["get cheese"]
    end

    it "completion/removal test 3" do
        x = Todolist.new
        x.add_tasks("get milk")
        x.add_tasks("get cheese") 
        x.complete_tasks("get mk")
        expect(x.view_tasks).to eq ["get milk","get cheese"]
    end

    it "completion/removal test 4" do
        x = Todolist.new
        x.add_tasks("get milk")
        x.add_tasks("get cheese") 
        expect(x.complete_tasks("get mk")).to eq "not a task on list"
    end

    
end