# Require needed files
require './test/sets/users'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Users

  def create_all
    create_customer_users
    puts "Built customer users"
    create_employee_users
    puts "Built employee users"
  end

  def create_all_quietly
    create_users
    create_employee_users
  end
end
