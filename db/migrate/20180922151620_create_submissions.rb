class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.references :user, foreign_key: true
      t.references :test_paper, foreign_key: true

      t.timestamps
    end
  end
end
