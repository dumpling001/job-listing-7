class AddWorkplaceIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :workplace_id, :integer
  end
end
