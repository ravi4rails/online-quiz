class AddStatusToMultipleChoiceQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :multiple_choice_questions, :status, :string
  end
end
