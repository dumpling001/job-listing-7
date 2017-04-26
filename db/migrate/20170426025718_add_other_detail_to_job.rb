class AddOtherDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company, :string
    add_column :jobs, :phone, :string
    add_column :jobs, :address, :string
    add_column :jobs, :source, :string
  end
end
