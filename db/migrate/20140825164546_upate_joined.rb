class UpateJoined < ActiveRecord::Migration
  def change
    rename_table :employees_and_projects, :employees_projects
  end

end
