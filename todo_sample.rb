class ToDo
  attr_accessor :add, :index, :destroy
  
  def add
    todoes = []
    puts todoes << "タスクNo.#{@id} => タスク名:#{@name} , 詳細:#{@description}"
    puts "タスクを追加しました"
    puts todoes
  end

  def index
    @todoes.each do |todo|
      puts todo
    end
  end

  def destroy
    todo = @todoes.find(params[:id])
    todo.delete
  end
end

class Task < ToDo
  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @description = params[:description]
  end
end

task1 = Task.new(id: 1, name: "洗濯", description: "午前中に干し終える")
puts task1.add
task2 = Task.new(id: 2, name: "買い物", description: "午後１時にスーパーに行く")
puts task2.add
task3 = Task.new(id: 3, name: "夕食準備", description: "午後５時より開始する")
puts task3.add
task4 = Task.new(id: 4, name: "勉強", description: "午後３時より１時間勉強する")
puts task4.add
task5 = Task.new(id: 5, name: "昼寝", description: "午後２時半から20分間昼寝する")
puts task5.add

puts task1.index