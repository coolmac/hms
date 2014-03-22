class ChangeMobileColumnInPatients < ActiveRecord::Migration
  def change
  	change_column :patients, :mobile, :string
  end
end
