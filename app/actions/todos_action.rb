class TodosAction < ApplicationAction

  def new_task
    Task.create do |task|
      task.note = params[:note]
      task.complete = false
    end

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

  def task_toggle
    task = Task.find_by id: params[:id]
    task.complete = params[:complete]
    task.save

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

  def complete_all_tasks
    Task.update_all complete: true

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

  def restart_all_tasks
    Task.update_all complete: false

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

  def delete_task
    Task.find_by(id: params[:id]).delete

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

end
