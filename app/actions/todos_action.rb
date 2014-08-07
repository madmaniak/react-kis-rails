class TodosAction < ApplicationAction

  def add_new_task
    Task.create do |task|
      task.note = params[:note]
      task.complete = false
    end

    { json: TodoSerializer.index(params), each_serializer: TodoSerializer, root: 'todos' }
  end

end
