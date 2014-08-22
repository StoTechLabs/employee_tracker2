class CreateEmployeesAndProjects < ActiveRecord::Migration
  def change
    create_table :employees_and_projects do |t|
      t.belongs_to :employees
      t.belongs_to :projects
    end
  end
end
