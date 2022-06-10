class Router
  def initialize
    @controller = TasksController.new
  end

  def run
    print_welcome
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1 then @controller.index
    when 2 then @controller.create
    when 3 then @controller.update
    when 4 then @controller.delete
    when 5 then @controller.task_complete
    end
  end

  def actions
    [
      "List all tasks",
      "Add a task",
      "Edit a task title & url",
      "Delete a task",
      "mark a task as complete"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end


  def print_welcome
    puts "-----------------------------"
    puts   "Welcome to Your ToDo List!"
    puts "-----------------------------"
  end
end
