class CreateMcqOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :mcq_options do |t|
      t.string :option
      t.references :multiple_choice_question, foreign_key: true

      t.timestamps
    end
  end
end
