class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :tag
      t.string :name
      t.date :xvalue
      t.integer :yvalue

      t.timestamps
    end
  end
end
