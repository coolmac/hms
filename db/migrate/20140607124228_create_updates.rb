class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :heading
      t.text :content

      t.timestamps
    end
  end
end
