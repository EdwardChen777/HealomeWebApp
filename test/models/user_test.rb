require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should validate_presence_of(:username)
  should validate_uniqueness_of(:username).case_insensitive

  

end
