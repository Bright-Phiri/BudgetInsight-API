# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :show]
  skip_before_action :require_login, only: :create
  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def show_projects
    user = User.find(params[:id])
    if user.projects_count.zero?
      render json: {}, status: :not_found
    else
      render json: user.projects, status: :ok
    end
  end

  def create
    if User.exists?
      render json: { message: 'Access Denied: You do not have the required privileges to complete this action.' }, status: :forbidden
    else
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors.full_messages, status: :unprocessable_entity
      end
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
