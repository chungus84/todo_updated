begin
 require_relative '../models/task'
rescue LoadError => e
  if e.message =~ /task/
    describe "Task" do
      it "You need a 'task.rb' file for your 'Task' model" do
        fail
      end
    end
  else
    raise e
  end
end

describe "Task", :task do
  it "should be initialized with has properties" do
    properties = {id: 1, tile: "Wake up", description: "Get out of bed", done: false }
    task = Task.new(properties)
    expect(task).to be_a(Task)
  end

  describe "#id" do
    it "should return the task id" do
      task = Task.new({ id: 3 })
      expect(task.id).to eq(3)
    end
  end

  describe "#id" do
    it "should not allow you to change the id" do
      task = Task.new({ id: 12 })
      expect { task.id = 33 }.to raise_error(NoMethodError)
    end
  end

  describe "#title" do
    it "Should allow you to access and change the title" do
      task = Task.new({ title: "My first title" })
      expect(task.title).to eq("My first title")
      task.title = "My updated title"
      expect(task.title).to eq("My updated title")
    end
  end

  describe "#description" do
    it "Should allow you to access and change the description" do
      task = Task.new({ title: "My first description" })
      expect(task.title).to eq("My first description")
      task.title = "My updated description"
      expect(task.title).to eq("My updated description")
    end
  end

  describe "#done?" do
    it "Should return the status of done" do
      properties = {id: 1, tile: "Wake up", description: "Get out of bed", done: false }
      task = Task.new(properties)
      expect(task.done?).to eq(false)
    end
  end

  describe "#mark_as_done!" do
    it "Should change the status of done to true" do
      properties = {id: 1, tile: "Wake up", description: "Get out of bed", done: false }
      task = Task.new(properties)
      expect(task.mark_as_done!).to eq(true)
    end
  end

end
