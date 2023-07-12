# frozen_string_literal: true

class Api::V1::ReportsController < ApplicationController
  def expense_summary
    summary_data = {
      total_expenses: Expense.sum(:amount),
      projects_count: Project.count,
      categories_count: Category.count
    }
    render json: summary_data
  end

  def category_expense
    category_expenses = Category.includes(:expenses).map do |category|
      {
        category: category.name,
        total_expenses: category.expenses.sum(:amount)
      }
    end
    render json: category_expenses
  end

  def project_expense
    project_expenses = Project.includes(:expenses).map do |project|
      {
        project: project.name,
        total_expenses: project.expenses.sum(:amount)
      }
    end
    render json: project_expenses
  end
end
