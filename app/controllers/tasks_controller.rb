class TasksController < ApplicationController
  # task schema
  # create_table "tasks", force: :cascade do |t|
  #   t.string   "title"
  #   t.text     "description"
  #   t.datetime "due"
  #   t.integer  "interval"
  # end



  # list of tasks
  def index
    @tasks = Task.all
  end

  # form to create new task
  def new
    @task = Task.new
  end

  # POST handler to receive data from form from #new
  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  # display a single task
  def show
    @task = Task.find(params[:id])
  end

  # display form for editing a single task
  def edit
    @task = Task.find(params[:id])
  end

  # POST handler to receive data from form from #edit
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  # action to delete the thing
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due, :interval)
  end
end
