require 'pry'

class Project < ActiveRecord::Base
  belongs_to(:employee)

  def self.add_employee_id_to_project(project_name, employee_name)
      employee = Employee.find_by(name: employee_name)
      employee_id = employee.id

      project = Project.find_by(name: project_name)
      project.employee_id = employee.id
      project.save
      # binding.pry
  end

end
