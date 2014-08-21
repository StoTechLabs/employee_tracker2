class Employee < ActiveRecord::Base
  belongs_to(:division)
  belongs_to(:project)

  # def add_division_id_to_employee(division_name, employee_name)


  # end
end
