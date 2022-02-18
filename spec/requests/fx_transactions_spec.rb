require 'rails_helper'

RSpec.describe "Fx Transactions", type: :request do

  it "validates required fields" do
    headers = { "Accept" => "application/vnd.api+json" }
    body = {
              "data": {
                "type": "fx-transactions",
                "attributes": {
                  "customer_id": "a013f31d-8dac-410b-8b0b-2e84bfb2fe50",
                  "input_amount": 2000,
                  "output_currency_id": "223983e4-bc8f-4552-97bb-f8c4a26f1095",
                  "input_currency_id": "55ed6764-8f46-40dc-9771-a382e1a43048"
                }
              }
            }

    post '/fx-transactions', params: body, headers: headers
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)).to eql("error" => "Validation failed: Customer must exist, Input currency must exist, Output currency must exist") 
  end

end