class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    row = DB.execute("SELECT * FROM tasks WHERE id = ?", id.to_i).first
    row.nil? ? nil : build_task(row)
  end

  def self.all
    DB.execute("SELECT * FROM tasks").map { |row| build_task(row)}
  end

  def mark_as_done!
    @done = true
  end

  def save
    if @id
      DB.execute('UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?',
                  @title, @description, @done ? 1 : 0, @id)
    else
      DB.execute('INSERT INTO tasks (title, description, done) VALUES(?,?,?)',
                  @title, @description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
    end
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end


  private

  def self.build_task(row)
    new_task = Task.new(
      id: row[0],
      title: row[1],
      description: row[2],
      done: row[3].to_i == 1
    )
  end
end
