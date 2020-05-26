class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    # @task = Task.find(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    # pegue a hash restaurant dentro de params e só permita os campos
    # name, address e rating (qualquer outro não passará)
    params.require(:task).permit(:title, :details, :completed)
  end
end
