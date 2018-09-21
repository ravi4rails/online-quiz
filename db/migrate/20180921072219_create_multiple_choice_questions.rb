class CreateMultipleChoiceQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :multiple_choice_questions do |t|
      t.text :question
      t.references :test_paper, foreign_key: true

      t.timestamps
    end
  end
end
