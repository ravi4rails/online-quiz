class CreateTestPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_papers do |t|
      t.string :name
      t.date :date_to_take_test

      t.timestamps
    end
  end
end
