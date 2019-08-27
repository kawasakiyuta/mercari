class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :evaluator_id, null: false
      t.text :comment, null: false
      t.string :satisfaction_level, null: false
      t.boolean :seller_bit, null: false
      t.timestamps
    end
  end
end
