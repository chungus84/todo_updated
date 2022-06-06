class Task
  attr_reader :id
  attr_accessor :title, :description
  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end


end
