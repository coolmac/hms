class ChangeColumnNameInVisit < ActiveRecord::Migration
  def change  
  	rename_column :visits, :fm_history, :fms_history
  end
end
