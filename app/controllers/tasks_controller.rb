class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update]
  before_action :correct_user, only: [:destroy]

  
  def index
    if logged_in?
      @tasks = current_user.tasks.order(id: :desc)
      @task = current_user.tasks.build  # form_with 用
      
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to root_url
    else
      @tasks = current_user.tasks
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :index
    end
  end

  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'Taskを削除しました。'
    redirect_to root_url
  end
  
   private

# Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
 
 def set_task
    @task = Task.find(params[:id])
    unless current_user == @task.user
      redirect_to root_url
    end
 end
  
  def correct_user
    unless @task
      redirect_to root_url
    end
    @task = current_user.tasks.find_by(id: params[:id])
  end
  
  
  
end


