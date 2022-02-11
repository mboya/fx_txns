class CreateFxTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :fx_transactions, id: :uuid do |t|
      t.references :customer, null: false, foreign_key: true, type: :uuid
      t.integer :input_amount
      t.string :input_currency_id, type: :uuid
      t.integer :output_amount
      t.string :output_currency_id, type: :uuid
      t.float :exchange_rate, default: 0.0
      t.string :txn_code

      t.timestamps
    end

    add_index :fx_transactions, :input_currency_id
    add_index :fx_transactions, :output_currency_id
  end
end
