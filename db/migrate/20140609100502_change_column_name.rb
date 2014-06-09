class ChangeColumnName < ActiveRecord::Migration
  def up
  	rename_column :updates, :content, :link
  	change_column :updates, :link, :string
  end

  def down
  end
end
