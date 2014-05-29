class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :favourite_prescriptions, :frequency
  	remove_column :favourite_prescriptions, :duration
  	remove_column :favourite_prescriptions, :route
  	rename_column :favourite_prescriptions, :medicine_name, :name
  end

  def down
  end
end
