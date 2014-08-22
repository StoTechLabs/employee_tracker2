require 'pry'

class Project < ActiveRecord::Base
  has_and_belongs_to_many(:employees)

  def self.add_employee_id_to_project(project_name, employee_name)
    employee = Employee.find_by(name: employee_name)
    employee_id = employee.id

    project = Project.find_by(name: project_name)
    project.employee_id = employee.id
    project.save
  end

  def self.list_employee_by_project(project_name)
    names = []
    project = Project.find_by(name: project_name)
    project.employee_id
    employee = Employee.find_by(id: project.employee_id)
    employee.name
  end






end
