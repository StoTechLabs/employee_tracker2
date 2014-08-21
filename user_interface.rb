require 'active_record'
require './lib/employee'
require './lib/division'
require './lib/project'

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
      puts "Enter in full name of employee"
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
      puts "Enter in the name of a Project that you would like to add"
      project_name = gets.chomp
      new_project = Project.create({:name => project_name})
    when 'l'
      Project.all.each { |i| puts i.name}
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
      puts "\nPress 'y' to add an employee to a division or anything else to continue"
      user_input = gets.chomp
      if user_input = "y" || "Y"
        puts "Type the name of the division"
        division_choice = gets.chomp
        puts "Enter the name of the employee"
        employee_choice = gets.chomp
        Employee.add_division_id_to_employee(division_choice, employee_choice)
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



welcome
