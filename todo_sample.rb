class Task
  attr_accessor :id, :name, :description

  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @description = params[:description]
  end
end

class Todo
  
  @@task_array = []

  def add(task)
    task_hash = { id: task.id, name: task.name, description: task.description }
    @tasks = @@task_array << task_hash
    puts "＜タスクの追加＞"
    puts "タスクNo.#{task.id} #{task.name}:#{task.description}  を追加しました。"
  end

  def index
    puts "＜＜タスクの一覧＞＞"
    @tasks.each do |task|
      puts "タスクNo.#{task[:id]} #{task[:name]}:#{task[:description]}"
    end
  end

  def destroy(**params)
    delete_task = @tasks[params[:id]-1]
    @tasks = @tasks - [delete_task]
    puts "＜タスクの削除＞"
    puts "タスクNo.#{delete_task[:id]} #{delete_task[:name]}:#{delete_task[:description]}  を削除しました。"
  end
end

task1 = Task.new(id: 1, name: "洗濯", description: "午前に干し終える")
task2 = Task.new(id: 2, name: "買物", description: "午後１時に行く")
task3 = Task.new(id: 3, name: "夕食", description: "午後５時に食べる")
my_todo = Todo.new
my_todo.add(task1)
my_todo.add(task2)
my_todo.add(task3)
my_todo.index
my_todo.destroy(id: 1)
my_todo.index