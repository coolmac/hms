class CreateVisitDescriptions < ActiveRecord::Migration
  def change
    create_table :visit_descriptions do |t|
      t.integer :visit_id
      t.integer :description_id

    end

    add_index :visit_descriptions, :visit_id

  end
end
