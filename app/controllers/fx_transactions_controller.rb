# frozen_string_literal: true

class FxTransactionsController < ApplicationController

  def create
    ActiveRecord::Base.transaction do
      resource = FxTransaction.new fx_transaction_params
      if resource.save!
        render status: 201, json: json_resource(FxTransactionResource, resource)
      else
        render status: 422, json: json_errors(resource)
      end

    rescue StandardError => e
      ActiveRecord::Rollback
      render json: { error: e.message }
    end
  end

  def fx_transaction_params
    params.require(:data).require(:attributes)
          .permit(:customer_id, :input_amount, :input_currency_id, :output_currency_id)
  end

end
