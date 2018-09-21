class AddSequenceNumberToMultipleChoiceQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :multiple_choice_questions, :sequence_number, :integer
  end
end
