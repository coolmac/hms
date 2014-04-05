class UpdateDescriptionsTable < ActiveRecord::Migration
  
  def change
  	remove_column :descriptions, :category_id
  end

end