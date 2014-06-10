class CreateVisitInvestigations < ActiveRecord::Migration
  def change
    create_table :visit_investigations do |t|
      t.integer :visit_id
      t.integer :investigation_id
      t.string :report

      t.timestamps
    end

    add_index :visit_investigations, :visit_id
    add_index :visit_investigations, [:visit_id, :investigation_id]

  end
end
