class TasksController < ApplicationController
    before_action :set_task, only: [:shou, :edit, :update, :destroy]
      
  def index
    @tasks = Task.all
  end
  
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    @task.update(task_params)
    redirect_to tasks_path
  end
  
  def destroy
    @task.destroy
    
      flash[:saccess] = 'taskは正常に削除されました'
      redirect_to tasks_url
  
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
