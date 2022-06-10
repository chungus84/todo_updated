require_relative '../views/task_view'

class TasksController
  def initialize
    @view = TaskView.new
  end

  def index
    @view.display(Task.all)
  end

  def create
    title = @view.ask_for_stuff("title")
    desc = @view.ask_for_stuff("description")
    new_task = Task.new(title: title, description: desc)
    new_task.save
    index
  end

  def update
    index
    task = Task.find(@view.ask_for_stuff("id"))
    field_to_update!(task)
    task.save
    index
  end

  def delete
    index
    task = Task.find(@view.ask_for_stuff("id"))
    task.destroy
    task.save
    index
  end

  def task_complete
    task = Task.find(@view.ask_for_stuff('id'))
    task.mark_as_done!
    task.save
  end

  def field_to_update!(task)
    field = @view.ask_for_stuff("update 'title or 'description'? ")
    case field
    when 'title' then task.title = @view.ask_for_stuff("What's the new title?")
    when 'description' then task.description = @view.ask_for_stuff("What's the new description?")
    else
      "invalid selection"
    end
  end
end
