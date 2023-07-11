# frozen_string_literal: true

class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :show, :destory]
  def index
    projects = Project.all
    render json: projects
  end

  def show
    render json: @project
  end

  def create
    user = User.find(params[:user_id])
    project = user.projects.create(project_params)
    if project.persisted?
      render json: project, status: :created
    else
      render json: project.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: @project.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
    head :no_content
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date)
  end

  def set_project
    user = User.find(params[:user_id])
    @project = user.projects.find(params[:id])
  end
end
