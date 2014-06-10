class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.string :title
      t.string :units
      t.string :normal_min
      t.string :normal_max
      t.string :sub_category
      t.string :category
      t.integer :enabled

      t.timestamps
    end

    add_index :investigations, [:category, :enabled]
    add_index :investigations, [:category, :sub_category, :enabled]

  end
end
