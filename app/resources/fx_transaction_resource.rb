# frozen_string_literal: true

class FxTransactionResource < JSONAPI::Resource
  attributes :customer, :in_amount, :out_amount, :txn_code, :txn_date

  def self.creatable_fields(_options)
    [:customer_id]
  end

  def customer
    @model.customer.fullnames
  end

  def in_amount
    "#{@model.input_amount/100} #{@model.input_currency.code}"
  end

  def out_amount
    "#{@model.output_amount/100} #{@model.output_currency.code}"
  end

  def txn_date
    @model.created_at.to_date
  end
end
