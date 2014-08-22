require 'spec_helper'

describe Project do

  it "adds the employee id to the projects table" do
    new_project = Project.create({:name => "Project ABC"})
    new_employee = Employee.create({:name => "Bob"})
    Project.add_employee_id_to_project(new_project.name, new_employee.name)
    p Project.find_by(name: "Project ABC")
    expect(Project.find_by(name: "Project ABC").employee_id).to be_an_instance_of Fixnum
   end

end
