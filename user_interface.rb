require 'active_record'
require './lib/employee'
require './lib/division'
require './lib/project'
require './lib/contribution'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  system 'clear'
  main_menu
end

def main_menu
  puts "***EMPLOYEE TRACKER***"
  puts "[1] Employee menu"
  puts "[2] Projects menu"
  puts "[3] Divisions menu"
  puts "[x] Exit"
  puts "Enter the number of a menu to continue"
  user_input = gets.chomp
  if user_input == '1'
    employee_menu
  elsif user_input == '2'
    projects_menu
  elsif user_input == '3'
    divisions_menu
  elsif user_input == 'x'
    exit
  else
    puts "Invalid entry"
    main_menu
  end
end



def employee_menu
  puts "\n*** EMPLOYEE MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add an employee, 'l' to list employees,r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the full name of the employee"
      employee_name = gets.chomp
      new_emp = Employee.create({:name => employee_name})
    when 'l'
      Employee.all.each { |employee| puts employee.name }
    when 'r'
      main_menu
    when 'e'
      puts "Bye"
    else
      puts "That was not a valid entry"
    end
  end
end


def projects_menu
  puts "\n*** PROJECTS MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a project, 'l' to list projects, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the name of a Project that you would like to add"
      project_name = gets.chomp
      new_project = Project.create({:name => project_name})
    when 'l'
      Project.all.each { |i| puts i.name}
      puts "\nPress 'a' to add an employee to the project, press 'l' to list the employee on a project."
      user_input = gets.chomp
      if user_input == 'a'
        puts "Type the name of the project"
        project_choice = gets.chomp
        Employee.all.each { |i| puts i.name}
        puts "Enter the name of the employee that you want to add"
        employee_choice = gets.chomp
        Project.add_employee_id_to_project(project_choice, employee_choice)
      else user_input == 'l'
        puts "Type the name of the project"
        @project_choice = gets.chomp
        Project.list_employee_by_project(@project_choice)
        puts "\nPress 'u' to add update the contribution information for an employee"
        user_input = gets.chomp
        if user_input = "a"
          add_contribution
        end
      end
    when 'r'
      main_menu
    when 'e'
      puts "Bye"
      exit
    else
      puts "That was not a valid entry"
    end
  end
end

def divisions_menu
  puts "\n*** DIVISIONS MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a division, 'l' to list divisions, 'r' return to Main menu"
    puts "Press 'e' exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter in the name of a Division that you would like to add"
      division_name = gets.chomp
      new_division = Division.create({:name => division_name})
    when 'l'
      Division.all.each { |i| puts i.name}
      puts "\nPress 'a' to add an employee, press 'l' to list the employees in a division."
      user_input = gets.chomp
      if user_input == 'a'
        puts "Type the name of the division"
        division_choice = gets.chomp
        Employee.all.each { |i| puts i.name}
        puts "Enter the name of the employee"
        employee_choice = gets.chomp
        Employee.add_division_id_to_employee(division_choice, employee_choice)
      else user_input == 'l'
        puts "Type the name of the division"
        division_choice = gets.chomp
        puts Employee.list_employee_by_division(division_choice)
      end
    when 'r'
      main_menu
    when 'e'
      puts "Bye"
      exit
    else
      puts "That was not a valid entry"
    end
  end
end

def add_contribution
  puts "Enter the name of the employee"
  employee_choice = gets.chomp
  employee = Employee.find_by(name: employee_choice)
  project = Project.find_by(name: @project_choice)
  puts  "Enter in the description of this employee's contribution to the project"
  description = gets.chomp
  project.contributions.each do |c|
    if employee.id == c.employee_id
      c.description = description
      c.save
    end
  end
  binding.pry
end

welcome



















