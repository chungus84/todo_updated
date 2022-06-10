require 'sqlite3'

# Instantiate a constant variable for DB
dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir,"db/todo.db"))

# Requiring all .rb files in app
Dir[File.join(dir, "app/**/*.rb")].sort.each { |file| require file }

Router.new.run
