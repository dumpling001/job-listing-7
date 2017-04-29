class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    drop_table :votes
    create_table :votes do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
