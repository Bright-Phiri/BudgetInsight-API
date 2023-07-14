class RemoveEndDateFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :end_date, :datetime
  end
end
