class AddEnabledToInvestigations < ActiveRecord::Migration
  def change
    add_column :investigations, :enabled, :integer
  end
end
