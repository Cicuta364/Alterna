class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :presentation, index: true, foreign_key: true
      t.string :question

      t.timestamps null: false
    end
  end
end
