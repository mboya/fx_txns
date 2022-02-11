# == Schema Information
#
# Table name: fx_transactions
#
#  id                 :uuid             not null, primary key
#  customer_id        :uuid             not null
#  input_amount       :integer
#  input_currency_id  :string
#  output_amount      :integer
#  output_currency_id :string
#  exchange_rate      :float            default(0.0)
#  txn_code           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class FxTransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
