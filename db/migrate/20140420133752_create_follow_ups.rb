class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.datetime :follow_up_date
      t.text :final_diagnosis
      t.text :comments
      t.integer :visit_id

      t.timestamps
    end

    add_index :follow_ups, :visit_id

  end
end
