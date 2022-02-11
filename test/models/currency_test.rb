# == Schema Information
#
# Table name: currencies
#
#  id         :uuid             not null, primary key
#  name       :string
#  code       :string
#  symbol     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class CurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
