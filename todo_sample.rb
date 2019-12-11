class Task
  attr_accessor :id, :name, :description

  @@id = 1
  def initialize(**params)
    @id = @@id
    @name = params[:name]
    @description = params[:description]
    @@id += 1
  end
end

class Todo
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
    puts "＜タスクの追加＞"
    display(task)
  end

  def index
    puts "＜＜タスクの一覧＞＞"
    puts "  現在、タスクはありません" if @tasks == []
    @tasks.each do |task|
      display(task)
    end
  end

  def destroy(id:)
    puts "＜タスクの削除＞"
    task = @tasks.find { |task| task.id == id }
    return puts "  タスクNo.#{id}のタスクはありません" if task == nil
    @tasks.delete(task)
    display(task)
  end

  def display(task)
    puts "  タスクNo.#{task.id} #{task.name}:#{task.description}" 
  end
end

task1 = Task.new(name: "洗濯", description: "午前に干し終える")
task2 = Task.new(name: "買物", description: "午後１時に行く")
task3 = Task.new(name: "夕食", description: "午後５時に食べる")
my_todo = Todo.new
my_todo.add(task1)
my_todo.add(task2)
my_todo.add(task3)
my_todo.index
# my_todo.destroy(id: 1)
# my_todo.index
my_todo.destroy(id: 2)
my_todo.index
# my_todo.destroy(id: 3)
# my_todo.index
my_todo.destroy(id: 5)