class TaskView
  def display(tasks)
    tasks.each do |task|
      puts "Task id: #{task.id.to_i}, title: #{task.title}, description #{task.description}, #{task.done} "
    end
  end

  def ask_for_stuff(stuff)
    puts stuff.to_s
    print "> "
    user_input = gets.chomp
    user_input.to_i == true ? user_input.to_i : user_input
  end
end
