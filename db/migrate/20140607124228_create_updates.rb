class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :heading
      t.string :link

      t.timestamps
    end
  end
end
