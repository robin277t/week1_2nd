class Todolist

    def initialize
        @list = []
    end

    def view_tasks
        if @list == []
            return "#{@list}, nothing to do... great!"
        else
            @list
        end
    end

    def add_tasks(input)
        if input == ""
            fail "entered a blank string"
        end
        @list.push(input)
    end

    def complete_tasks(done)
        if @list.include?(done)
            @list.delete(done)
        else
            "not a task on list"
        end
    end

end