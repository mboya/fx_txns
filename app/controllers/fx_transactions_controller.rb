# frozen_string_literal: true

class FxTransactionsController < ApplicationController

  def create
    ActiveRecord::Base.transaction do
      # redis = Redis.new
      # redis.set("customer_id_#{params[:customer_id]}", customer_id)

      # r = redis.get(customer_id)

      # if r.nil?
      
      resource = FxTransaction.new fx_transaction_params
      if resource.save!
        render status: 201, json: json_resource(FxTransactionResource, resource)
      else
        render status: 422, json: json_errors(resource)
      end

      # else
      #   render json: { error: "customer transaction already being processed"}
      # end

      # redis.del(customer_id)

    rescue StandardError => e
      ActiveRecord::Rollback
      # redis.del(customer_id)
      render json: { error: e.message }
    end
  end

  def update
    resource = FxTransaction.find_by(id: params[:id])
    if resource.update(fx_transaction_params)
      render json: { msg: "updated" }, status: :accepted
    else
      ActiveRecord::Rollback
      render json: { error: e.message }
    end
  end

  def fx_transaction_params
    params.require(:data).require(:attributes)
          .permit(:customer_id, :input_amount, :input_currency_id, :output_currency_id, :txn_state)
  end

end
