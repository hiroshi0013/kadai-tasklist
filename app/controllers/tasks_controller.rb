class TasksController < ApplicationController
  
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
    @task = Task.find(params[:id])
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end
  
  def destroy
   @task = Task.find(params[:id])
    @task.destroy
    
      flash[:saccess] = 'taskは正常に削除されました'
      redirect_to tasks_url
  
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
