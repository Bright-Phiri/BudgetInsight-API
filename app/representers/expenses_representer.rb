# frozen_string_literal: true

class ExpensesRepresenter
  def initialize(expenses)
    @expenses = expenses
  end

  def as_json
    expenses.map do |expense|
      {
        id: expense.id,
        title: expense.title,
        description: expense.description,
        amount: expense.amount,
        category: expense.category.name,
        project_name: expense.project.name
      }
    end
  end

  private

  attr_reader :inventories
end
