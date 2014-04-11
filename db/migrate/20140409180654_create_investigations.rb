class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.string :title
      t.string :units
      t.string :normal_min
      t.string :normal_max
      t.string :sub_category
      t.string :category

      t.timestamps
    end
  end
end
