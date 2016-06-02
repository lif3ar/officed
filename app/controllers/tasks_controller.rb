class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_same_user, except: [:index, :new, :create]

  def index
    @tasks = current_user.tasks.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
    if @task.save
      @task.create_activity :create, owner: current_user
      flash[:success] = "Task has been added."
      redirect_to @task
    else
      flash[:alert] = "Task has not been created."
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @task.update(task_params)
    if @task.save
      @task.create_activity :update, owner: current_user
      flash[:success] = "Task has been updated."
      redirect_to @task
    else
      flash[:alert] = "Changes has not been saved."
      render 'edit'
    end
  end

  def destroy
    @task.create_activity :destroy, owner: current_user
    @task.destroy
    redirect_to @tasks
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :date, :priority, :all_company_tags)
  end

  def require_same_user
    if @task.user_id != current_user.id
      redirect_to root_path
    end
  end

end
