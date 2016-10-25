class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.text :payload
      t.integer :score

      t.timestamps
    end
  end
end
