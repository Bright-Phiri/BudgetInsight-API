class RemoveStartDateFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :start_date, :datetime
  end
end
