# frozen_string_literal: true

class Api::V1::ExpensesController < ApplicationController
  before_action :set_expense, only: [:update, :show, :destory]
  def index
    expenses = Expense.preload(:projects)
    render json: ExpensesRepresenter.new(expenses).as_json
  end

  def show
    render json: ExpenseRepresenter.new(@expense).as_json
  end

  def create
    project = Project.find(params[:project_id])
    category = Category.find(params[:category_id])
    expense = project.expenses.build(expense_params.merge(category_id: category.id))
    if expense.save
      render json: ExpenseRepresenter.new(expense).as_json, status: :created
    else
      render json: expense.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @expense.update(expense_params)
      render json: ExpenseRepresenter.new(@expense).as_json, status: :ok
    else
      render json: @expense.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @expense.destroy!
    head :no_content
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :description, :amount, :category_id)
  end

  def set_expense
    project = Project.find(params[:project_id])
    @expense = project.expenses.find(params[:id])
  end
end
