class Task
  def initialize(**params)
    @id = params[:id]
    @name = params[:name]
    @description = params[:description]
  end
end

class Todo

  @@task_array = []

  def self.add(**params)
    @task = { id: params[:id], name: params[:name], description: params[:description] }
    @tasks = @@task_array << @task
    puts "タスクNo.#{params[:id]} #{params[:name]}:#{params[:description]}  を追加しました。"
  end

  def self.index
    puts "＜＜タスクの一覧＞＞"
    @tasks.each do |task|
      puts "タスクNo.#{task[:id]} #{task[:name]}:#{task[:description]}"
    end
  end

  def self.destroy(id)
    delete_task = @tasks[id-1]
    @tasks = @tasks - [delete_task]
    puts "タスクNo.#{delete_task[:id]} #{delete_task[:name]}:#{delete_task[:description]}  を削除しました。"
  end
end

Todo.add(id: 1, name: "洗濯", description: "午前に干し終える")
Todo.add(id: 2, name: "買物", description: "午後１時に行く")
Todo.add(id: 3, name: "夕食", description: "午後５時に食べる")
Todo.add(id: 4, name: "勉強", description: "午後３時に勉強する")
Todo.add(id: 5, name: "昼寝", description: "午後２時に昼寝する")

Todo.index
Todo.destroy(3)
Todo.index