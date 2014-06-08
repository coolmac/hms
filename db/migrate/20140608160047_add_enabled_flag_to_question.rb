class AddEnabledFlagToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :enabled, :integer
  end
end
