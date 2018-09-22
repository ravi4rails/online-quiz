class CreateUserResponseValues < ActiveRecord::Migration[5.2]
  def change
    create_table :user_response_values do |t|
      t.references :submission, foreign_key: true
      t.references :multiple_choice_question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
