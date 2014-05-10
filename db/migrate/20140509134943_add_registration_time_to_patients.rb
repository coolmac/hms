class AddRegistrationTimeToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :registration_time, :date
  end
end
