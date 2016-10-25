class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.string :proof_hash
      t.integer :points

      t.timestamps
    end
  end
end
