require 'pry'

class Employee < ActiveRecord::Base
  belongs_to(:division)
  has_many(:projects)

  def self.add_division_id_to_employee(division_name, employee_name)
      division = Division.find_by(name: division_name)
      division_id = division.id

      employee = Employee.find_by(name: employee_name)
      employee.division_id = division_id
      employee.save
  end

  def self.list_employee_by_division(division_name)
    names = []
    division = Division.find_by(name: division_name)
    employees = Employee.where(division_id: division.id)
    employees.each { |emp| names << emp["name"] }
    names
  end

end
