# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  username        :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location        :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
