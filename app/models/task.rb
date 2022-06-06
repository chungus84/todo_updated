class Task
  attr_reader :id
  attr_accessor :title, :description

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def save
    if @id
      DB.execute('UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?', @title, @description, @done == 1, @id)
    else
      DB.execute('INSERT INTO tasks (title, description, done) VALUES(?,?,?', @title, @url, @description)
      @id = DB.last_insert_row_id
    end
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end
