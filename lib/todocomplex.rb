# File: lib/todo_list.rb
class TodoList
    def initialize
        @list =[]
    end
  
    def add(todo) # todo is an instance of Todo, Returns nothing
        @list.push(todo)
    end
  
    def incomplete
        @list.select{|incom| incom.done == false}.map{|incom2| incom2.task}
    end
  
    def complete
        @list.select{|com| com.done}.map{|com2| com2.task}
    end
  
    def give_up!
        @list.each {|x| x.mark_done!}
    end
  end
  
  # File: lib/todo.rb
  class Todo
    attr_accessor :done
    def initialize(task) 
        fail "you input nothing..." unless task != ""
        @task = task.to_s
        @done = false  
    end
  
    def task
      @task
    end
  
    def mark_done!
        @done = true
    end
  
  #  def done?
  #      @done
  #  end
  end