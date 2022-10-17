# File: lib/todo_list.rb
class TodoList
    def initialize
        @done =[]
        @notdone = []
    end
  
    def add(todo) # todo is an instance of Todo, Returns nothing
        if todo.status == "done" then @done.push(todo.task) else @notdone.push(todo.task)
        end
    end
  
    def incomplete
      @notdone
    end
  
    def complete
      @done
    end
  
    def give_up!
      @notdone.each {|task| 
        @done.push(task)
        @notdone.delete(task)
    }
      #@notdone = []
    end
  end
  
  # File: lib/todo.rb
  class Todo
    attr_reader :status
    def initialize(task) 
        fail "you input nothing..." unless task != ""
        @task = task.to_s
        @status = "not_done"
        
    end
  
    def task
      @task
    end
  
    def mark_done!
        @status = "done"
    end
  
    def done?
        @status == "done" ? true : false
    end
  end