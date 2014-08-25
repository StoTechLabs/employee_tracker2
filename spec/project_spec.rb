require 'spec_helper'

describe Project do

  it "has many employees" do
    new_project = Project.create({:name => "Project ABC"})
    new_employee = Employee.create({:name => "Bob"})
    new_employee2 = Employee.create({:name => "Ben"})
    new_project.employees << new_employee
    new_project.employees << new_employee2
    # Contribution.new(project_id: new_project.id, employee_id: new_employee.id)
    expect(new_project.employees).to eq [new_employee, new_employee2]
  end


  # it "adds the employee id to the projects table" do
  #   new_project = Project.create({:name => "Project ABC"})
  #   new_employee = Employee.create({:name => "Bob"})
  #   Project.add_employee_id_to_project(new_project.name, new_employee.name)
  #   Project.find_by(name: "Project ABC")
  #   expect(Project.find_by(name: "Project ABC").employee_id).to be_an_instance_of Fixnum
  #  end

  #  it "lists the employees of one division" do
  #   new_project = Project.create({:name => "Project ABC"})
  #   new_employee = Employee.create({:name => "Bob"})
  #   new_employee2 = Employee.create({:name => "Ben"})
  #   Project.add_employee_id_to_project(new_project.name, new_employee.name )
  #   Project.add_employee_id_to_project(new_project.name, new_employee2.name )
  #   employees = Project.list_employee_by_project(new_project.name)
  #   expect(employees).to eq 'Ben'
  # end

end
