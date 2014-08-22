require 'spec_helper'


describe Employee do

  it "adds the division id to the employee table" do
    new_division = Division.create({:name => "Division ABC"})
    new_employee = Employee.create({:name => "Bob"})
    Employee.add_division_id_to_employee(new_division.name, new_employee.name )
    expect(Employee.find_by(name: "Bob").division_id).to be_an_instance_of Fixnum
  end

  it "lists the employees of one division" do
    new_division = Division.create({:name => "Division ABC"})
    new_employee = Employee.create({:name => "Bob"})
    new_employee2 = Employee.create({:name => "Ben"})
    Employee.add_division_id_to_employee(new_division.name, new_employee.name )
    Employee.add_division_id_to_employee(new_division.name, new_employee2.name )
    employees = Employee.list_employee_by_division(new_division.name)
    expect(employees).to eq ['Bob', 'Ben']
  end

end
