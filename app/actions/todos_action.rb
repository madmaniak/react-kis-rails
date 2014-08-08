class TodosAction < ApplicationAction

  def new_task
    Task.create do |task|
      task.note = params[:note]
      task.complete = false
    end
  end

  def task_toggle
    task = Task.find_by id: params[:id]
    task.complete = params[:complete]
    task.save
  end

  def complete_all_tasks
    Task.update_all complete: true
  end

  def restart_all_tasks
    Task.update_all complete: false
  end

  def delete_task
    Task.find_by(id: params[:id]).delete
  end

end
