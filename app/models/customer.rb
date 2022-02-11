# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :uuid             not null, primary key
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  has_many :fx_transactions

  validates :firstname, :lastname, presence: true

  def fullnames
    "#{firstname}, #{lastname}"
  end
end
