class AddJsonValueToUserResponseValues < ActiveRecord::Migration[5.2]
  def change
    add_column :user_response_values, :form_values, :jsonb, null: false, default: '{}'
  end
end
