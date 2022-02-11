require 'database_cleaner'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

DatabaseCleaner.clean_with(:truncation)

Currency.find_or_create_by!({
                              name: Faker::Currency.name,
                              code: 'USD',
                              symbol: Faker::Currency.symbol
                            })

Currency.find_or_create_by!({
                              name: Faker::Currency.name,
                              code: 'CAD',
                              symbol: Faker::Currency.symbol
                            })

3.times do
  Customer.find_or_create_by!({
                                firstname: Faker::Name.first_name,
                                lastname: Faker::Name.last_name
                              })
end

FxTransaction.create!({
                        customer: Customer.first,
                        input_amount: 1000,
                        input_currency_id: Currency.second.id,
                        output_currency_id: Currency.first.id
                      })
