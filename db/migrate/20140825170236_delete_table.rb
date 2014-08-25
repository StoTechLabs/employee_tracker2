class DeleteTable < ActiveRecord::Migration
  def change
    drop_table :employee_and_projects
  end
end
