begin
  require_relative '../app/controllers/task_controller'
rescue LoadError => e
  if e.message =~ /task_controller/
    describe "TasksController" do
      it "You need a 'task_controller.rb' file for your 'TasksController'" do
        fail
      end
    end
  else
    raise e
  end
end
