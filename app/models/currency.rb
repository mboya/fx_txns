# frozen_string_literal: true

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
class Currency < ApplicationRecord
  validates :code, :name, :symbol, presence: true
  validates :code, uniqueness: true

  default_scope { order(created_at: :desc) }
end
