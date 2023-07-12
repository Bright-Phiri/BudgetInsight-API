# frozen_string_literal: true

class ExpenseRepresenter
  def initialize(expense)
    @expense = expense
  end

  def as_json
    {
      id: expense.id,
      title: expense.title,
      description: expense.description,
      amount: expense.amount,
      category: expense.category.name,
      project_name: expense.project.name
    }
  end

  private

  attr_reader :expense
end
