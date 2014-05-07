class ChangeDatetimeFormatInPatients < ActiveRecord::Migration
  def up
  	change_column :patients, :date_of_birth, :date
  end

  def down
  	change_column :patients, :date_of_birth, :datetime
  end
end
