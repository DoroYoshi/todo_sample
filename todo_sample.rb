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
    puts "  タスクNo.#{task.id} #{task.name}:#{task.description}  を追加しました。"
  end

  def index
    puts "＜＜タスクの一覧＞＞"
    puts "  現在タスクはありません" if @tasks == []
    @tasks.each do |task|
      puts "  タスクNo.#{task.id} #{task.name}:#{task.description}"
    end
  end

  def destroy(**params)
    delete_task = 0
    @tasks.each do |task|
      if task.id == params[:id]
        @tasks = @tasks -[task]
        delete_task = task
      else
      end
    end
    puts "＜タスクの削除＞"
    puts "  タスクNo.#{delete_task.id} #{delete_task.name}:#{delete_task.description}  を削除しました。" 
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
my_todo.destroy(id: 1)
my_todo.index
my_todo.destroy(id: 2)
my_todo.index
my_todo.destroy(id: 3)
my_todo.index