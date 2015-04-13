class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category_id, :string
  end
end