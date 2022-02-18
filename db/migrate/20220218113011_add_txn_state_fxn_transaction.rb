class AddTxnStateFxnTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :fx_transactions, :txn_state, :string, default: 'created'
  end
end
