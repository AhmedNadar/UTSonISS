class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :project_id, :string
  end
end
