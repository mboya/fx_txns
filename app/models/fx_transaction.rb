# frozen_string_literal: true

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
class FxTransaction < ApplicationRecord
  belongs_to :customer
  belongs_to :input_currency, class_name: 'Currency', foreign_key: 'input_currency_id'
  belongs_to :output_currency, class_name: 'Currency', foreign_key: 'output_currency_id'

  default_scope { order(created_at: :desc) }

  before_create :update_output_amount

  def update_output_amount
    add_rate
    amount = money.from_cents(input_amount, input_currency.code).exchange_to(output_currency.code).fractional
    self.exchange_rate = rate
    self.output_amount = amount
    self.txn_code="txn-#{ref_no}"
  end

  def money
    Money
  end

  def add_rate
    money.add_rate(input_currency.code, output_currency.code, rate)
  end

  def rate
    1.24515
  end

  def ref_no
    SecureRandom.alphanumeric(8)
  end
end
