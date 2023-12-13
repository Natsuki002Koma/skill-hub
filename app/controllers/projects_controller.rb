class ProjectsController < ApplicationController
  def index
  end
  
  def new
    @project = Project.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @project = Project.new(project_params)
    @users = User.where.not(id: current_user.id)
    if @project.save
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :description, user_ids: [])
  end
end
