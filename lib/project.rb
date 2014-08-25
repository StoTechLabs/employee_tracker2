require 'pry'

class Project < ActiveRecord::Base
  has_many :contributions
  has_many :employees, through: :contributions

  def self.add_employee_id_to_project(project_name, employee_name)
    employee = Employee.find_by(name: employee_name)
    project = Project.find_by(name: project_name)
    project.employees << employee
  end

  def self.list_employee_by_project(project_name)

    project = Project.find_by(name: project_name)

    project.employees.each {|e| puts e.name}
  end

end
