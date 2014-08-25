require 'active_record'
require 'rspec'
require 'employee'
require 'project'
require 'division'
require 'contribution'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |div| div.destroy }
    Project.all.each { |pro| pro.destroy }
    Contribution.all.each { |cont| cont.destroy }
  end
end
