class AddCheckoutSessionIdToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :checkout_session_id, :string
  end
end
