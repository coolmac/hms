class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :title
      t.integer :category_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
