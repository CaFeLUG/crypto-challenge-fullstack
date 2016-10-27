class AddSolutionHashToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :solution_hash, :text
  end
end
