# implemente la class ( commentaire necessaire sinon erreur)
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy] # dry evite de réutiliser
  # tasks à chaque fois

  def index
    @tasks = Task.all
  end

  def show; end

  def new # cree une nouvelle tache avec ce qui est mis dans le form
    @task = Task.new
  end

  def create # cree une nouvelle tache
    @task = Task.new(task_params) # utilise la méthode privée task_params pour securiser
    if @task.save # save le tache
      redirect_to task_path(@task.id) # si réussi, redirige vers la tache et ses détails
    else
      render :new, status: :unprocessable_entity # si échoue, redirige vers le form
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params # filtre les param autorisés pour eviter les failles
    params.require(:task).permit(:title, :details, :completed)
  end
end
