class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def index
    @projects = Project.filter(params.slice(:name_search, :customer_id, :project_type)).page(params[:page]).per(params[:per_page] || 15)
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :brand_id, :customer_id)
  end
end