class CreateQuestionUserStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :question_user_statuses do |t|
      t.integer :user_id
      t.integer :multiple_choice_question_id
      t.string :status

      t.timestamps
    end
  end
end
