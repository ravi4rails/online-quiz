class AddCorrectAnswerInMultipleChoiceQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :multiple_choice_questions, :correct_answer, :string
  end
end
